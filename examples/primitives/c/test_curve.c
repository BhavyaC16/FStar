#include <stdint.h>
#include <stdio.h>
#include "fstarlib.h"

#define Bignum_Parameters_norm_length 5 
#define Bignum_Parameters_a24_prime 121665 
#define Bignum_Bigint_template int
#define Bignum_Bigint_template_const Bignum_Bigint_template
#define Bignum_Bigint_bigint uint64*
#define Bignum_Bigint_bigint_wide uint128_t*
#define Bignum_Bigint_bytes uint8*

typedef uint64_t limb;
typedef limb felem[5];

typedef struct Curve_Point_point Curve_Point_point;
struct Curve_Point_point{
Bignum_Bigint_bigint x;
Bignum_Bigint_bigint y;
Bignum_Bigint_bigint z;
};


void fmul(felem output, const felem in2, const felem in) {
  uint128_t t[5];
  limb r0,r1,r2,r3,r4,s0,s1,s2,s3,s4,c;

  r0 = in[0];
  r1 = in[1];
  r2 = in[2];
  r3 = in[3];
  r4 = in[4];

  s0 = in2[0];
  s1 = in2[1];
  s2 = in2[2];
  s3 = in2[3];
  s4 = in2[4];

  t[0]  =  ((uint128_t) r0) * s0;
  t[1]  =  ((uint128_t) r0) * s1 + ((uint128_t) r1) * s0;
  t[2]  =  ((uint128_t) r0) * s2 + ((uint128_t) r2) * s0 + ((uint128_t) r1) * s1;
  t[3]  =  ((uint128_t) r0) * s3 + ((uint128_t) r3) * s0 + ((uint128_t) r1) * s2 + ((uint128_t) r2) * s1;
  t[4]  =  ((uint128_t) r0) * s4 + ((uint128_t) r4) * s0 + ((uint128_t) r3) * s1 + ((uint128_t) r1) * s3 + ((uint128_t) r2) * s2;

  r4 *= 19;
  r1 *= 19;
  r2 *= 19;
  r3 *= 19;

  t[0] += ((uint128_t) r4) * s1 + ((uint128_t) r1) * s4 + ((uint128_t) r2) * s3 + ((uint128_t) r3) * s2;
  t[1] += ((uint128_t) r4) * s2 + ((uint128_t) r2) * s4 + ((uint128_t) r3) * s3;
  t[2] += ((uint128_t) r4) * s3 + ((uint128_t) r3) * s4;
  t[3] += ((uint128_t) r4) * s4;

                  r0 = (limb)t[0] & 0x7ffffffffffff; c = (limb)(t[0] >> 51);
  t[1] += c;      r1 = (limb)t[1] & 0x7ffffffffffff; c = (limb)(t[1] >> 51);
  t[2] += c;      r2 = (limb)t[2] & 0x7ffffffffffff; c = (limb)(t[2] >> 51);
  t[3] += c;      r3 = (limb)t[3] & 0x7ffffffffffff; c = (limb)(t[3] >> 51);
  t[4] += c;      r4 = (limb)t[4] & 0x7ffffffffffff; c = (limb)(t[4] >> 51);
  r0 +=   c * 19; c = r0 >> 51; r0 = r0 & 0x7ffffffffffff;
  r1 +=   c;      c = r1 >> 51; r1 = r1 & 0x7ffffffffffff;
  r2 +=   c;

  output[0] = r0;
  output[1] = r1;
  output[2] = r2;
  output[3] = r3;
  output[4] = r4;
}

void fmul2(uint128_t t[9], const felem in2, const felem in) {
  limb r0,r1,r2,r3,r4,s0,s1,s2,s3,s4,c;

  r0 = in[0];
  r1 = in[1];
  r2 = in[2];
  r3 = in[3];
  r4 = in[4];

  s0 = in2[0];
  s1 = in2[1];
  s2 = in2[2];
  s3 = in2[3];
  s4 = in2[4];

  t[0]  =  ((uint128_t) r0) * s0;
  t[1]  =  ((uint128_t) r0) * s1 + ((uint128_t) r1) * s0;
  t[2]  =  ((uint128_t) r0) * s2 + ((uint128_t) r2) * s0 + ((uint128_t) r1) * s1;
  t[3]  =  ((uint128_t) r0) * s3 + ((uint128_t) r3) * s0 + ((uint128_t) r1) * s2 + ((uint128_t) r2) * s1;
  t[4]  =  ((uint128_t) r0) * s4 + ((uint128_t) r4) * s0 + ((uint128_t) r3) * s1 + ((uint128_t) r1) * s3 + ((uint128_t) r2) * s2;

  t[5] = ((uint128_t) r4) * s1 + ((uint128_t) r1) * s4 + ((uint128_t) r2) * s3 + ((uint128_t) r3) * s2;
  t[6] = ((uint128_t) r4) * s2 + ((uint128_t) r2) * s4 + ((uint128_t) r3) * s3;
  t[7] = ((uint128_t) r4) * s3 + ((uint128_t) r3) * s4;
  t[8] = ((uint128_t) r4) * s4;
}


