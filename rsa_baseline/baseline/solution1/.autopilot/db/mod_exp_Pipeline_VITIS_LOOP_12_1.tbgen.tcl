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
	{ ret_V int 256 regular  }
	{ agg_result_0_out int 256 regular {pointer 1}  }
	{ result_V_1_out int 256 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "exp", "interface" : "wire", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "ret_V", "interface" : "wire", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "agg_result_0_out", "interface" : "wire", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "result_V_1_out", "interface" : "wire", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ exp sc_in sc_lv 256 signal 0 } 
	{ ret_V sc_in sc_lv 256 signal 1 } 
	{ agg_result_0_out sc_out sc_lv 256 signal 2 } 
	{ agg_result_0_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ result_V_1_out sc_out sc_lv 256 signal 3 } 
	{ result_V_1_out_ap_vld sc_out sc_logic 1 outvld 3 } 
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
 	{ "name": "ret_V", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "ret_V", "role": "default" }} , 
 	{ "name": "agg_result_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "agg_result_0_out", "role": "default" }} , 
 	{ "name": "agg_result_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "agg_result_0_out", "role": "ap_vld" }} , 
 	{ "name": "result_V_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "result_V_1_out", "role": "default" }} , 
 	{ "name": "result_V_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "result_V_1_out", "role": "ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "mod_exp_Pipeline_VITIS_LOOP_12_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "260",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "exp", "Type" : "None", "Direction" : "I"},
			{"Name" : "ret_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "agg_result_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "result_V_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_12_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state4", "ap_ST_fsm_state5"]}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_256s_256s_256_1_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_256s_256s_256_1_1_U2", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mod_exp_Pipeline_VITIS_LOOP_12_1 {
		exp {Type I LastRead 0 FirstWrite -1}
		ret_V {Type I LastRead 0 FirstWrite -1}
		agg_result_0_out {Type O LastRead -1 FirstWrite 2}
		result_V_1_out {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "260"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "260"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	exp { ap_none {  { exp in_data 0 256 } } }
	ret_V { ap_none {  { ret_V in_data 0 256 } } }
	agg_result_0_out { ap_vld {  { agg_result_0_out out_data 1 256 }  { agg_result_0_out_ap_vld out_vld 1 1 } } }
	result_V_1_out { ap_vld {  { result_V_1_out out_data 1 256 }  { result_V_1_out_ap_vld out_vld 1 1 } } }
}
