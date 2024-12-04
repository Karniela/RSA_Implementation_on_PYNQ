#include "ap_int.h"

#ifndef RSA_H_
#define RSA_H_

#define NUM_SAMPLES 100
#define BITWIDTH 256


typedef ap_uint<BITWIDTH> data_t;
typedef ap_uint<BITWIDTH/2> half_data_t;

void rsa(ap_uint<BITWIDTH/2+1> mu_p, ap_uint<BITWIDTH/2+1> mu_q, half_data_t p, half_data_t q, data_t d, data_t N, data_t y, data_t &x);
#endif
