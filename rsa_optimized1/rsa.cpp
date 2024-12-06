#include "rsa.h"
#include <cstdio>
#include "hls_math.h"
#include <ap_int.h>

// Modular Product Function
data_t mod_product(data_t a, data_t b, data_t N) {
    #pragma HLS INLINE OFF
    ap_uint<BITWIDTH + 1> m = 0;
    ap_uint<BITWIDTH + 1> t = b;

    MOD_PRODUCT:
    for (int i = 0; i < BITWIDTH; i++) {
        #pragma HLS PIPELINE OFF
        // #pragma HLS PIPELINE II=3
		// #pragma HLS UNROLL FACTOR=8
        if (a & 1) {
            if (m + t >= N) {
                m = m + t - N;
            } else {
                m = m + t;
            }
        }

        if (t + t > N) {
            t = t + t - N;
        } else {
            t = t + t;
        }
        a = a >> 1;
    }
    return m;
}

// Modular Exponentiation Function
void mod_exp(data_t y, data_t d, data_t N, data_t &result) {
    #pragma HLS INLINE OFF
    data_t t = y;
    data_t m = 1;

    MOD_EXP:
    for (int i = 0; i < BITWIDTH; i++) {
		// #pragma HLS UNROLL FACTOR=8
        #pragma HLS PIPELINE OFF
        // #pragma HLS PIPELINE II=1
        if (d & 1) {
            m = mod_product(m, t, N);
        }
        t = mod_product(t, t, N);
        d = d >> 1;
    }
    result = m;
}

// RSA Function with DATAFLOW
void rsa(data_t d, data_t N, data_t y, data_t &x) {
    #pragma HLS INTERFACE mode=s_axilite port=return
    #pragma HLS INTERFACE mode=s_axilite port=d
    #pragma HLS INTERFACE mode=s_axilite port=N
    #pragma HLS INTERFACE mode=s_axilite port=y
    #pragma HLS INTERFACE mode=s_axilite port=x

    #pragma HLS DATAFLOW

    // Result variable for mod_exp
    data_t result;
    mod_exp(y, d, N, result);
    x = result;
}
