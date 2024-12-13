set SynModuleInfo {
  {SRCNAME mod_product MODELNAME mod_product RTLNAME rsa_mod_product
    SUBMODULES {
      {MODELNAME rsa_sub_257ns_257ns_257_2_1 RTLNAME rsa_sub_257ns_257ns_257_2_1 BINDTYPE op TYPE sub IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Montgomery_Pipeline_Montgomery MODELNAME Montgomery_Pipeline_Montgomery RTLNAME rsa_Montgomery_Pipeline_Montgomery
    SUBMODULES {
      {MODELNAME rsa_add_258ns_258ns_258_2_1 RTLNAME rsa_add_258ns_258ns_258_2_1 BINDTYPE op TYPE add IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME rsa_flow_control_loop_pipe_sequential_init RTLNAME rsa_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME rsa_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME Montgomery MODELNAME Montgomery RTLNAME rsa_Montgomery
    SUBMODULES {
      {MODELNAME rsa_sub_256ns_256ns_256_2_1 RTLNAME rsa_sub_256ns_256ns_256_2_1 BINDTYPE op TYPE sub IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME rsa MODELNAME rsa RTLNAME rsa IS_TOP 1
    SUBMODULES {
      {MODELNAME rsa_control_s_axi RTLNAME rsa_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
