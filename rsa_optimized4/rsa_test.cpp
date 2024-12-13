#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "rsa.h"
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip> // for std::hex

using namespace std;

int main(){
	FILE *f_input;
	data_t N, d;
	half_data_t p, q;
	data_t y, x;

	f_input = fopen("input.txt","r");
	ofstream outfile("output.txt");

	char dec_str[BITWIDTH];
	stringstream ss;

	fscanf(f_input, "%s", dec_str);
	p = half_data_t(dec_str);
	cout << "The 128-bit p in decimal is: " << dec << p << endl;

	fscanf(f_input, "%s", dec_str);
	q = half_data_t(dec_str);
	cout << "The 128-bit q in decimal is: " << dec << q << endl;

	fscanf(f_input, "%s", dec_str);
	N = ap_uint<BITWIDTH>(dec_str);
	cout << "The 256-bit N in decimal is: " << dec << N << endl;

	fscanf(f_input, "%s", dec_str);
	d = ap_uint<BITWIDTH>(dec_str);
	cout << "The 256-bit d in decimal is: " << dec << d << endl;

	for(int i = 0; i < NUM_SAMPLES; i++){
		fscanf(f_input, "%s", dec_str);
		y = ap_uint<BITWIDTH>(dec_str);
		cout << "The 256-bit y in decimal is: " << dec << y << endl;
		rsa(p, q, d, N, y, x);
		cout << "The 256-bit x in decimal is: " << dec << x << endl;
		ss.clear();
		ss.str("");
		ss << dec << x;

		outfile << ss.str() << endl;
	}

	fclose(f_input);
	outfile.close();

	printf ("Comparing against output data \n");
	if (system("diff -w output.txt golden.txt")) {
	fprintf(stdout, "*******************************************\n");
	fprintf(stdout, "FAIL: Output DOES NOT match the golden output\n");
	fprintf(stdout, "*******************************************\n");
	   return 1;
	} else {
	fprintf(stdout, "*******************************************\n");
	fprintf(stdout, "PASS: The output matches the golden output!\n");
	fprintf(stdout, "*******************************************\n");
	   return 0;
	}
}
