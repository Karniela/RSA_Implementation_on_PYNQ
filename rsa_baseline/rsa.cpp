#include "rsa.h"
#include <cstdio>
#include "hls_math.h"
#include <ap_int.h>


data_t mod_exp(data_t base, data_t exp, data_t mod) {
    data_t result = 1;
    data_t b = base % mod; // Handle initial modular reduction

    for(int i = 0; i < BITWIDTH; i++) {
        if (exp & 1) { // If exp is odd
            result = (result * b) % mod;
        }
        exp = exp >> 1; // Divide exp by 2
        if(exp == 0)
        	break;
        b = (b * b) % mod;
    }

    return result;
}


void rsa(data_t d, data_t N, data_t y, data_t &x){

	x = mod_exp(y, d, N);
}

