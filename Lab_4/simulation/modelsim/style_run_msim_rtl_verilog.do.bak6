transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/Lab_4 {D:/intelFPGALite/quartus/work_ece550/Lab_4/style.v}

vlog -vlog01compat -work work +incdir+D:/intelFPGALite/quartus/work_ece550/Lab_4 {D:/intelFPGALite/quartus/work_ece550/Lab_4/style_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  style_tb

add wave *
view structure
view signals
run -all
