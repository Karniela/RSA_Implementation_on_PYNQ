#include "rsa.h"
#include <cstdio>
#include "hls_math.h"
#include <ap_int.h>
using namespace std;

// Montgomery Algorithm

data_t Montgomery(data_t N, data_t a, data_t b){
	ap_uint<BITWIDTH+2> m = 0;
	
	Montgomery:
	for(int i = 0; i < BITWIDTH; i++){
		#pragma HLS PIPELINE off
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

data_t mod_product(ap_uint<BITWIDTH+1> a, data_t b, data_t N) {

    ap_uint<BITWIDTH+1> m = 0;
    ap_uint<BITWIDTH+1> t = b;
	Mod_Product:
    for(int i = 0; i < BITWIDTH+1; i++) {
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
        a = a >> 1; // Divide exp by 2
        // if(a == 0)
        // 	break;
    }

    return m;
}

void rsa(data_t d, data_t N, data_t y, data_t &x){
	#pragma HLS INTERFACE mode=s_axilite port=return
	#pragma HLS INTERFACE mode=s_axilite port=d
	#pragma HLS INTERFACE mode=s_axilite port=N
	#pragma HLS INTERFACE mode=s_axilite port=y
	#pragma HLS INTERFACE mode=s_axilite port=x

	// #pragma HLS DATAFLOW
	#pragma HLS PIPELINE OFF
	ap_uint<BITWIDTH+1> a =  ap_uint<BITWIDTH+1>(1) << BITWIDTH;
	data_t t = mod_product(a, y, N);
	data_t m = 1;
	RSA_TOP:
	for(int i = 0; i < BITWIDTH; i++){
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

