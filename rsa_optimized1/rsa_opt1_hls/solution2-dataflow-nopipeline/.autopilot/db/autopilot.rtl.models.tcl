set SynModuleInfo {
  {SRCNAME mod_product MODELNAME mod_product RTLNAME rsa_mod_product
    SUBMODULES {
      {MODELNAME rsa_add_258ns_258ns_258_2_1 RTLNAME rsa_add_258ns_258ns_258_2_1 BINDTYPE op TYPE add IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME rsa_add_257ns_257ns_257_2_1 RTLNAME rsa_add_257ns_257ns_257_2_1 BINDTYPE op TYPE add IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME rsa_sub_257ns_257ns_257_2_1 RTLNAME rsa_sub_257ns_257ns_257_2_1 BINDTYPE op TYPE sub IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mod_exp MODELNAME mod_exp RTLNAME rsa_mod_exp}
  {SRCNAME Block_entry46_proc MODELNAME Block_entry46_proc RTLNAME rsa_Block_entry46_proc}
  {SRCNAME rsa MODELNAME rsa RTLNAME rsa IS_TOP 1
    SUBMODULES {
      {MODELNAME rsa_fifo_w256_d2_S RTLNAME rsa_fifo_w256_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME result_V_U}
      {MODELNAME rsa_control_s_axi RTLNAME rsa_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
