# This script segment is generated automatically by AutoPilot

<<<<<<<< HEAD:rsa_baseline/rsa_baseline_hls/solution1/.autopilot/db/mod_exp_Pipeline_VITIS_LOOP_12_1.compgen.tcl
set name rsa_mul_256ns_256ns_512_5_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 4 ALLOW_PRAGMA 1
}


set name rsa_urem_512ns_256ns_256_516_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto} LATENCY 515 ALLOW_PRAGMA 1
========
set name rsa_urem_256ns_128ns_128_260_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto_seq} LATENCY 259 ALLOW_PRAGMA 1
>>>>>>>> origin/branch2:rsa_optimized4/baseline/solution1/.autopilot/db/mod_exp.compgen.tcl
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
<<<<<<<< HEAD:rsa_baseline/rsa_baseline_hls/solution1/.autopilot/db/mod_exp_Pipeline_VITIS_LOOP_12_1.compgen.tcl
    id 7 \
========
    id 17 \
    name base_r \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_base_r \
    op interface \
    ports { base_r { I 256 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
>>>>>>>> origin/branch2:rsa_optimized4/baseline/solution1/.autopilot/db/mod_exp.compgen.tcl
    name exp \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_exp \
    op interface \
    ports { exp { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
<<<<<<<< HEAD:rsa_baseline/rsa_baseline_hls/solution1/.autopilot/db/mod_exp_Pipeline_VITIS_LOOP_12_1.compgen.tcl
    id 8 \
    name ret_V_5 \
========
    id 19 \
    name mod_r \
>>>>>>>> origin/branch2:rsa_optimized4/baseline/solution1/.autopilot/db/mod_exp.compgen.tcl
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
<<<<<<<< HEAD:rsa_baseline/rsa_baseline_hls/solution1/.autopilot/db/mod_exp_Pipeline_VITIS_LOOP_12_1.compgen.tcl
    corename dc_ret_V_5 \
    op interface \
    ports { ret_V_5 { I 256 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name conv_i18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv_i18 \
    op interface \
    ports { conv_i18 { I 256 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name lhs_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lhs_out \
    op interface \
    ports { lhs_out { O 256 vector } lhs_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name conv2_i204_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_conv2_i204_out \
    op interface \
    ports { conv2_i204_out { O 256 vector } conv2_i204_out_ap_vld { O 1 bit } } \
========
    corename dc_mod_r \
    op interface \
    ports { mod_r { I 128 vector } } \
>>>>>>>> origin/branch2:rsa_optimized4/baseline/solution1/.autopilot/db/mod_exp.compgen.tcl
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 128 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -4 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


