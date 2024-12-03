set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME rsa_entry_proc}
  {SRCNAME mod_product MODELNAME mod_product RTLNAME rsa_mod_product}
  {SRCNAME Loop_VITIS_LOOP_93_1_proc MODELNAME Loop_VITIS_LOOP_93_1_proc RTLNAME rsa_Loop_VITIS_LOOP_93_1_proc}
  {SRCNAME Block_for.end_proc MODELNAME Block_for_end_proc RTLNAME rsa_Block_for_end_proc}
  {SRCNAME rsa MODELNAME rsa RTLNAME rsa IS_TOP 1
    SUBMODULES {
      {MODELNAME rsa_fifo_w16_d3_S RTLNAME rsa_fifo_w16_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME d_c_U}
      {MODELNAME rsa_fifo_w16_d2_S RTLNAME rsa_fifo_w16_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME N_c_U}
      {MODELNAME rsa_fifo_w16_d2_S RTLNAME rsa_fifo_w16_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME t_V_U}
      {MODELNAME rsa_fifo_w16_d2_S RTLNAME rsa_fifo_w16_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME a_V_1_loc_channel_U}
      {MODELNAME rsa_control_s_axi RTLNAME rsa_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
