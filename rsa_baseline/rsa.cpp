#include "rsa.h"
#include <cstdio>
#include "hls_math.h"
#include <ap_int.h>

// Modular Exponentiation Function
data_t mod_exp(data_t base, data_t exp, data_t mod) {
    #pragma HLS INLINE OFF
    data_t result = 1;
    data_t b = base % mod; // Handle initial modular reduction

    for (int i = 0; i < BITWIDTH; i++) {
        #pragma HLS PIPELINE

        if (exp & 1) { // If exp is odd
            #pragma HLS bind_op variable=result op=mul impl=fabric
            result = (result * b);
            //result = result % mod;
        }
        exp = exp >> 1; // Divide exp by 2
        if (exp == 0)
            break;
        #pragma HLS bind_op variable=b op=mul impl=fabric
        b = (b * b);
        //b = b % mod;
    }

    return result;
}

// RSA Top-Level Function
void rsa(data_t d, data_t N, data_t y, data_t &x) {
    #pragma HLS INTERFACE mode=s_axilite port=return
    #pragma HLS INTERFACE mode=s_axilite port=d
    #pragma HLS INTERFACE mode=s_axilite port=N
    #pragma HLS INTERFACE mode=s_axilite port=y
    #pragma HLS INTERFACE mode=s_axilite port=x

    // Disable DSP usage globally
    // #pragma HLS ALLOCATION instances=div limit=0

    x = mod_exp(y, d, N);
}
