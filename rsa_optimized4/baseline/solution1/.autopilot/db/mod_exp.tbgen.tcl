set moduleName mod_exp
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
set C_modelName {mod_exp}
set C_modelType { int 128 }
set C_modelArgList {
	{ base_r int 256 regular  }
	{ exp int 128 regular  }
	{ mod_r int 128 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "base_r", "interface" : "wire", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "exp", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "mod_r", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 128} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ base_r sc_in sc_lv 256 signal 0 } 
	{ exp sc_in sc_lv 128 signal 1 } 
	{ mod_r sc_in sc_lv 128 signal 2 } 
	{ ap_return sc_out sc_lv 128 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "base_r", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "base_r", "role": "default" }} , 
 	{ "name": "exp", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "exp", "role": "default" }} , 
 	{ "name": "mod_r", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "mod_r", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_256ns_128ns_128_260_seq_1_U15", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mod_exp {
		base_r {Type I LastRead 0 FirstWrite -1}
		exp {Type I LastRead 0 FirstWrite -1}
		mod_r {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "520", "Max" : "66183"}
	, {"Name" : "Interval", "Min" : "520", "Max" : "66183"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	base_r { ap_none {  { base_r in_data 0 256 } } }
	exp { ap_none {  { exp in_data 0 128 } } }
	mod_r { ap_none {  { mod_r in_data 0 128 } } }
}
