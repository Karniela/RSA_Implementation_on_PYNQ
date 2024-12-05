set moduleName rsa
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {rsa}
set C_modelType { void 0 }
set C_modelArgList {
	{ d int 16 regular {axi_slave 0}  }
	{ N int 16 regular {axi_slave 0}  }
	{ y int 16 regular {axi_slave 0}  }
	{ x int 16 regular {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "d", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "N", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "y", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "x", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":40}, "offset_end" : {"out":47}} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"rsa","role":"start","value":"0","valid_bit":"0"},{"name":"rsa","role":"continue","value":"0","valid_bit":"4"},{"name":"rsa","role":"auto_start","value":"0","valid_bit":"7"},{"name":"d","role":"data","value":"16"},{"name":"N","role":"data","value":"24"},{"name":"y","role":"data","value":"32"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"rsa","role":"start","value":"0","valid_bit":"0"},{"name":"rsa","role":"done","value":"0","valid_bit":"1"},{"name":"rsa","role":"idle","value":"0","valid_bit":"2"},{"name":"rsa","role":"ready","value":"0","valid_bit":"3"},{"name":"rsa","role":"auto_start","value":"0","valid_bit":"7"},{"name":"x","role":"data","value":"40"}, {"name":"x","role":"valid","value":"44","valid_bit":"0"}] },
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "rsa",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "627", "EstimateLatencyMax" : "627",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "2", "Name" : "Block_entry30_proc_U0"}],
		"OutputProcess" : [
			{"ID" : "2", "Name" : "Block_entry30_proc_U0"}],
		"Port" : [
			{"Name" : "d", "Type" : "None", "Direction" : "I"},
			{"Name" : "N", "Type" : "None", "Direction" : "I"},
			{"Name" : "y", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "Block_entry30_proc_U0", "Port" : "x"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0", "Parent" : "0", "Child" : ["3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64"],
		"CDFG" : "Block_entry30_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "627", "EstimateLatencyMax" : "627",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "N", "Type" : "None", "Direction" : "I"},
			{"Name" : "y", "Type" : "None", "Direction" : "I"},
			{"Name" : "d", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_16ns_16ns_16_20_seq_1_U1", "Parent" : "2"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U2", "Parent" : "2"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_16ns_16ns_16_20_seq_1_U3", "Parent" : "2"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U4", "Parent" : "2"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_32_36_seq_1_U5", "Parent" : "2"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U6", "Parent" : "2"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U7", "Parent" : "2"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U8", "Parent" : "2"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U9", "Parent" : "2"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U10", "Parent" : "2"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U11", "Parent" : "2"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U12", "Parent" : "2"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U13", "Parent" : "2"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U14", "Parent" : "2"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U15", "Parent" : "2"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U16", "Parent" : "2"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U17", "Parent" : "2"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U18", "Parent" : "2"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U19", "Parent" : "2"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U20", "Parent" : "2"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U21", "Parent" : "2"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U22", "Parent" : "2"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U23", "Parent" : "2"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U24", "Parent" : "2"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U25", "Parent" : "2"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U26", "Parent" : "2"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U27", "Parent" : "2"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U28", "Parent" : "2"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U29", "Parent" : "2"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32ns_16ns_16_36_seq_1_U30", "Parent" : "2"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_32_36_seq_1_U31", "Parent" : "2"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.urem_32s_16ns_16_36_seq_1_U32", "Parent" : "2"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U33", "Parent" : "2"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U34", "Parent" : "2"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U35", "Parent" : "2"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U36", "Parent" : "2"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U37", "Parent" : "2"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U38", "Parent" : "2"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U39", "Parent" : "2"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U40", "Parent" : "2"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U41", "Parent" : "2"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U42", "Parent" : "2"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U43", "Parent" : "2"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U44", "Parent" : "2"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U45", "Parent" : "2"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U46", "Parent" : "2"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U47", "Parent" : "2"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U48", "Parent" : "2"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U49", "Parent" : "2"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U50", "Parent" : "2"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U51", "Parent" : "2"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U52", "Parent" : "2"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U53", "Parent" : "2"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U54", "Parent" : "2"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U55", "Parent" : "2"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U56", "Parent" : "2"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U57", "Parent" : "2"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U58", "Parent" : "2"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U59", "Parent" : "2"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16ns_16ns_32_4_1_U60", "Parent" : "2"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U61", "Parent" : "2"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry30_proc_U0.mul_mul_16s_16ns_32_4_1_U62", "Parent" : "2"}]}


set ArgLastReadFirstWriteLatency {
	rsa {
		d {Type I LastRead 0 FirstWrite -1}
		N {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		x {Type O LastRead -1 FirstWrite 627}}
	Block_entry30_proc {
		N {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		d {Type I LastRead 22 FirstWrite -1}
		x {Type O LastRead -1 FirstWrite 627}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "627", "Max" : "627"}
	, {"Name" : "Interval", "Min" : "628", "Max" : "628"}
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
