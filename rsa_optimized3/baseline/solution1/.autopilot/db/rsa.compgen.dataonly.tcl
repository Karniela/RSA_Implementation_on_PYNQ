# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
p { 
	dir I
	width 128
	depth 1
	mode ap_none
	offset 16
	offset_end 35
}
q { 
	dir I
	width 128
	depth 1
	mode ap_none
	offset 36
	offset_end 55
}
d { 
	dir I
	width 256
	depth 1
	mode ap_none
	offset 56
	offset_end 91
}
N { 
	dir I
	width 256
	depth 1
	mode ap_none
	offset 92
	offset_end 127
}
y { 
	dir I
	width 256
	depth 1
	mode ap_none
	offset 128
	offset_end 163
}
x { 
	dir O
	width 256
	depth 1
	mode ap_vld
	offset 164
	offset_end 199
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


