set SynModuleInfo {
  {SRCNAME mod_inverse MODELNAME mod_inverse RTLNAME rsa_mod_inverse
    SUBMODULES {
      {MODELNAME rsa_udiv_128ns_128ns_128_132_seq_1 RTLNAME rsa_udiv_128ns_128ns_128_132_seq_1 BINDTYPE op TYPE udiv IMPL auto_seq LATENCY 131 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_128ns_128ns_128_132_seq_1 RTLNAME rsa_urem_128ns_128ns_128_132_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 131 ALLOW_PRAGMA 1}
      {MODELNAME rsa_mul_129s_128ns_129_5_1 RTLNAME rsa_mul_129s_128ns_129_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mod_exp MODELNAME mod_exp RTLNAME rsa_mod_exp
    SUBMODULES {
      {MODELNAME rsa_mul_256ns_256ns_512_5_1 RTLNAME rsa_mul_256ns_256ns_512_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_512ns_128ns_128_516_seq_1 RTLNAME rsa_urem_512ns_128ns_128_516_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 515 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME rsa MODELNAME rsa RTLNAME rsa IS_TOP 1
    SUBMODULES {
      {MODELNAME rsa_urem_256ns_256s_128_260_seq_1 RTLNAME rsa_urem_256ns_256s_128_260_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 259 ALLOW_PRAGMA 1}
      {MODELNAME rsa_mul_129s_128ns_257_5_1 RTLNAME rsa_mul_129s_128ns_257_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME rsa_srem_257ns_129ns_129_261_seq_1 RTLNAME rsa_srem_257ns_129ns_129_261_seq_1 BINDTYPE op TYPE srem IMPL auto_seq LATENCY 260 ALLOW_PRAGMA 1}
      {MODELNAME rsa_mul_130s_128ns_256_5_1 RTLNAME rsa_mul_130s_128ns_256_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME rsa_add_256ns_256ns_256_2_1 RTLNAME rsa_add_256ns_256ns_256_2_1 BINDTYPE op TYPE add IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME rsa_control_s_axi RTLNAME rsa_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
