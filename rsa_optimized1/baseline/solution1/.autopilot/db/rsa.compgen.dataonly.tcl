# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
d { 
	dir I
	width 256
	depth 1
	mode ap_none
	offset 16
	offset_end 51
}
N { 
	dir I
	width 256
	depth 1
	mode ap_none
	offset 52
	offset_end 87
}
y { 
	dir I
	width 256
	depth 1
	mode ap_none
	offset 88
	offset_end 123
}
x { 
	dir O
	width 256
	depth 1
	mode ap_vld
	offset 124
	offset_end 159
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


