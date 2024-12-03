#include "rsa.h"
#include <cstdio>
#include "hls_math.h"
#include <ap_int.h>

// Exponentiation by squaring -> replace mul with add

data_t mod_product(data_t a, data_t b, data_t N) {

    data_t m = 0;
    data_t t = b;

    for(int i = 0; i < BITWIDTH; i++) {
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
        if(a == 0)
        	break;
    }

    return m;
}

data_t mod_exp(data_t y, data_t d, data_t N){
	data_t t = y;
	data_t m = 1;
	for(int i = 0; i < BITWIDTH; i++){
		if(d & 1){
			m = mod_product(m, t, N);
		}
		t = mod_product(t, t, N);

		d = d >> 1;
		if(d == 0){
			break;
		}
	}
	return m;
}


void rsa(data_t d, data_t N, data_t y, data_t &x){
      #pragma HLS INTERFACE mode=s_axilite port=return
      #pragma HLS INTERFACE mode=s_axilite port=d
      #pragma HLS INTERFACE mode=s_axilite port=N
	  #pragma HLS INTERFACE mode=s_axilite port=y
	  #pragma HLS INTERFACE mode=s_axilite port=x

	  #pragma HLS DATAFLOW
	x = mod_exp(y, d, N);
}

