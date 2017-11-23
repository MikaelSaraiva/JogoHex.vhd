transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/muxRom.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/mux.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/ROM.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/ButtonSync.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/Datapath.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/Controle.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/deslocaE.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/velocidade.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/comparador.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/decod7seg.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/ROM1.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/ROM2.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/ROM3.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/contador.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/contadorRom.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/velocidade1.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/velocidade2.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/velocidade3.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/multiplicador.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/decod7segResult.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/decod7segLEDR.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/decod7segJogo.vhd}
vcom -93 -work work {/home/pet/Desktop/drive-download-20171121T155723Z-001/TopoJogo.vhd}

