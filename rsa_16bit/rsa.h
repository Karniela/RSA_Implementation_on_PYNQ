#include "ap_int.h"

#ifndef RSA_H_
#define RSA_H_

#define NUM_SAMPLES 100
#define BITWIDTH 16


typedef ap_uint<16> data_t;

void rsa(data_t d, data_t N, data_t y, data_t &x);
#endif
