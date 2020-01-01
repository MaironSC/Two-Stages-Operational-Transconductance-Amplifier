
.include AMS035.mod

.param Lmin = '4*0.35u'
.param W1 = 'Lmin*S1'
.param W2 = 'Lmin*S2'
.param W3 = 'Lmin*S3'
.param W4 = 'Lmin*S4'
.param W5 = 'Lmin*S5'
.param W6 = 'Lmin*S6'
.param W7 = 'Lmin*S7'
.param W8 = 'Lmin*S8'

.param S1 = 9.054682936779226
.param S2 = 9.054682936779226
.param S3 = 0.957525545632527
.param S4 = 0.957525545632527
.param S5 = 7.695068031896474
.param S6 = 52.811173038522720
.param S7 = 2.122061240189875e+02
.param S8 = 3.078027212758590

XAMP Vin_pos Cc_out Cc_out Vdd_in meu_amp
CL Cc_out 0 1.000000000000000e-11
RL Cc_out 0 100G
Vdd Vdd_in 0 Dc 3.0

*OFFSET

Vincm Vin_pos 0 DC 1.2
.dc Vincm 0 3 1m
.print dc 'ddx(v(Cc_out),v(Vincm))' v(Cc_out)
.subckt meu_amp Vin_pos Vin_neg Cc_out Vdd_in 
*  d g s b
M1 M3_Drain Vin_neg M5_Drain M5_Drain NMOS L = Lmin  W= W1
M2 M4_Drain Vin_pos M5_Drain M5_Drain NMOS L = Lmin  W= W2 

M3 M3_Drain M3_Drain Vdd_in Vdd_in PMOS L=Lmin W= W3
M4 M4_Drain M3_Drain Vdd_in Vdd_in PMOS L=Lmin W= W4

M5 M5_Drain M8_Drain 0 0 NMOS L=Lmin W= W5
M6 Cc_out M4_Drain Vdd_in Vdd_in PMOS L=Lmin W= W6

M7 Cc_out M8_Drain 0 0 NMOS L =Lmin W = W7
M8 M8_Drain M8_Drain 0 0 NMOS L=Lmin W= W8

Cc M4_Drain Cc_out 2.500000000000000e-12

IB Vdd_in M8_Drain Dc 1.000000000000000e-05
.ends

.end

