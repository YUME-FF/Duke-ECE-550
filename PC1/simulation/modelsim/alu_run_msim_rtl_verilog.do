transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/checkpoint1 {D:/intelFPGALite/quartus/work_ece550/checkpoint1/alu.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/checkpoint1 {D:/intelFPGALite/quartus/work_ece550/checkpoint1/full_adder.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/checkpoint1 {D:/intelFPGALite/quartus/work_ece550/checkpoint1/mux.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/checkpoint1 {D:/intelFPGALite/quartus/work_ece550/checkpoint1/add_sub.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/checkpoint1 {D:/intelFPGALite/quartus/work_ece550/checkpoint1/not_gate.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/checkpoint1 {D:/intelFPGALite/quartus/work_ece550/checkpoint1/carry_save_adder.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/checkpoint1 {D:/intelFPGALite/quartus/work_ece550/checkpoint1/ripple_carry_adder_2.v}

vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/checkpoint1 {D:/intelFPGALite/quartus/work_ece550/checkpoint1/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
