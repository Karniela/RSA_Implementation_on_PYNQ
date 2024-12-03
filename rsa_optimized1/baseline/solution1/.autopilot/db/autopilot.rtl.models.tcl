set SynModuleInfo {
  {SRCNAME mod_exp MODELNAME mod_exp RTLNAME rsa_mod_exp
    SUBMODULES {
      {MODELNAME rsa_add_258ns_258ns_258_2_1 RTLNAME rsa_add_258ns_258ns_258_2_1 BINDTYPE op TYPE add IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME rsa_add_257ns_257ns_257_2_1 RTLNAME rsa_add_257ns_257ns_257_2_1 BINDTYPE op TYPE add IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME rsa_sub_257ns_257ns_257_2_1 RTLNAME rsa_sub_257ns_257ns_257_2_1 BINDTYPE op TYPE sub IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Block_entry45_proc2 MODELNAME Block_entry45_proc2 RTLNAME rsa_Block_entry45_proc2}
  {SRCNAME rsa MODELNAME rsa RTLNAME rsa IS_TOP 1
    SUBMODULES {
      {MODELNAME rsa_control_s_axi RTLNAME rsa_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
