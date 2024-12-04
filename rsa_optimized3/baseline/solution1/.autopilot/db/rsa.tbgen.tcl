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
	{ mu_p int 129 unused  }
	{ mu_q int 129 unused  }
	{ p int 128 regular {axi_slave 0}  }
	{ q int 128 regular {axi_slave 0}  }
	{ d int 256 regular {axi_slave 0}  }
	{ N int 256 unused {axi_slave 0}  }
	{ y int 256 regular {axi_slave 0}  }
	{ x int 256 regular {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mu_p", "interface" : "wire", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "mu_q", "interface" : "wire", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "p", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 128, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":35}} , 
 	{ "Name" : "q", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 128, "direction" : "READONLY", "offset" : {"in":36}, "offset_end" : {"in":55}} , 
 	{ "Name" : "d", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 256, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":91}} , 
 	{ "Name" : "N", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 256, "direction" : "READONLY", "offset" : {"in":92}, "offset_end" : {"in":127}} , 
 	{ "Name" : "y", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 256, "direction" : "READONLY", "offset" : {"in":128}, "offset_end" : {"in":163}} , 
 	{ "Name" : "x", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 256, "direction" : "WRITEONLY", "offset" : {"out":164}, "offset_end" : {"out":199}} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ mu_p sc_in sc_lv 129 signal 0 } 
	{ mu_q sc_in sc_lv 129 signal 1 } 
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
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "mu_p", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "mu_p", "role": "default" }} , 
 	{ "name": "mu_q", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "mu_q", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "5", "8", "11", "12", "13", "14", "15", "16", "17"],
		"CDFG" : "rsa",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1059", "EstimateLatencyMax" : "133411",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mu_p", "Type" : "None", "Direction" : "I"},
			{"Name" : "mu_q", "Type" : "None", "Direction" : "I"},
			{"Name" : "p", "Type" : "None", "Direction" : "I"},
			{"Name" : "q", "Type" : "None", "Direction" : "I"},
			{"Name" : "d", "Type" : "None", "Direction" : "I"},
			{"Name" : "N", "Type" : "None", "Direction" : "I"},
			{"Name" : "y", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_91", "Parent" : "0", "Child" : ["2", "3", "4"],
		"CDFG" : "mod_inverse",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "139", "EstimateLatencyMax" : "17665",
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
				"LoopDec" : {"FSMBitwidth" : "139", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state139"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_91.udiv_128ns_128ns_128_132_seq_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_91.urem_128ns_128ns_128_132_seq_1_U2", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_inverse_fu_91.mul_129s_128ns_129_5_1_U3", "Parent" : "1"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_97", "Parent" : "0", "Child" : ["6", "7"],
		"CDFG" : "mod_exp",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "523", "EstimateLatencyMax" : "132875",
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
				"LoopDec" : {"FSMBitwidth" : "524", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "MOD_EXP", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "524", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state524"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_97.mul_256ns_256ns_512_5_1_U9", "Parent" : "5"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_97.urem_512ns_128ns_128_516_seq_1_U10", "Parent" : "5"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_104", "Parent" : "0", "Child" : ["9", "10"],
		"CDFG" : "mod_exp",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "523", "EstimateLatencyMax" : "132875",
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
				"LoopDec" : {"FSMBitwidth" : "524", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "MOD_EXP", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "524", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state524"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_104.mul_256ns_256ns_512_5_1_U9", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mod_exp_fu_104.urem_512ns_128ns_128_516_seq_1_U10", "Parent" : "8"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_256ns_256s_128_260_seq_1_U16", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_256ns_256s_128_260_seq_1_U17", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_129s_128ns_257_5_1_U18", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_257ns_129ns_129_261_seq_1_U19", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_130s_128ns_256_5_1_U20", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_256ns_256ns_256_2_1_U21", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rsa {
		mu_p {Type I LastRead -1 FirstWrite -1}
		mu_q {Type I LastRead -1 FirstWrite -1}
		p {Type I LastRead 0 FirstWrite -1}
		q {Type I LastRead 0 FirstWrite -1}
		d {Type I LastRead 0 FirstWrite -1}
		N {Type I LastRead -1 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		x {Type O LastRead -1 FirstWrite 536}}
	mod_inverse {
		a {Type I LastRead 0 FirstWrite -1}
		mod_r {Type I LastRead 0 FirstWrite -1}}
	mod_exp {
		base_r {Type I LastRead 0 FirstWrite -1}
		exp {Type I LastRead 0 FirstWrite -1}
		mod_r {Type I LastRead 0 FirstWrite -1}}
	mod_exp {
		base_r {Type I LastRead 0 FirstWrite -1}
		exp {Type I LastRead 0 FirstWrite -1}
		mod_r {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1059", "Max" : "133411"}
	, {"Name" : "Interval", "Min" : "1060", "Max" : "133412"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	mu_p { ap_none {  { mu_p in_data 0 129 } } }
	mu_q { ap_none {  { mu_q in_data 0 129 } } }
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
