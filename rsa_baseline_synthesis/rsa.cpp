#include "rsa.h"
#include <cstdio>
#include "hls_math.h"
#include <ap_int.h>

// Optimized modular exponentiation without memory dependencies
data_t mod_exp(data_t base, data_t exp, data_t mod) {
#pragma HLS INLINE

    data_t result = 1;
    data_t b = base % mod; // Initial modular reduction

    // Create an array to store intermediate results for parallel reduction
    data_t intermediate_results[BITWIDTH];
    #pragma HLS ARRAY_PARTITION variable=intermediate_results complete

    // Precompute powers and conditional multipliers
    for (int i = 0; i < BITWIDTH; i++) {
#pragma HLS UNROLL
        if (exp & (1 << i)) {
            intermediate_results[i] = b;
        } else {
            intermediate_results[i] = 1; // Neutral element for multiplication
        }
        b = (b * b) % mod; // Update b for the next bit
    }

    // Combine the intermediate results
    for (int i = 0; i < BITWIDTH; i++) {
#pragma HLS UNROLL
        result = (result * intermediate_results[i]) % mod;
    }

    return result;
}

// RSA core function
void rsa(data_t d, data_t N, data_t y, data_t &x) {
    #pragma HLS INTERFACE mode=s_axilite port=return
    #pragma HLS INTERFACE mode=s_axilite port=d
    #pragma HLS INTERFACE mode=s_axilite port=N
    #pragma HLS INTERFACE mode=s_axilite port=y
    #pragma HLS INTERFACE mode=s_axilite port=x

	#pragma HLS DATAFLOW



    // Compute modular exponentiation
    x = mod_exp(y, d, N);
}


