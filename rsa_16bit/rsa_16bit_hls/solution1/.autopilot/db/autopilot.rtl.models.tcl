set SynModuleInfo {
  {SRCNAME Block_entry30_proc MODELNAME Block_entry30_proc RTLNAME rsa_Block_entry30_proc
    SUBMODULES {
      {MODELNAME rsa_urem_16ns_16ns_16_20_seq_1 RTLNAME rsa_urem_16ns_16ns_16_20_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 19 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_32ns_16ns_16_36_seq_1 RTLNAME rsa_urem_32ns_16ns_16_36_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_32ns_16ns_32_36_seq_1 RTLNAME rsa_urem_32ns_16ns_32_36_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_32s_16ns_32_36_seq_1 RTLNAME rsa_urem_32s_16ns_32_36_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_32s_16ns_16_36_seq_1 RTLNAME rsa_urem_32s_16ns_16_36_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME rsa_mul_mul_16ns_16ns_32_4_1 RTLNAME rsa_mul_mul_16ns_16ns_32_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME rsa_mul_mul_16s_16ns_32_4_1 RTLNAME rsa_mul_mul_16s_16ns_32_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME rsa MODELNAME rsa RTLNAME rsa IS_TOP 1
    SUBMODULES {
      {MODELNAME rsa_control_s_axi RTLNAME rsa_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
