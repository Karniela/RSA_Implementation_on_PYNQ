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
		#pragma HLS PIPELINE II=4
		if(a & 1){
			m = m + b;
		}
		if(m & 1){
			m = m + N; // -> overflow ?
		}
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
		#pragma HLS PIPELINE OFF

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

	// #pragma HLS DATAFLOW
	// #pragma HLS PIPELINE OFF
	// ap_uint<BITWIDTH+1> a =  ap_uint<BITWIDTH+1>(1) << BITWIDTH;
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
		// if(d == 0)
		// 	break;
	}
	x = m;

}

