set moduleName rsa
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {rsa}
set C_modelType { void 0 }
set C_modelArgList {
	{ p int 128 regular {axi_slave 0}  }
	{ q int 128 regular {axi_slave 0}  }
	{ d int 256 regular {axi_slave 0}  }
	{ N int 256 unused {axi_slave 0}  }
	{ y int 256 regular {axi_slave 0}  }
	{ x int 256 regular {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 128, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":35}} , 
 	{ "Name" : "q", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 128, "direction" : "READONLY", "offset" : {"in":36}, "offset_end" : {"in":55}} , 
 	{ "Name" : "d", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 256, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":91}} , 
 	{ "Name" : "N", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 256, "direction" : "READONLY", "offset" : {"in":92}, "offset_end" : {"in":127}} , 
 	{ "Name" : "y", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 256, "direction" : "READONLY", "offset" : {"in":128}, "offset_end" : {"in":163}} , 
 	{ "Name" : "x", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 256, "direction" : "WRITEONLY", "offset" : {"out":164}, "offset_end" : {"out":199}} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 8 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 8 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"rsa","role":"start","value":"0","valid_bit":"0"},{"name":"rsa","role":"continue","value":"0","valid_bit":"4"},{"name":"rsa","role":"auto_start","value":"0","valid_bit":"7"},{"name":"p","role":"data","value":"16"},{"name":"q","role":"data","value":"36"},{"name":"d","role":"data","value":"56"},{"name":"N","role":"data","value":"92"},{"name":"y","role":"data","value":"128"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"rsa","role":"start","value":"0","valid_bit":"0"},{"name":"rsa","role":"done","value":"0","valid_bit":"1"},{"name":"rsa","role":"idle","value":"0","valid_bit":"2"},{"name":"rsa","role":"ready","value":"0","valid_bit":"3"},{"name":"rsa","role":"auto_start","value":"0","valid_bit":"7"},{"name":"x","role":"data","value":"164"}, {"name":"x","role":"valid","value":"196","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "8", "10", "12", "17", "18", "19", "20"],
		"CDFG" : "rsa",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1302", "EstimateLatencyMax" : "66965",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p", "Type" : "None", "Direction" : "I"},
			{"Name" : "q", "Type" : "None", "Direction" : "I"},
			{"Name" : "d", "Type" : "None", "Direction" : "I"},
			{"Name" : "N", "Type" : "None", "Direction" : "I"},
			{"Name" : "y", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "MOD_PRODUCT", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "270", "FirstState" : "ap_ST_fsm_state265", "LastState" : ["ap_ST_fsm_state267"], "QuitState" : ["ap_ST_fsm_state265"], "PreState" : ["ap_ST_fsm_state264"], "PostState" : ["ap_ST_fsm_state268"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_133", "Parent" : "0", "Child" : ["2", "6", "7"],
		"CDFG" : "mod_inverse",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "265", "EstimateLatencyMax" : "33793",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "mod_r", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "MOD_INVERSE", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "134", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state134"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_133.grp_multi_stage_mul_x0_fu_91", "Parent" : "1", "Child" : ["3", "4", "5"],
		"CDFG" : "multi_stage_mul_x0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "131", "EstimateLatencyMax" : "131",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_60_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "3", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_133.grp_multi_stage_mul_x0_fu_91.temp_V_multi_stage_mul_x0_add_m_fu_64", "Parent" : "2",
		"CDFG" : "multi_stage_mul_x0_add_m",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "m", "Type" : "None", "Direction" : "I"},
			{"Name" : "t", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_133.grp_multi_stage_mul_x0_fu_91.call_ret5_multi_stage_mul_x0_update_m_t_a_fu_71", "Parent" : "2",
		"CDFG" : "multi_stage_mul_x0_update_m_t_a",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m_V_write", "Type" : "None", "Direction" : "I"},
			{"Name" : "t_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "a_V_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_133.grp_multi_stage_mul_x0_fu_91.flow_control_loop_pipe_sequential_init_U", "Parent" : "2"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_133.udiv_128ns_128ns_128_132_seq_1_U9", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_133.urem_128ns_128ns_128_132_seq_1_U10", "Parent" : "1"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_139", "Parent" : "0", "Child" : ["9"],
		"CDFG" : "mod_exp",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "520", "EstimateLatencyMax" : "66183",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "base_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "exp", "Type" : "None", "Direction" : "I"},
			{"Name" : "mod_r", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "MOD_PRODUCT", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "266", "FirstState" : "ap_ST_fsm_state262", "LastState" : ["ap_ST_fsm_state263"], "QuitState" : ["ap_ST_fsm_state262"], "PreState" : ["ap_ST_fsm_state261"], "PostState" : ["ap_ST_fsm_state264"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "MOD_PRODUCT", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "266", "FirstState" : "ap_ST_fsm_state264", "LastState" : ["ap_ST_fsm_state265"], "QuitState" : ["ap_ST_fsm_state264"], "PreState" : ["ap_ST_fsm_state262"], "PostState" : ["ap_ST_fsm_state266", "ap_ST_fsm_state261"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "MOD_EXP", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "266", "FirstState" : "ap_ST_fsm_state261", "LastState" : ["ap_ST_fsm_state264"], "QuitState" : ["ap_ST_fsm_state261", "ap_ST_fsm_state264"], "PreState" : ["ap_ST_fsm_state260"], "PostState" : ["ap_ST_fsm_state266"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_139.urem_256ns_128ns_128_260_seq_1_U15", "Parent" : "8"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_146", "Parent" : "0", "Child" : ["11"],
		"CDFG" : "mod_exp",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "520", "EstimateLatencyMax" : "66183",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "base_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "exp", "Type" : "None", "Direction" : "I"},
			{"Name" : "mod_r", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "MOD_PRODUCT", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "266", "FirstState" : "ap_ST_fsm_state262", "LastState" : ["ap_ST_fsm_state263"], "QuitState" : ["ap_ST_fsm_state262"], "PreState" : ["ap_ST_fsm_state261"], "PostState" : ["ap_ST_fsm_state264"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "MOD_PRODUCT", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "266", "FirstState" : "ap_ST_fsm_state264", "LastState" : ["ap_ST_fsm_state265"], "QuitState" : ["ap_ST_fsm_state264"], "PreState" : ["ap_ST_fsm_state262"], "PostState" : ["ap_ST_fsm_state266", "ap_ST_fsm_state261"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "MOD_EXP", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "266", "FirstState" : "ap_ST_fsm_state261", "LastState" : ["ap_ST_fsm_state264"], "QuitState" : ["ap_ST_fsm_state261", "ap_ST_fsm_state264"], "PreState" : ["ap_ST_fsm_state260"], "PostState" : ["ap_ST_fsm_state266"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_146.urem_256ns_128ns_128_260_seq_1_U15", "Parent" : "10"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_multi_stage_mul_h_fu_153", "Parent" : "0", "Child" : ["13", "15", "16"],
		"CDFG" : "multi_stage_mul_h",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "131", "EstimateLatencyMax" : "131",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_34_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_multi_stage_mul_h_fu_153.grp_multi_stage_mul_h_add_m_fu_64", "Parent" : "12", "Child" : ["14"],
		"CDFG" : "multi_stage_mul_h_add_m",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "m", "Type" : "None", "Direction" : "I"},
			{"Name" : "t", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_multi_stage_mul_h_fu_153.grp_multi_stage_mul_h_add_m_fu_64.add_256ns_256ns_256_2_1_U20", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_multi_stage_mul_h_fu_153.call_ret5_multi_stage_mul_h_update_m_t_a_fu_71", "Parent" : "12",
		"CDFG" : "multi_stage_mul_h_update_m_t_a",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m_V_write", "Type" : "None", "Direction" : "I"},
			{"Name" : "t_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "a_V_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_multi_stage_mul_h_fu_153.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_256ns_256s_128_260_seq_1_U30", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_256ns_256s_128_260_seq_1_U31", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_256ns_256ns_256_2_1_U32", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rsa {
		p {Type I LastRead 0 FirstWrite -1}
		q {Type I LastRead 0 FirstWrite -1}
		d {Type I LastRead 0 FirstWrite -1}
		N {Type I LastRead -1 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		x {Type O LastRead -1 FirstWrite 267}}
	mod_inverse {
		a {Type I LastRead 0 FirstWrite -1}
		mod_r {Type I LastRead 0 FirstWrite -1}}
	multi_stage_mul_x0 {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}}
	multi_stage_mul_x0_add_m {
		a {Type I LastRead 0 FirstWrite -1}
		m {Type I LastRead 0 FirstWrite -1}
		t {Type I LastRead 0 FirstWrite -1}}
	multi_stage_mul_x0_update_m_t_a {
		m_V_write {Type I LastRead 0 FirstWrite -1}
		t_V_read {Type I LastRead 0 FirstWrite -1}
		a_V_read {Type I LastRead 0 FirstWrite -1}}
	mod_exp {
		base_r {Type I LastRead 0 FirstWrite -1}
		exp {Type I LastRead 0 FirstWrite -1}
		mod_r {Type I LastRead 0 FirstWrite -1}}
	mod_exp {
		base_r {Type I LastRead 0 FirstWrite -1}
		exp {Type I LastRead 0 FirstWrite -1}
		mod_r {Type I LastRead 0 FirstWrite -1}}
	multi_stage_mul_h {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}}
	multi_stage_mul_h_add_m {
		a {Type I LastRead 0 FirstWrite -1}
		m {Type I LastRead 0 FirstWrite -1}
		t {Type I LastRead 0 FirstWrite -1}}
	multi_stage_mul_h_update_m_t_a {
		m_V_write {Type I LastRead 0 FirstWrite -1}
		t_V_read {Type I LastRead 0 FirstWrite -1}
		a_V_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1302", "Max" : "66965"}
	, {"Name" : "Interval", "Min" : "1303", "Max" : "66966"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
