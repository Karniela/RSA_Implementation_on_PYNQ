#include "rsa.h"
#include <cstdio>
#include "hls_math.h"
#include <ap_int.h>

// Montgomery Algorithm

data_t Montgomery(data_t N, data_t a, data_t b){
	ap_uint<BITWIDTH*2> m = 0;
	for(int i = 0; i < BITWIDTH; i++){
		#pragma HLS PIPELINE off
		if(a & 1){
			m = m + b;
//			 printf("a & 1, m = m + b = %d\n", m);
		}
		if(m & 1){
			m = m + N; // -> overflow ?
//			 printf("m & 1, m = m + N = %d\n", m);
		}
		m = m >> 1;
//		 printf("m at i = %d is %d\n", i, m);
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
	ap_uint<BITWIDTH+1> a = 1 << BITWIDTH;
	data_t t = mod_product(a, y, N);
	printf("t after mod_product = %d\n", t);
	data_t m = 1;
	for(int i = 0; i < BITWIDTH; i++){
		if(d & 1){
//			printf("m and t before montgomery = %d, %d\n", m, t);
			m = Montgomery(N, m, t);
//			printf("m after montgomery = %d\n", m);
		}
//		printf("t before montgomery = %d\n", t);
		t = Montgomery(N, t, t);
//		printf("t after montgomery = %d\n", t);
		d = d >> 1;
		if(d == 0)
			break;
	}
	x = m;

}

