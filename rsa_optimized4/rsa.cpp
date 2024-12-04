#include "rsa.h"
#include <cstdio>
#include "hls_math.h"
#include <ap_int.h>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip> // for std::hex
using namespace std;

// Helper function for modular exponentiation

half_data_t mod_product(data_t a, half_data_t b, half_data_t N) {

    ap_uint<BITWIDTH/2+1> m = 0;
    ap_uint<BITWIDTH/2+1> t = b;
    MOD_PRODUCT:
    for(int i = 0; i < BITWIDTH; i++) {
		#pragma HLS PIPELINE off

    	if(a & 1){
    		if (m + t >= N) { // If exp is odd
				m = m + t - N;
			}
			else{
				m = m + t;
			}
			// printf("m = %d\n", m);
    	}

        if(t + t > N){
        	t = t + t - N;
        }
        else{
        	t = t + t;
        }
		a = a >> 1;
    }

    return m;
}


void mod_exp(data_t base, half_data_t exp, half_data_t mod, half_data_t &result) {
    // #pragma HLS INLINE
    result = 1;
    data_t b = base;
    MOD_EXP:
    for (int i = 0; i < BITWIDTH/2; i++) {
        #pragma HLS PIPELINE OFF
        if (exp & 1) {
            // result = (result * b) % mod;
            result = mod_product(b, result, mod);
        }
        b = (b * b) % mod;
        // b = mod_product_full(b, b, mod);
        exp = exp >> 1;
        if (exp == 0) break;
    }
}

void barrett_mod(data_t x, half_data_t N, ap_uint<BITWIDTH/2+1> MU, int K, half_data_t &y){

    ap_uint<BITWIDTH*3/2+1> q2 = x * MU;
    ap_uint<BITWIDTH/2+1> q3 = q2 >> (K << 1);
    ap_uint<BITWIDTH/2+1> t = x - q3 * N;
    if(t >= N){
        t -= N;
    }
    y = t;

}


// Helper function for modular inverse using Extended Euclidean Algorithm
void mod_inverse(half_data_t a, half_data_t mod, half_data_t &x2) {
    #pragma HLS INLINE OFF
    if (mod == 0) {
        std::cerr << "Error: Modulus is zero in mod_inverse\n";
        // return 0;  // Or throw an exception
    }

    ap_uint<BITWIDTH/2> m0 = mod;
	ap_int<BITWIDTH/2+1> t, q;
    ap_int<BITWIDTH/2+1> x0 = 0, x1 = 1;
    MOD_INVERSE:
    for (int i = 0; i < BITWIDTH/2; i++){
        #pragma HLS PIPELINE OFF
		if(a <= 1)
			break;
        q = a / mod;
        t = mod;
        mod = a % mod;
        a = t;

        t = x0;
        x0 = x1 - q * x0;
        x1 = t;
    }

    if (x1 < 0) x1 += m0;
    x2 = x1;
    // return x1;
}


void rsa(ap_uint<BITWIDTH/2+1> mu_p, ap_uint<BITWIDTH/2+1> mu_q, half_data_t p, half_data_t q, data_t d, data_t N, data_t y, data_t &x) {
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE s_axilite port=p
    #pragma HLS INTERFACE s_axilite port=q
    #pragma HLS INTERFACE s_axilite port=N
    #pragma HLS INTERFACE s_axilite port=y
    #pragma HLS INTERFACE s_axilite port=d
    #pragma HLS INTERFACE s_axilite port=x

    // Precompute d_p, d_q, and q_inv
    #pragma HLS PIPELINE OFF

    // MU = (1 << 2 * K) // n
    half_data_t dp = d % (p - 1);
    // half_data_t dp;
    // barrett_mod(d, p-1, mu_p, BITWIDTH/2, dp);
    half_data_t dq = d % (q - 1);
    // half_data_t dq;
    // barrett_mod(d, q-1, mu_q, BITWIDTH/2, dq);
    half_data_t q_inv;
    mod_inverse(q, p, q_inv);
    // half_data_t q_inv = mod_inverse(q, p);

    // Compute m_p and m_q using modular exponentiation
    half_data_t mp, mq;
    mod_exp(y, dp, p, mp);
    mod_exp(y, dq, q, mq);
	
    // Combine results using CRT
    data_t h = ((mp > mq ? mp - mq : mq - mp) * q_inv) % p;
    if (mp < mq) {
        h = p - h;
    }
    x = mq + h * q;
}
