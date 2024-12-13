set moduleName multi_stage_mul_x0_update_m_t_a
set isTopModule 0
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {multi_stage_mul_x0_update_m_t_a}
set C_modelType { int 387 }
set C_modelArgList {
	{ m_V_write int 129 regular  }
	{ t_V_read int 128 regular  }
	{ a_V_read int 129 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m_V_write", "interface" : "wire", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "t_V_read", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "a_V_read", "interface" : "wire", "bitwidth" : 129, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 387} ]}
# RTL Port declarations: 
set portNum 7
set portList { 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_V_write sc_in sc_lv 129 signal 0 } 
	{ t_V_read sc_in sc_lv 128 signal 1 } 
	{ a_V_read sc_in sc_lv 129 signal 2 } 
	{ ap_return_0 sc_out sc_lv 129 signal -1 } 
	{ ap_return_1 sc_out sc_lv 129 signal -1 } 
	{ ap_return_2 sc_out sc_lv 129 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_V_write", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "m_V_write", "role": "default" }} , 
 	{ "name": "t_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "t_V_read", "role": "default" }} , 
 	{ "name": "a_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "a_V_read", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "a_V_read", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	multi_stage_mul_x0_update_m_t_a {
		m_V_write {Type I LastRead 0 FirstWrite -1}
		t_V_read {Type I LastRead 0 FirstWrite -1}
		a_V_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	m_V_write { ap_none {  { m_V_write in_data 0 129 } } }
	t_V_read { ap_none {  { t_V_read in_data 0 128 } } }
	a_V_read { ap_none {  { a_V_read in_data 0 129 } } }
}
