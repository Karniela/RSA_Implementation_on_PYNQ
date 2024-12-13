#include "rsa.h"
#include <cstdio>
#include "hls_math.h"
#include <ap_int.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip> // for std::hex
using namespace std;

// Montgomery Algorithm

data_t Montgomery(data_t N, data_t a, data_t b){
	#pragma HLS INLINE OFF
	ap_uint<BITWIDTH+2> m = 0;
	data_t d1, d2;
	Montgomery:
	for(int i = 0; i < BITWIDTH; i++){
		#pragma HLS PIPELINE II=1
		// if(a & 1){
		// 	m = m + b;
		// }
		// if(m & 1){
		// 	m = m + N; // -> overflow ?
		// }
		if(((a & 1) && ((b & 1) ^ (m & 1)))){
			m = m + b + N;
		}
		else if((!(a & 1) && (m & 1))){
			m = m + N;
		}
		else if(((a & 1))){
			m = m + b;
		}
		// d1 = (a & 1) ? b : data_t(0);
		// d2 = (((m & 1) && !(((a & 1)) && ((b & 1)))) || ((a & 1) && (b & 1) && (!(m & 1)))) ? N : data_t(0);

		// m = m + d1 + d2; 
		// m = ((a & 1) && ((b & 1) ^ (m & 1))) ? ap_uint<BITWIDTH+2>(m + b + N) : (!(a & 1) && (m & 1)) ? ap_uint<BITWIDTH+2>(m + N) : ((a & 1)) ? ap_uint<BITWIDTH+2>(m + b) : ap_uint<BITWIDTH+2>(m);
		m = m >> 1;
		a = a >> 1;
	}
	if(m >= N){
		m = m - N;
	}
	return m;

}

data_t mod_product(data_t b, data_t N) {
	#pragma HLS INLINE OFF
    ap_uint<BITWIDTH+1> m = 0;
    ap_uint<BITWIDTH+1> t = b;
	Mod_Product:
    for(int i = 0; i < BITWIDTH; i++) {
		#pragma HLS PIPELINE II=1

        if(t + t > N){
        	t = t + t - N;
        }
        else{
        	t = t + t;
        }
    }
	m = m + t;

    return m;
}

void rsa(data_t d, data_t N, data_t y, data_t &x){
	#pragma HLS INTERFACE mode=s_axilite port=return
	#pragma HLS INTERFACE mode=s_axilite port=d
	#pragma HLS INTERFACE mode=s_axilite port=N
	#pragma HLS INTERFACE mode=s_axilite port=y
	#pragma HLS INTERFACE mode=s_axilite port=x

	data_t t = mod_product(y, N);
	data_t m = 1;
	RSA_TOP:
	for(int i = 0; i < BITWIDTH; i++){
		#pragma HLS PIPELINE OFF
		if(d & 1){
			m = Montgomery(N, m, t);
		}
		t = Montgomery(N, t, t);
		d = d >> 1;
	}
	x = m;

}

