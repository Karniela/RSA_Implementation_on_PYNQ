# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
d { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
N { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
y { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
x { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 40
	offset_end 47
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


