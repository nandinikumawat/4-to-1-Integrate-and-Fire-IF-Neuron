
.TEMP 25
*.OPTION INGOLD=2 ARTIST=2 PSF=2 MEASOUT=1 PARHIER=LOCAL PROBE=0 MARCH=2 ACCURACY=1 POST RUNLVL=5
.OPTION POST

* Typical NMOS, typical PMOS process corner model file
.lib /home/vlsilab2/TSMCHOME/Executable_Package/Collaterals/Tech/SPICE/N16ADFP_SPICE_MODEL/n16adfp_spice_model_v1d0_usage.l TTMacro_MOS_MOSCAP
* Slow NMOS, slow PMOS process corner model file
*.lib /home/vlsilab2/TSMCHOME/Executable_Package/Collaterals/Tech/SPICE/N16ADFP_SPICE_MODEL/n16adfp_spice_model_v1d0_usage.l SSMacro_MOS_MOSCAP
* Fast NMOS, fast PMOS process corner model file 
*.lib /home/vlsilab2/TSMCHOME/Executable_Package/Collaterals/Tech/SPICE/N16ADFP_SPICE_MODEL/n16adfp_spice_model_v1d0_usage.l FFMacro_MOS_MOSCAP

* Include the D Flip-Flop subcircuit
.INCLUDE fireNeuron.sp

* Power supplies
Vdd VDD 0 0.8V
Vss VSS 0 0V

* Inputs
* D toggles every 40ps

VW1 w1 0 0.8
VW2 w2 0 0.8
VW3 w3 0 0.8
VW4 w4 0 0.8

VX0_1 x0_1 0 DC 0
VX0_2 x0_2 0 DC 0
VX0_3 x0_3 0 DC 0
VX0_4 x0_4 0 PULSE(0 0.8 0 20p 20p 60p 150p)

VX1_1 x1_1 0 DC 0
VX1_2 x1_2 0 DC 0
VX1_3 x1_3 0 DC 0
VX1_4 x1_4 0 PULSE(0 0.8 0 20p 20p 60p 150p)

VX2_1 x2_1 0 DC 0
VX2_2 x2_2 0 DC 0
VX2_3 x2_3 0 DC 0
VX2_4 x2_4 0 DC 0

VX3_1 x3_1 0 DC 0
VX3_2 x3_2 0 DC 0
VX3_3 x3_3 0 DC 0
VX3_4 x3_4 0 DC 0

VCLK CLK 0 PULSE(0 0.8 0 20p 20p 40p 120p)

* Load capacitance for Q and Q'
*CloadQ Q 0 1fF

* Transient analysis for functionality verification
.TRAN 1ps 25ns

.END



