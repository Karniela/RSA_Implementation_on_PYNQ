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

void multi_stage_mul_h_add_m(data_t a, data_t m, data_t t, data_t &temp){
    #pragma HLS INLINE OFF
    data_t d1;
    d1 = (a & 1) ? t : data_t(0);
    temp = m + d1;
}

void multi_stage_mul_h_update_m_t_a(data_t temp, data_t &m, data_t &t, data_t &a){
    #pragma HLS INLINE OFF
    m = temp;
    a = a >> 1;
    t = t << 1;
}

data_t multi_stage_mul_h(data_t a, half_data_t b) {
    #pragma HLS INLINE OFF
    data_t m = 0;
    data_t t = b;
    data_t temp;

    for (int i = 0; i < BITWIDTH/2 + 1; i++) {
        #pragma HLS PIPELINE II=1
        multi_stage_mul_h_add_m(a, m, t, temp);
        multi_stage_mul_h_update_m_t_a(temp, m, t, a);
    }
    return m;
}

void multi_stage_mul_x0_add_m(ap_int<BITWIDTH/2+1> a, ap_int<BITWIDTH/2+1> m, ap_int<BITWIDTH/2+1> t, ap_int<BITWIDTH/2+1> &temp){
    #pragma HLS INLINE OFF
    ap_int<BITWIDTH/2+1> d1;
    d1 = (a & 1) ? t : ap_int<BITWIDTH/2+1>(0);
    temp = m + d1;
}
void multi_stage_mul_x0_update_m_t_a(ap_int<BITWIDTH/2+1> temp, ap_int<BITWIDTH/2+1> &m, ap_int<BITWIDTH/2+1> &t, ap_int<BITWIDTH/2+1> &a){
    #pragma HLS INLINE OFF
    m = temp;
    a = a >> 1;
    t = t << 1;
}
ap_int<BITWIDTH/2+1> multi_stage_mul_x0(ap_int<BITWIDTH/2+1> a, ap_int<BITWIDTH/2+1> b) {
    #pragma HLS INLINE OFF
    ap_int<BITWIDTH/2 + 1> m = 0;
    ap_int<BITWIDTH/2 + 1> temp;
    ap_int<BITWIDTH/2 + 1> t = b;

    for (int i = 0; i < BITWIDTH/2 + 1; i++) {
        #pragma HLS PIPELINE II=1
        multi_stage_mul_x0_add_m(a, m, t, temp);
        multi_stage_mul_x0_update_m_t_a(temp, m, t, a);
    }
    return m;
}

half_data_t mod_product(half_data_t a, half_data_t b, half_data_t N) {

    ap_uint<BITWIDTH/2+1> m = 0;
    ap_uint<BITWIDTH/2+1> t = b;
    MOD_PRODUCT:
    for(int i = 0; i < BITWIDTH/2; i++) {
		#pragma HLS PIPELINE off

    	if(a & 1){
    		if (m + t >= N) { // If exp is odd
				m = m + t - N;
			}
			else{
				m = m + t;
			}
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
    #pragma HLS INLINE OFF
    result = 1;
    half_data_t b = base % mod;
    MOD_EXP:
    for (int i = 0; i < BITWIDTH/2; i++) {
        #pragma HLS PIPELINE OFF
        if (exp & 1) {
            result = mod_product(b, result, mod);
        }
        b = mod_product(b, b, mod);
        exp = exp >> 1;
        if (exp == 0) break;
    }
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
        x0 = multi_stage_mul_x0(q, x0);
        x0 = x1 - x0;
        x1 = t;
    }

    if (x1 < 0) x1 += m0;
    x2 = x1;
    // return x1;
}


void rsa(half_data_t p, half_data_t q, data_t d, data_t N, data_t y, data_t &x) {
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE s_axilite port=p
    #pragma HLS INTERFACE s_axilite port=q
    #pragma HLS INTERFACE s_axilite port=N
    #pragma HLS INTERFACE s_axilite port=y
    #pragma HLS INTERFACE s_axilite port=d
    #pragma HLS INTERFACE s_axilite port=x

    // Precompute d_p, d_q, and q_inv
    #pragma HLS PIPELINE OFF

    half_data_t dp = d % (p - 1);
    half_data_t dq = d % (q - 1);
    half_data_t q_inv;
    mod_inverse(q, p, q_inv);

    // Compute m_p and m_q using modular exponentiation
    half_data_t mp, mq;
    mod_exp(y, dp, p, mp);
    mod_exp(y, dq, q, mq);
	
    // Combine results using CRT
    data_t h;
    h = (mp > mq) ? mp - mq : mq - mp;
    h = mod_product(h, q_inv, p);
    if (mp < mq) {
        h = p - h;
    }
    h = multi_stage_mul_h(h, q);
    x = h + mq;
}
