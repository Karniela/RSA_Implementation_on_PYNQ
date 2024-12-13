set SynModuleInfo {
<<<<<<< HEAD:rsa_baseline/rsa_baseline_hls/solution1/.autopilot/db/autopilot.rtl.models.tcl
  {SRCNAME mod_exp_Pipeline_VITIS_LOOP_12_1 MODELNAME mod_exp_Pipeline_VITIS_LOOP_12_1 RTLNAME rsa_mod_exp_Pipeline_VITIS_LOOP_12_1
    SUBMODULES {
      {MODELNAME rsa_mul_256ns_256ns_512_5_1 RTLNAME rsa_mul_256ns_256ns_512_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_512ns_256ns_256_516_1 RTLNAME rsa_urem_512ns_256ns_256_516_1 BINDTYPE op TYPE urem IMPL auto LATENCY 515 ALLOW_PRAGMA 1}
    }
  }
=======
>>>>>>> origin/branch2:rsa_baseline/baseline/solution1/.autopilot/db/autopilot.rtl.models.tcl
  {SRCNAME mod_exp MODELNAME mod_exp RTLNAME rsa_mod_exp
    SUBMODULES {
      {MODELNAME rsa_urem_256ns_256ns_256_260_seq_1 RTLNAME rsa_urem_256ns_256ns_256_260_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 259 ALLOW_PRAGMA 1}
      {MODELNAME rsa_mul_256ns_256ns_512_5_1 RTLNAME rsa_mul_256ns_256ns_512_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_512ns_256ns_256_516_seq_1 RTLNAME rsa_urem_512ns_256ns_256_516_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 515 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME rsa MODELNAME rsa RTLNAME rsa IS_TOP 1
    SUBMODULES {
      {MODELNAME rsa_control_s_axi RTLNAME rsa_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
