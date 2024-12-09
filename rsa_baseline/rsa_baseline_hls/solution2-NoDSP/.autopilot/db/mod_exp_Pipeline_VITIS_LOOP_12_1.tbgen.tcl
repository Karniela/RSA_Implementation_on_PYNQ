set moduleName mod_exp_Pipeline_VITIS_LOOP_12_1
set isTopModule 0
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
set C_modelName {mod_exp_Pipeline_VITIS_LOOP_12_1}
set C_modelType { int 1 }
set C_modelArgList {
	{ exp int 256 regular  }
	{ ret_V_5 int 256 regular  }
	{ conv_i18 int 256 regular  }
	{ lhs_out int 256 regular {pointer 1}  }
	{ conv2_i204_out int 256 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "exp", "interface" : "wire", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "ret_V_5", "interface" : "wire", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "conv_i18", "interface" : "wire", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "lhs_out", "interface" : "wire", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "conv2_i204_out", "interface" : "wire", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ exp sc_in sc_lv 256 signal 0 } 
	{ ret_V_5 sc_in sc_lv 256 signal 1 } 
	{ conv_i18 sc_in sc_lv 256 signal 2 } 
	{ lhs_out sc_out sc_lv 256 signal 3 } 
	{ lhs_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ conv2_i204_out sc_out sc_lv 256 signal 4 } 
	{ conv2_i204_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "exp", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "exp", "role": "default" }} , 
 	{ "name": "ret_V_5", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "ret_V_5", "role": "default" }} , 
 	{ "name": "conv_i18", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "conv_i18", "role": "default" }} , 
 	{ "name": "lhs_out", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "lhs_out", "role": "default" }} , 
 	{ "name": "lhs_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "lhs_out", "role": "ap_vld" }} , 
 	{ "name": "conv2_i204_out", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "conv2_i204_out", "role": "default" }} , 
 	{ "name": "conv2_i204_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "conv2_i204_out", "role": "ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "mod_exp_Pipeline_VITIS_LOOP_12_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "524", "EstimateLatencyMax" : "267018",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "exp", "Type" : "None", "Direction" : "I"},
			{"Name" : "ret_V_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv_i18", "Type" : "None", "Direction" : "I"},
			{"Name" : "lhs_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "conv2_i204_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_12_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "1043", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state1042"], "QuitState" : ["ap_ST_fsm_state2", "ap_ST_fsm_state522"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1043"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_256ns_256ns_512_5_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_512ns_256ns_256_516_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_256ns_256ns_512_5_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_512ns_256ns_256_516_1_U4", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mod_exp_Pipeline_VITIS_LOOP_12_1 {
		exp {Type I LastRead 0 FirstWrite -1}
		ret_V_5 {Type I LastRead 0 FirstWrite -1}
		conv_i18 {Type I LastRead 0 FirstWrite -1}
		lhs_out {Type O LastRead -1 FirstWrite 1}
		conv2_i204_out {Type O LastRead -1 FirstWrite 521}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "524", "Max" : "267018"}
	, {"Name" : "Interval", "Min" : "524", "Max" : "267018"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	exp { ap_none {  { exp in_data 0 256 } } }
	ret_V_5 { ap_none {  { ret_V_5 in_data 0 256 } } }
	conv_i18 { ap_none {  { conv_i18 in_data 0 256 } } }
	lhs_out { ap_vld {  { lhs_out out_data 1 256 }  { lhs_out_ap_vld out_vld 1 1 } } }
	conv2_i204_out { ap_vld {  { conv2_i204_out out_data 1 256 }  { conv2_i204_out_ap_vld out_vld 1 1 } } }
}