void decode_scalar(uint8 scalar[32]){
  scalar[0] &= 248;
  scalar[31] &= 127;
  scalar[31] |= 64;
}

void decode_input(uint64 x[5], uint8 sc[32]){
  uint64* s = (uint64*)sc;
  x[0] = s[0] & 0x7ffffffffffff;
  x[1] = ((s[0] >> 51) + (s[1] << 13)) & 0x7ffffffffffff;
  x[2] = ((s[1] >> 38) + (s[2] << 26)) & 0x7ffffffffffff;
  x[3] = ((s[2] >> 25) + (s[3] << 39)) & 0x7ffffffffffff;
  x[4] = (s[3] >> 12) & 0x7ffffffffffff;
}

void print_array(uint64* z, int len){
  int i;
  for (i=0; i < len; i++){
    printf("%lx ", z[i]);
  }
  printf("\n");
}

void print_long_array(uint128_t* z, int len){
  int i;
  for (i=0; i < len; i++){
    printf("%lx%lx ", (uint64)(z[i]>>64), (uint64)z[i]);
  }
  printf("\n");
}

void print_bigint(uint64 z[5]){
  uint64 x[4] = {0};
  int i, j;
  x[0] = z[0]       + (z[1] << 51);
  x[1] = (z[1] >> 13) + (z[2] << 38);
  x[2] = (z[2] >> 26) + (z[3] << 25);
  x[3] = (z[3] >> 39) + (z[4] << 12);
  for (i=0; i < 4; i++){
    for (j=0; j < 8; j++){
      printf("%lx ", 0xff & (x[i] >> (8*j)));
    }
    printf("\n");
  }
}

void aux(Bignum_Bigint_bigint_wide res , Bignum_Bigint_bigint a , uint64 s , int ctr ) {
  switch (ctr) { 
  case 0 : 
    ;  ; 
    break;
  default:;  
    int _23_76 ;
    _23_76 = ctr ; 
    int i;
    i = (ctr - 1 ) ; 
    uint64 ai;
    ai = a[i] ; 
    uint128_t resi;
    resi = (((uint128_t) ai ) *  s ) ; 
    res [ i ] =  resi  ; 
    aux (res, a, s, i)  ; 
    return   ;  
    break;
  }
}

void test(){
  uint64 output[9], rx[9] = {0}, ry[9] = {0}, rz[9] = {0}, qx[9] = {0}, qy[9] = {0}, qz[9] = {1}, zrecip[9] = {0};
  uint64 axx[9] = {0}, ayy[9] = {0}, azz[9] = {0}, axxx[9] = {0}, ayyy[9] = {0}, azzz[9] = {0};
  uint8 scalar[32] = {0xa5, 0x46, 0xe3, 0x6b, 0xf0, 0x52, 0x7c, 0x9d,
		      0x3b, 0x16, 0x15, 0x4b, 0x82, 0x46, 0x5e, 0xdd,
		      0x62, 0x14, 0x4c, 0x0a, 0xc1, 0xfc, 0x5a, 0x18,
		      0x50, 0x6a, 0x22, 0x44, 0xba, 0x44, 0x9a, 0xc4};
  uint8 input[32] = {0xe6, 0xdb, 0x68, 0x67, 0x58, 0x30, 0x30, 0xdb,
		    0x35, 0x94, 0xc1, 0xa4, 0x24, 0xb1, 0x5f, 0x7c,
		    0x72, 0x66, 0x24, 0xec, 0x26, 0xb3, 0x35, 0x3b,
		    0x10, 0xa9, 0x03, 0xa6, 0xd0, 0xab, 0x1c, 0x4c};

  decode_scalar(scalar);
  decode_input(qx, input);

  Curve_Point_point basepoint = (Curve_Point_point) {qx, qy, qz};
  Curve_Point_point res = (Curve_Point_point) {rx, ry, rz};

  int i;
  for (i=0;i<1000;i++){
    Curve_Ladder_montgomery_ladder(res, scalar, basepoint);
  }
  print_array(res.x, 5);
  Bignum_Core_crecip_prime(zrecip, res.z);
  print_array(zrecip, 5);
  Bignum_Core_fmul(output, res.x, zrecip);
  print_bigint(output);
}

int main(int argc, char** argv){
  test();
  return 0;
}

