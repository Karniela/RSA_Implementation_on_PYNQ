set SynModuleInfo {
  {SRCNAME multi_stage_mul_x0_add_m MODELNAME multi_stage_mul_x0_add_m RTLNAME rsa_multi_stage_mul_x0_add_m}
  {SRCNAME multi_stage_mul_x0_update_m_t_a MODELNAME multi_stage_mul_x0_update_m_t_a RTLNAME rsa_multi_stage_mul_x0_update_m_t_a}
  {SRCNAME multi_stage_mul_x0 MODELNAME multi_stage_mul_x0 RTLNAME rsa_multi_stage_mul_x0
    SUBMODULES {
      {MODELNAME rsa_flow_control_loop_pipe_sequential_init RTLNAME rsa_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME rsa_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME mod_inverse MODELNAME mod_inverse RTLNAME rsa_mod_inverse
    SUBMODULES {
      {MODELNAME rsa_udiv_128ns_128ns_128_132_seq_1 RTLNAME rsa_udiv_128ns_128ns_128_132_seq_1 BINDTYPE op TYPE udiv IMPL auto_seq LATENCY 131 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_128ns_128ns_128_132_seq_1 RTLNAME rsa_urem_128ns_128ns_128_132_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 131 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mod_product_mont MODELNAME mod_product_mont RTLNAME rsa_mod_product_mont}
  {SRCNAME mont_update_m_temp MODELNAME mont_update_m_temp RTLNAME rsa_mont_update_m_temp}
  {SRCNAME mont_update_m_a MODELNAME mont_update_m_a RTLNAME rsa_mont_update_m_a}
  {SRCNAME Montgomery_Pipeline_Montgomery MODELNAME Montgomery_Pipeline_Montgomery RTLNAME rsa_Montgomery_Pipeline_Montgomery}
  {SRCNAME Montgomery MODELNAME Montgomery RTLNAME rsa_Montgomery}
  {SRCNAME mod_exp MODELNAME mod_exp RTLNAME rsa_mod_exp}
  {SRCNAME mod_product_full MODELNAME mod_product_full RTLNAME rsa_mod_product_full}
  {SRCNAME multi_stage_mul_h_add_m MODELNAME multi_stage_mul_h_add_m RTLNAME rsa_multi_stage_mul_h_add_m
    SUBMODULES {
      {MODELNAME rsa_add_256ns_256ns_256_2_1 RTLNAME rsa_add_256ns_256ns_256_2_1 BINDTYPE op TYPE add IMPL fabric LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME multi_stage_mul_h_update_m_t_a MODELNAME multi_stage_mul_h_update_m_t_a RTLNAME rsa_multi_stage_mul_h_update_m_t_a}
  {SRCNAME multi_stage_mul_h MODELNAME multi_stage_mul_h RTLNAME rsa_multi_stage_mul_h}
  {SRCNAME rsa MODELNAME rsa RTLNAME rsa IS_TOP 1
    SUBMODULES {
      {MODELNAME rsa_urem_256ns_256s_128_260_seq_1 RTLNAME rsa_urem_256ns_256s_128_260_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 259 ALLOW_PRAGMA 1}
      {MODELNAME rsa_urem_256ns_128ns_128_260_seq_1 RTLNAME rsa_urem_256ns_128ns_128_260_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 259 ALLOW_PRAGMA 1}
      {MODELNAME rsa_control_s_axi RTLNAME rsa_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
