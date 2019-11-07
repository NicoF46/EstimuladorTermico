EESchema Schematic File Version 4
LIBS:PlacaEstimuladorTermico-cache
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	10420 2420 10670 2420
Text GLabel 10520 2420 1    50   Input ~ 0
VCC
Wire Wire Line
	10670 2420 10670 2570
Text GLabel 7620 770  1    50   Input ~ 0
VCC
Wire Wire Line
	7620 1570 7920 1570
Connection ~ 7620 1570
Wire Wire Line
	8270 1570 8370 1570
Connection ~ 8270 1570
Wire Wire Line
	8020 1570 8270 1570
$Comp
L Connector:Screw_Terminal_01x02 PELTIER1
U 1 1 5DA5EBF3
P 7920 1370
F 0 "PELTIER1" V 7884 1182 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 7793 1182 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 7920 1370 50  0001 C CNN
F 3 "~" H 7920 1370 50  0001 C CNN
	1    7920 1370
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7970 2420 8270 2420
Connection ~ 7970 2420
Wire Wire Line
	7970 2620 7970 2420
$Comp
L power:GND #PWR09
U 1 1 5DA5A71B
P 7970 2620
F 0 "#PWR09" H 7970 2370 50  0001 C CNN
F 1 "GND" H 7975 2447 50  0000 C CNN
F 2 "" H 7970 2620 50  0001 C CNN
F 3 "" H 7970 2620 50  0001 C CNN
	1    7970 2620
	1    0    0    -1  
$EndComp
Connection ~ 7620 2420
Wire Wire Line
	7620 2420 7970 2420
Wire Wire Line
	8270 2070 8270 2420
Wire Wire Line
	8270 1770 8270 1570
$Comp
L Device:CP C2
U 1 1 5DA56A1D
P 8270 1920
F 0 "C2" H 8388 1966 50  0000 L CNN
F 1 "33uF" H 8388 1875 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P7.50mm" H 8308 1770 50  0001 C CNN
F 3 "~" H 8270 1920 50  0001 C CNN
	1    8270 1920
	1    0    0    -1  
$EndComp
Connection ~ 7120 2420
Wire Wire Line
	7620 2420 7120 2420
Wire Wire Line
	7620 2070 7620 2420
Wire Wire Line
	7620 1570 7620 1770
Wire Wire Line
	7470 1570 7620 1570
$Comp
L Device:CP C1
U 1 1 5DA5452F
P 7620 1920
F 0 "C1" H 7738 1966 50  0000 L CNN
F 1 "33uF" H 7738 1875 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P7.50mm" H 7658 1770 50  0001 C CNN
F 3 "~" H 7620 1920 50  0001 C CNN
	1    7620 1920
	1    0    0    -1  
$EndComp
Wire Wire Line
	8670 770  9120 770 
Wire Wire Line
	8670 1270 8670 770 
Wire Wire Line
	9120 2420 9120 2270
Wire Wire Line
	8670 2420 9120 2420
Wire Wire Line
	8670 2170 8670 2420
Wire Wire Line
	7120 2420 7120 2120
Wire Wire Line
	6670 2420 7120 2420
Wire Wire Line
	6670 2270 6670 2420
Wire Wire Line
	6670 770  7120 770 
Wire Wire Line
	7120 1270 7120 770 
Wire Wire Line
	7120 1820 7120 1570
Wire Wire Line
	8670 1570 8670 1870
$Comp
L Diode:1N5822 D2
U 1 1 5DA4EC68
P 7120 1970
F 0 "D2" V 7074 2049 50  0000 L CNN
F 1 "1N5822" V 7165 2049 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 7120 1795 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 7120 1970 50  0001 C CNN
	1    7120 1970
	0    1    1    0   
$EndComp
Wire Wire Line
	7120 1570 6670 1570
Connection ~ 7120 1570
$Comp
L Diode:1N5822 D1
U 1 1 5DA49F1B
P 7120 1420
F 0 "D1" V 7074 1499 50  0000 L CNN
F 1 "1N5822" V 7165 1499 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 7120 1245 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 7120 1420 50  0001 C CNN
	1    7120 1420
	0    1    1    0   
$EndComp
Wire Wire Line
	9120 770  9120 920 
Wire Wire Line
	6670 920  6670 770 
Wire Wire Line
	9120 1570 9120 1870
Connection ~ 9120 1570
Wire Wire Line
	9120 1320 9120 1570
Wire Wire Line
	8670 1570 9120 1570
Wire Wire Line
	6670 1570 6670 1870
Connection ~ 6670 1570
Wire Wire Line
	6670 1320 6670 1570
Wire Wire Line
	7170 1570 7120 1570
$Comp
L Device:L L1
U 1 1 5DA335AC
P 7320 1570
F 0 "L1" V 7139 1570 50  0000 C CNN
F 1 "22uH" V 7230 1570 50  0000 C CNN
F 2 "Inductor_THT:L_Radial_D10.0mm_P5.00mm_Neosid_SD12k_style3" H 7320 1570 50  0001 C CNN
F 3 "~" H 7320 1570 50  0001 C CNN
	1    7320 1570
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRF4905 Q1
U 1 1 5DA1F9F5
P 6570 1120
F 0 "Q1" H 6776 1074 50  0000 L CNN
F 1 "IRF4905" H 6776 1165 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6770 1045 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 6570 1120 50  0001 L CNN
	1    6570 1120
	1    0    0    1   
$EndComp
$Comp
L Transistor_FET:IRF4905 Q3
U 1 1 5DA1E5F0
P 9220 1120
F 0 "Q3" H 9425 1074 50  0000 L CNN
F 1 "IRF4905" H 9425 1165 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9420 1045 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 9220 1120 50  0001 L CNN
	1    9220 1120
	-1   0    0    1   
$EndComp
$Comp
L irfz44n:IRFZ44N Q4
U 1 1 5DA18B26
P 9220 2070
F 0 "Q4" H 9426 2116 50  0000 L CNN
F 1 "IRFZ44N" H 9426 2025 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 10070 2095 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BU/BUZ11.pdf" H 9220 2070 50  0001 L CNN
	1    9220 2070
	-1   0    0    -1  
$EndComp
$Comp
L irfz44n:IRFZ44N Q2
U 1 1 5DA1721F
P 6570 2070
F 0 "Q2" H 6776 2116 50  0000 L CNN
F 1 "IRFZ44N" H 6776 2025 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7420 2095 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BU/BUZ11.pdf" H 6570 2070 50  0001 L CNN
	1    6570 2070
	1    0    0    -1  
$EndComp
Wire Wire Line
	9420 2070 9670 2070
$Comp
L power:GND #PWR05
U 1 1 5DA78781
P 5470 3570
F 0 "#PWR05" H 5470 3320 50  0001 C CNN
F 1 "GND" H 5475 3397 50  0000 C CNN
F 2 "" H 5470 3570 50  0001 C CNN
F 3 "" H 5470 3570 50  0001 C CNN
	1    5470 3570
	1    0    0    -1  
$EndComp
Wire Wire Line
	5470 3370 5470 3570
Connection ~ 5470 3370
Wire Wire Line
	5470 3370 5620 3370
$Comp
L power:GND #PWR03
U 1 1 5DA7AF7F
P 4830 3770
F 0 "#PWR03" H 4830 3520 50  0001 C CNN
F 1 "GND" H 4835 3597 50  0000 C CNN
F 2 "" H 4830 3770 50  0001 C CNN
F 3 "" H 4830 3770 50  0001 C CNN
	1    4830 3770
	1    0    0    -1  
$EndComp
Wire Wire Line
	6170 3020 6370 3020
Wire Wire Line
	5370 3370 5470 3370
$Comp
L Device:C C3
U 1 1 5DA7830A
P 4830 3380
F 0 "C3" H 4945 3426 50  0000 L CNN
F 1 "2.2n" H 4945 3335 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 4868 3230 50  0001 C CNN
F 3 "~" H 4830 3380 50  0001 C CNN
	1    4830 3380
	1    0    0    -1  
$EndComp
Wire Wire Line
	4970 2820 4670 2820
$Comp
L Device:R R1
U 1 1 5DA77ABB
P 4490 3380
F 0 "R1" H 4560 3426 50  0000 L CNN
F 1 "391 ohm" H 4560 3335 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 4420 3380 50  0001 C CNN
F 3 "~" H 4490 3380 50  0001 C CNN
	1    4490 3380
	1    0    0    -1  
$EndComp
Wire Wire Line
	5620 2470 5620 2320
Wire Wire Line
	5370 2320 5370 2470
Wire Wire Line
	5620 2320 5370 2320
$Comp
L mcp1407:MCP1407 U3
U 1 1 5DA4EB9C
P 5470 2770
F 0 "U3" H 5920 2870 50  0000 L CNN
F 1 "MCP1407" H 5320 2620 50  0000 L CNN
F 2 "Package_SO:SOIC-8-1EP_3.9x4.9mm_P1.27mm_EP2.41x3.3mm" H 5870 2870 50  0001 C CNN
F 3 "" H 5870 2870 50  0001 C CNN
	1    5470 2770
	1    0    0    -1  
$EndComp
Text GLabel 5520 2320 1    50   Input ~ 0
VCC
Wire Wire Line
	10420 2570 10420 2420
Connection ~ 9670 2970
Wire Wire Line
	9670 2970 9670 3120
Wire Wire Line
	9870 3120 9670 3120
Wire Wire Line
	9870 2970 9670 2970
$Comp
L mcp1407:MCP1407 U2
U 1 1 5DA9A531
P 10570 2870
F 0 "U2" H 11020 2970 50  0000 L CNN
F 1 "MCP1407" H 10420 2720 50  0000 L CNN
F 2 "Package_SO:SOIC-8-1EP_3.9x4.9mm_P1.27mm_EP2.41x3.3mm" H 10970 2970 50  0001 C CNN
F 3 "" H 10970 2970 50  0001 C CNN
	1    10570 2870
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DA9A525
P 11370 3470
F 0 "R2" H 11300 3516 50  0000 R CNN
F 1 "391 ohm" H 11300 3425 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 11300 3470 50  0001 C CNN
F 3 "~" H 11370 3470 50  0001 C CNN
	1    11370 3470
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5DA9A50D
P 11220 3870
F 0 "#PWR013" H 11220 3620 50  0001 C CNN
F 1 "GND" H 11225 3697 50  0000 C CNN
F 2 "" H 11220 3870 50  0001 C CNN
F 3 "" H 11220 3870 50  0001 C CNN
	1    11220 3870
	-1   0    0    -1  
$EndComp
Wire Wire Line
	11220 3870 11220 3620
$Comp
L Device:C C4
U 1 1 5DA9A519
P 11120 3400
F 0 "C4" H 11235 3446 50  0000 L CNN
F 1 "2.2n" H 11235 3355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 11158 3250 50  0001 C CNN
F 3 "~" H 11120 3400 50  0001 C CNN
	1    11120 3400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	11370 3170 11370 3320
Wire Wire Line
	11370 3620 11220 3620
Connection ~ 11370 3170
Wire Wire Line
	11070 2920 11370 2920
Wire Wire Line
	11370 2920 11370 3170
$Comp
L power:GND #PWR012
U 1 1 5DA9A504
P 10570 3670
F 0 "#PWR012" H 10570 3420 50  0001 C CNN
F 1 "GND" H 10575 3497 50  0000 C CNN
F 2 "" H 10570 3670 50  0001 C CNN
F 3 "" H 10570 3670 50  0001 C CNN
	1    10570 3670
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9670 2070 9670 2290
Text GLabel 11370 3020 2    50   Input ~ 0
PWM_FRIO
Text GLabel 4670 2970 0    50   Input ~ 0
PWM_CALOR
Text GLabel 1750 5600 0    50   Input ~ 0
PWM_FRIO
Text GLabel 1700 5450 0    50   Input ~ 0
PWM_CALOR
Wire Wire Line
	1750 5600 2200 5600
Wire Wire Line
	1700 5450 1750 5450
Wire Wire Line
	1750 5450 1750 5500
Wire Wire Line
	1750 5500 2200 5500
Text GLabel 1700 5750 0    50   Input ~ 0
PMOS_CALOR
Text GLabel 1750 5900 0    50   Input ~ 0
PMOS_FRIO
Wire Wire Line
	2200 5700 1700 5700
Wire Wire Line
	1700 5700 1700 5750
Wire Wire Line
	2200 5800 1750 5800
Wire Wire Line
	1750 5800 1750 5900
$Comp
L power:GND #PWR04
U 1 1 5DB35EB1
P 3200 6700
F 0 "#PWR04" H 3200 6450 50  0001 C CNN
F 1 "GND" H 3205 6527 50  0000 C CNN
F 2 "" H 3200 6700 50  0001 C CNN
F 3 "" H 3200 6700 50  0001 C CNN
	1    3200 6700
	1    0    0    -1  
$EndComp
Text GLabel 3500 5700 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_SUPERFICIAL
Wire Wire Line
	3200 5700 3500 5700
$Comp
L Amplifier_Operational:LM2902 U1
U 1 1 5DB6759D
P 11000 6900
F 0 "U1" H 11000 7267 50  0000 C CNN
F 1 "LM2902" H 11000 7176 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 10950 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 11050 7100 50  0001 C CNN
	1    11000 6900
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2902 U1
U 2 1 5DB680CD
P 3200 9250
F 0 "U1" H 3200 9617 50  0000 C CNN
F 1 "LM2902" H 3200 9526 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3150 9350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3250 9450 50  0001 C CNN
	2    3200 9250
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM2902 U1
U 3 1 5DB69274
P 7990 8150
F 0 "U1" H 7990 8517 50  0000 C CNN
F 1 "LM2902" H 7990 8426 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7940 8250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 8040 8350 50  0001 C CNN
	3    7990 8150
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2902 U1
U 4 1 5DB6A558
P 9190 8700
F 0 "U1" H 9190 9067 50  0000 C CNN
F 1 "LM2902" H 9190 8976 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9140 8800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 9240 8900 50  0001 C CNN
	4    9190 8700
	1    0    0    -1  
$EndComp
$Comp
L Reference_Voltage:TL431LP U5
U 1 1 5DBB7301
P 9840 5000
F 0 "U5" V 9886 4930 50  0000 R CNN
F 1 "TL431LP" V 9795 4930 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9840 4850 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 9840 5000 50  0001 C CIN
	1    9840 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9840 4900 9840 4750
Wire Wire Line
	9840 4750 9740 4750
Wire Wire Line
	9740 4750 9740 5000
$Comp
L power:GND #PWR02
U 1 1 5DBBB4F4
P 9840 5200
F 0 "#PWR02" H 9840 4950 50  0001 C CNN
F 1 "GND" H 9845 5027 50  0000 C CNN
F 2 "" H 9840 5200 50  0001 C CNN
F 3 "" H 9840 5200 50  0001 C CNN
	1    9840 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9840 5200 9840 5100
$Comp
L Device:R R13
U 1 1 5DBBEB07
P 9340 4750
F 0 "R13" V 9133 4750 50  0000 C CNN
F 1 "1k" V 9224 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 9270 4750 50  0001 C CNN
F 3 "~" H 9340 4750 50  0001 C CNN
	1    9340 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	9490 4750 9740 4750
Connection ~ 9740 4750
Text GLabel 8990 4750 0    50   Input ~ 0
VCC_OPAMPS
Wire Wire Line
	9190 4750 8990 4750
$Comp
L Device:R R3
U 1 1 5DBD5433
P 10300 7200
F 0 "R3" H 10370 7246 50  0000 L CNN
F 1 "39k" H 10370 7155 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10230 7200 50  0001 C CNN
F 3 "~" H 10300 7200 50  0001 C CNN
	1    10300 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5DBD9E8B
P 10650 7550
F 0 "R5" H 10720 7596 50  0000 L CNN
F 1 "27k" H 10720 7505 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10580 7550 50  0001 C CNN
F 3 "~" H 10650 7550 50  0001 C CNN
	1    10650 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5DBDA8F2
P 11000 7300
F 0 "R4" V 10793 7300 50  0000 C CNN
F 1 "39k" V 10884 7300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10930 7300 50  0001 C CNN
F 3 "~" H 11000 7300 50  0001 C CNN
	1    11000 7300
	0    1    1    0   
$EndComp
Wire Wire Line
	10700 7000 10650 7000
Wire Wire Line
	10650 7000 10650 7300
Wire Wire Line
	10650 7300 10850 7300
Wire Wire Line
	10650 7300 10650 7400
Connection ~ 10650 7300
Wire Wire Line
	11300 6900 11300 7300
Wire Wire Line
	11300 7300 11150 7300
Wire Wire Line
	10700 6800 10300 6800
Wire Wire Line
	10300 7350 10300 7700
Wire Wire Line
	10300 7700 10450 7700
$Comp
L power:GND #PWR010
U 1 1 5DBEDCE3
P 10450 7700
F 0 "#PWR010" H 10450 7450 50  0001 C CNN
F 1 "GND" H 10455 7527 50  0000 C CNN
F 2 "" H 10450 7700 50  0001 C CNN
F 3 "" H 10450 7700 50  0001 C CNN
	1    10450 7700
	1    0    0    -1  
$EndComp
Connection ~ 10450 7700
Wire Wire Line
	10450 7700 10650 7700
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5DBF66F3
P 10850 6200
F 0 "J2" H 10930 6192 50  0000 L CNN
F 1 "BorneraGrupoTermistores" H 10930 6101 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10850 6200 50  0001 C CNN
F 3 "~" H 10850 6200 50  0001 C CNN
	1    10850 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 6300 10300 6300
Wire Wire Line
	10300 6300 10300 6800
Connection ~ 10300 6800
Wire Wire Line
	10300 6800 10300 7050
Wire Wire Line
	11300 6900 11550 6900
Connection ~ 11300 6900
Connection ~ 9840 4750
Text GLabel 10290 4750 3    50   Input ~ 0
REF_OPAMPS
Wire Wire Line
	9840 4750 10290 4750
Text GLabel 10300 6150 1    50   Input ~ 0
REF_OPAMPS
Wire Wire Line
	10300 6150 10300 6200
Wire Wire Line
	10300 6200 10650 6200
Text GLabel 7290 7800 1    50   Input ~ 0
REF_OPAMPS
$Comp
L Device:R R6
U 1 1 5DCA69BD
P 7290 8050
F 0 "R6" H 7360 8096 50  0000 L CNN
F 1 "3.3k" H 7360 8005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7220 8050 50  0001 C CNN
F 3 "~" H 7290 8050 50  0001 C CNN
	1    7290 8050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5DCA906F
P 7290 8500
F 0 "R7" H 7360 8546 50  0000 L CNN
F 1 "1k" H 7360 8455 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7220 8500 50  0001 C CNN
F 3 "~" H 7290 8500 50  0001 C CNN
	1    7290 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7290 7800 7290 7900
Wire Wire Line
	7290 8200 7290 8250
Wire Wire Line
	7690 8050 7540 8050
Wire Wire Line
	7540 8050 7540 8250
Wire Wire Line
	7540 8250 7290 8250
Connection ~ 7290 8250
Wire Wire Line
	7290 8250 7290 8350
Wire Wire Line
	7690 8250 7690 8550
Wire Wire Line
	7690 8550 8290 8550
Wire Wire Line
	8290 8550 8290 8150
$Comp
L power:GND #PWR07
U 1 1 5DCC00D9
P 7290 8650
F 0 "#PWR07" H 7290 8400 50  0001 C CNN
F 1 "GND" H 7295 8477 50  0000 C CNN
F 2 "" H 7290 8650 50  0001 C CNN
F 3 "" H 7290 8650 50  0001 C CNN
	1    7290 8650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5DCC32EF
P 8790 8150
F 0 "J3" H 8870 8142 50  0000 L CNN
F 1 "BorneraTermistor" H 8870 8051 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 8790 8150 50  0001 C CNN
F 3 "~" H 8790 8150 50  0001 C CNN
	1    8790 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8290 8150 8590 8150
Connection ~ 8290 8150
Wire Wire Line
	8590 8250 8590 8600
$Comp
L Device:R R8
U 1 1 5DCDF18F
P 8590 8950
F 0 "R8" H 8660 8996 50  0000 L CNN
F 1 "39k" H 8660 8905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8520 8950 50  0001 C CNN
F 3 "~" H 8590 8950 50  0001 C CNN
	1    8590 8950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5DCDF900
P 8890 9200
F 0 "R9" H 8960 9246 50  0000 L CNN
F 1 "10k" H 8960 9155 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8820 9200 50  0001 C CNN
F 3 "~" H 8890 9200 50  0001 C CNN
	1    8890 9200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5DCE03B3
P 9140 9000
F 0 "R10" V 8933 9000 50  0000 C CNN
F 1 "82k" V 9024 9000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9070 9000 50  0001 C CNN
F 3 "~" H 9140 9000 50  0001 C CNN
	1    9140 9000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5DD05E54
P 8890 9350
F 0 "#PWR08" H 8890 9100 50  0001 C CNN
F 1 "GND" H 8895 9177 50  0000 C CNN
F 2 "" H 8890 9350 50  0001 C CNN
F 3 "" H 8890 9350 50  0001 C CNN
	1    8890 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8590 8600 8890 8600
Wire Wire Line
	8590 8600 8590 8650
Connection ~ 8590 8600
Wire Wire Line
	8590 9100 8590 9350
Wire Wire Line
	8590 9350 8890 9350
Connection ~ 8890 9350
Wire Wire Line
	8890 9050 8890 9000
Wire Wire Line
	8890 9000 8990 9000
Wire Wire Line
	8890 9000 8890 8800
Connection ~ 8890 9000
Wire Wire Line
	9290 9000 9490 9000
Wire Wire Line
	9490 9000 9490 8700
Text GLabel 9490 9000 3    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_PUNTUAL
Text GLabel 3500 5850 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_PUNTUAL
Wire Wire Line
	3200 5800 3450 5800
Wire Wire Line
	3450 5800 3450 5850
Wire Wire Line
	3450 5850 3500 5850
$Comp
L Transistor_BJT:BC337 Q5
U 1 1 5DD40153
P 5470 1320
F 0 "Q5" H 5661 1366 50  0000 L CNN
F 1 "BC337" H 5661 1275 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5670 1245 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 5470 1320 50  0001 L CNN
	1    5470 1320
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5DD46258
P 5570 920
F 0 "R11" H 5640 966 50  0000 L CNN
F 1 "1K" H 5640 875 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 5500 920 50  0001 C CNN
F 3 "~" H 5570 920 50  0001 C CNN
	1    5570 920 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5570 1070 5570 1120
Wire Wire Line
	6370 1120 5570 1120
Connection ~ 5570 1120
$Comp
L power:GND #PWR06
U 1 1 5DD527FE
P 5570 1520
F 0 "#PWR06" H 5570 1270 50  0001 C CNN
F 1 "GND" H 5575 1347 50  0000 C CNN
F 2 "" H 5570 1520 50  0001 C CNN
F 3 "" H 5570 1520 50  0001 C CNN
	1    5570 1520
	1    0    0    -1  
$EndComp
Text GLabel 5570 770  1    50   Input ~ 0
VCC
Text GLabel 4670 1320 0    50   Input ~ 0
PMOS_FRIO
$Comp
L Transistor_BJT:BC337 Q6
U 1 1 5DD8DA09
P 10320 1320
F 0 "Q6" H 10511 1366 50  0000 L CNN
F 1 "BC337" H 10511 1275 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 10520 1245 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 10320 1320 50  0001 L CNN
	1    10320 1320
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5DD8DA0F
P 10220 920
F 0 "R12" H 10150 966 50  0000 R CNN
F 1 "1K" H 10150 875 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 10150 920 50  0001 C CNN
F 3 "~" H 10220 920 50  0001 C CNN
	1    10220 920 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10220 1070 10220 1120
Wire Wire Line
	9420 1120 10220 1120
Connection ~ 10220 1120
$Comp
L power:GND #PWR011
U 1 1 5DD8DA18
P 10220 1520
F 0 "#PWR011" H 10220 1270 50  0001 C CNN
F 1 "GND" H 10225 1347 50  0000 C CNN
F 2 "" H 10220 1520 50  0001 C CNN
F 3 "" H 10220 1520 50  0001 C CNN
	1    10220 1520
	-1   0    0    -1  
$EndComp
Text GLabel 10220 770  1    50   Input ~ 0
VCC
Text GLabel 10970 1320 2    50   Input ~ 0
PMOS_CALOR
Text GLabel 770  880  0    50   Input ~ 0
VCC
$Comp
L Device:CP C7
U 1 1 5DDEEE5E
P 920 1030
F 0 "C7" H 1038 1076 50  0000 L CNN
F 1 "1000u" H 1038 985 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D18.0mm_H35.5mm_P7.50mm" H 958 880 50  0001 C CNN
F 3 "~" H 920 1030 50  0001 C CNN
	1    920  1030
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5DDEF386
P 1320 1030
F 0 "C8" H 1435 1076 50  0000 L CNN
F 1 "1u" H 1435 985 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D12.0mm_W4.4mm_P7.75mm" H 1358 880 50  0001 C CNN
F 3 "~" H 1320 1030 50  0001 C CNN
	1    1320 1030
	1    0    0    -1  
$EndComp
Wire Wire Line
	920  880  1320 880 
Connection ~ 920  880 
$Comp
L power:GND #PWR01
U 1 1 5DE02718
P 1120 1180
F 0 "#PWR01" H 1120 930 50  0001 C CNN
F 1 "GND" H 1125 1007 50  0000 C CNN
F 2 "" H 1120 1180 50  0001 C CNN
F 3 "" H 1120 1180 50  0001 C CNN
	1    1120 1180
	1    0    0    -1  
$EndComp
Connection ~ 1120 1180
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 5DE0CFDA
P 1820 880
F 0 "J4" H 1900 872 50  0000 L CNN
F 1 "BORNERA_VCC" H 1900 781 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1820 880 50  0001 C CNN
F 3 "~" H 1820 880 50  0001 C CNN
	1    1820 880 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1320 880  1550 880 
Connection ~ 1320 880 
Wire Wire Line
	1620 980  1620 1180
Wire Wire Line
	1120 1180 1320 1180
Connection ~ 1320 1180
Wire Wire Line
	1320 1180 1560 1180
$Comp
L Device:C C9
U 1 1 5DE3A5E4
P 3800 5300
F 0 "C9" H 3915 5346 50  0000 L CNN
F 1 "100n" H 3915 5255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 3838 5150 50  0001 C CNN
F 3 "~" H 3800 5300 50  0001 C CNN
	1    3800 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5DE3AC3D
P 3800 5450
F 0 "#PWR0101" H 3800 5200 50  0001 C CNN
F 1 "GND" H 3805 5277 50  0000 C CNN
F 2 "" H 3800 5450 50  0001 C CNN
F 3 "" H 3800 5450 50  0001 C CNN
	1    3800 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5150 3550 5150
Wire Wire Line
	3550 5150 3550 5400
Wire Wire Line
	3550 5400 3200 5400
$Comp
L Device:R R14
U 1 1 5DA61BA5
P 5020 1320
F 0 "R14" V 4813 1320 50  0000 C CNN
F 1 "4k7" V 4904 1320 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4950 1320 50  0001 C CNN
F 3 "~" H 5020 1320 50  0001 C CNN
	1    5020 1320
	0    1    1    0   
$EndComp
Wire Wire Line
	4870 1320 4670 1320
Wire Wire Line
	5170 1320 5270 1320
$Comp
L Device:R R15
U 1 1 5DA8E2C9
P 10720 1320
F 0 "R15" V 10513 1320 50  0000 C CNN
F 1 "4k7" V 10604 1320 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10650 1320 50  0001 C CNN
F 3 "~" H 10720 1320 50  0001 C CNN
	1    10720 1320
	0    1    1    0   
$EndComp
Wire Wire Line
	10570 1320 10520 1320
Wire Wire Line
	10870 1320 10970 1320
Wire Notes Line
	650  7200 6850 7200
Wire Notes Line
	6850 7200 6850 11100
$Comp
L Relay:FINDER-34.51 K1
U 1 1 5DBADF90
P 1950 8650
F 0 "K1" V 2517 8650 50  0000 C CNN
F 1 "FINDER-34.51" V 2426 8650 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Finder_34.51_Vertical" H 3090 8610 50  0001 C CNN
F 3 "https://gfinder.findernet.com/public/attachments/34/EN/S34USAEN.pdf" H 1950 8650 50  0001 C CNN
	1    1950 8650
	0    1    -1   0   
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5DBB5534
P 4250 9350
F 0 "RV1" H 4180 9304 50  0000 R CNN
F 1 "R_POT" H 4180 9395 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_ACP_CA14-H2,5_Horizontal" H 4250 9350 50  0001 C CNN
F 3 "~" H 4250 9350 50  0001 C CNN
	1    4250 9350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4100 9350 3500 9350
Wire Wire Line
	2250 8350 3700 8350
Wire Wire Line
	4250 8350 4250 9200
$Comp
L power:GND #PWR0102
U 1 1 5DBD017E
P 4250 9500
F 0 "#PWR0102" H 4250 9250 50  0001 C CNN
F 1 "GND" H 4255 9327 50  0000 C CNN
F 2 "" H 4250 9500 50  0001 C CNN
F 3 "" H 4250 9500 50  0001 C CNN
	1    4250 9500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 5DBD19E0
P 3700 8750
F 0 "R17" H 3770 8796 50  0000 L CNN
F 1 "R" H 3770 8705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3630 8750 50  0001 C CNN
F 3 "~" H 3700 8750 50  0001 C CNN
	1    3700 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 8600 3700 8350
Connection ~ 3700 8350
Wire Wire Line
	3700 8350 4250 8350
Wire Wire Line
	3700 8900 3700 9150
Wire Wire Line
	3700 9150 3500 9150
$Comp
L Device:D_Zener D6
U 1 1 5DBE3AAF
P 3700 9700
F 0 "D6" V 3654 9779 50  0000 L CNN
F 1 "D_Zener" V 3745 9779 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AE_P12.70mm_Horizontal" H 3700 9700 50  0001 C CNN
F 3 "~" H 3700 9700 50  0001 C CNN
	1    3700 9700
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 5DBE513D
P 3700 10100
F 0 "R16" H 3770 10146 50  0000 L CNN
F 1 "R" H 3770 10055 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3630 10100 50  0001 C CNN
F 3 "~" H 3700 10100 50  0001 C CNN
	1    3700 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 9950 3700 9850
Wire Wire Line
	3700 9550 3700 9150
Connection ~ 3700 9150
$Comp
L power:GND #PWR0103
U 1 1 5DBF6BE1
P 3700 10290
F 0 "#PWR0103" H 3700 10040 50  0001 C CNN
F 1 "GND" H 3705 10117 50  0000 C CNN
F 2 "" H 3700 10290 50  0001 C CNN
F 3 "" H 3700 10290 50  0001 C CNN
	1    3700 10290
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 9250 2250 8850
$Comp
L power:GND #PWR0104
U 1 1 5DBFFF00
P 1590 8850
F 0 "#PWR0104" H 1590 8600 50  0001 C CNN
F 1 "GND" H 1595 8677 50  0000 C CNN
F 2 "" H 1590 8850 50  0001 C CNN
F 3 "" H 1590 8850 50  0001 C CNN
	1    1590 8850
	1    0    0    -1  
$EndComp
Text GLabel 4250 8350 1    50   Input ~ 0
VCC
NoConn ~ 2250 8550
Text GLabel 1650 8450 0    50   Input ~ 0
inPowerSupply
Text Notes 800  7900 0    50   ~ 0
la red inPowerSupply es el conector que va directo a la fuente de alimentacion.\nEl rele posiblemente convenga comprar un modulo de arduino, que trae el optoacoplador integrado,\nporque es posible que el opamp no pueda entregar corriente como para encender el rele\nEl interruptor seria un pulsador de encendido. Cuando se lo presiona, se enciende el rele y el \nopamp lo mantiene activado despues que se suelta el interruptor. Hasta que la tension baje 10%\n\n
Text Notes 2500 7400 0    118  ~ 24
Proteccion de la bateria
$Comp
L pspice:DIODE D5
U 1 1 5DC0F8BF
P 2640 9250
F 0 "D5" H 2640 9515 50  0000 C CNN
F 1 "DIODE" H 2640 9424 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 2640 9250 50  0001 C CNN
F 3 "~" H 2640 9250 50  0001 C CNN
	1    2640 9250
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 5DC12DEC
P 2100 9800
F 0 "SW1" H 2100 10067 50  0000 C CNN
F 1 "SW_DIP_x01" H 2100 9976 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 2100 9800 50  0001 C CNN
F 3 "~" H 2100 9800 50  0001 C CNN
	1    2100 9800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 9800 2400 9250
Wire Wire Line
	2400 9250 2250 9250
Text GLabel 1800 9800 0    50   Input ~ 0
inPowerSupply
Connection ~ 8670 1570
Connection ~ 7120 770 
Connection ~ 8670 770 
Connection ~ 8670 2420
Connection ~ 8270 2420
$Comp
L Device:L L2
U 1 1 5DA42AEC
P 8520 1570
F 0 "L2" V 8339 1570 50  0000 C CNN
F 1 "22uH" V 8430 1570 50  0000 C CNN
F 2 "Inductor_THT:L_Radial_D10.0mm_P5.00mm_Neosid_SD12k_style3" H 8520 1570 50  0001 C CNN
F 3 "~" H 8520 1570 50  0001 C CNN
	1    8520 1570
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5822 D3
U 1 1 5DA4F4D5
P 8670 1420
F 0 "D3" V 8624 1499 50  0000 L CNN
F 1 "1N5822" V 8715 1499 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 8670 1245 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 8670 1420 50  0001 C CNN
	1    8670 1420
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5822 D4
U 1 1 5DA4FEC6
P 8670 2020
F 0 "D4" V 8624 2099 50  0000 L CNN
F 1 "1N5822" V 8715 2099 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 8670 1845 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 8670 2020 50  0001 C CNN
	1    8670 2020
	0    1    1    0   
$EndComp
Wire Wire Line
	7120 770  8670 770 
Wire Wire Line
	8270 2420 8670 2420
$Comp
L Device:C C10
U 1 1 5DC34274
P 9900 7150
F 0 "C10" H 10015 7196 50  0000 L CNN
F 1 "4.7n" H 10015 7105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D9.0mm_W5.0mm_P10.00mm" H 9938 7000 50  0001 C CNN
F 3 "~" H 9900 7150 50  0001 C CNN
	1    9900 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 7000 9900 6800
Wire Wire Line
	9900 6800 10300 6800
Wire Wire Line
	9900 7300 9900 7700
Wire Wire Line
	9900 7700 10300 7700
Connection ~ 10300 7700
Text GLabel 1700 4950 0    50   Input ~ 0
PIN-WARNING-LED-RED
Text GLabel 1800 5100 0    50   Input ~ 0
PIN-CAUTION-LED-YELLOW
Text GLabel 1650 6400 0    50   Input ~ 0
PIN-READY-LED-GREEN
Wire Wire Line
	1700 4950 2000 4950
Wire Wire Line
	2000 4950 2000 5200
Wire Wire Line
	2000 5200 2200 5200
Wire Wire Line
	1800 5100 1800 5300
Wire Wire Line
	1800 5300 2200 5300
Wire Wire Line
	2200 6200 1650 6200
Wire Wire Line
	1650 6200 1650 6400
Text GLabel 5460 5550 1    50   Input ~ 0
PIN-WARNING-LED-RED
Text GLabel 6420 5630 1    50   Input ~ 0
PIN-CAUTION-LED-YELLOW
Text GLabel 7330 5680 1    50   Input ~ 0
PIN-READY-LED-GREEN
$Comp
L Transistor_BJT:BC548 Q7
U 1 1 5DD2F3EB
P 5770 5550
F 0 "Q7" H 5961 5596 50  0000 L CNN
F 1 "BC548" H 5961 5505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5970 5475 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 5770 5550 50  0001 L CNN
	1    5770 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5DD3680D
P 5870 5950
F 0 "R18" V 5663 5950 50  0000 C CNN
F 1 "220" V 5754 5950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5800 5950 50  0001 C CNN
F 3 "~" H 5870 5950 50  0001 C CNN
	1    5870 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5DD4C48B
P 5870 6350
F 0 "#PWR0106" H 5870 6100 50  0001 C CNN
F 1 "GND" H 5875 6177 50  0000 C CNN
F 2 "" H 5870 6350 50  0001 C CNN
F 3 "" H 5870 6350 50  0001 C CNN
	1    5870 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D7
U 1 1 5DD74EC2
P 5870 5050
F 0 "D7" V 5909 4933 50  0000 R CNN
F 1 "LED" V 5818 4933 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 5870 5050 50  0001 C CNN
F 3 "~" H 5870 5050 50  0001 C CNN
	1    5870 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5870 5200 5870 5350
Text GLabel 5870 4750 1    50   Input ~ 0
VCC
Wire Wire Line
	5870 4900 5870 4750
$Comp
L Transistor_BJT:BC548 Q8
U 1 1 5DDA6B4D
P 7620 5680
F 0 "Q8" H 7811 5726 50  0000 L CNN
F 1 "BC548" H 7811 5635 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7820 5605 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 7620 5680 50  0001 L CNN
	1    7620 5680
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5DDA6B5A
P 7720 6330
F 0 "#PWR0107" H 7720 6080 50  0001 C CNN
F 1 "GND" H 7725 6157 50  0000 C CNN
F 2 "" H 7720 6330 50  0001 C CNN
F 3 "" H 7720 6330 50  0001 C CNN
	1    7720 6330
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D9
U 1 1 5DDA6B61
P 7720 5180
F 0 "D9" V 7759 5063 50  0000 R CNN
F 1 "LED" V 7668 5063 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 7720 5180 50  0001 C CNN
F 3 "~" H 7720 5180 50  0001 C CNN
	1    7720 5180
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7720 5330 7720 5480
Text GLabel 7720 4880 1    50   Input ~ 0
VCC
Wire Wire Line
	7720 5030 7720 4880
$Comp
L Transistor_BJT:BC548 Q9
U 1 1 5DDBD08D
P 6720 5630
F 0 "Q9" H 6911 5676 50  0000 L CNN
F 1 "BC548" H 6911 5585 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6920 5555 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 6720 5630 50  0001 L CNN
	1    6720 5630
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D8
U 1 1 5DDBD0A1
P 6820 5130
F 0 "D8" V 6859 5013 50  0000 R CNN
F 1 "LED" V 6768 5013 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 6820 5130 50  0001 C CNN
F 3 "~" H 6820 5130 50  0001 C CNN
	1    6820 5130
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6820 5280 6820 5430
Text GLabel 6820 4830 1    50   Input ~ 0
VCC
Wire Wire Line
	6820 4980 6820 4830
$Comp
L Device:R R19
U 1 1 5DE483A4
P 7720 6130
F 0 "R19" H 7790 6176 50  0000 L CNN
F 1 "220" H 7790 6085 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7650 6130 50  0001 C CNN
F 3 "~" H 7720 6130 50  0001 C CNN
	1    7720 6130
	1    0    0    -1  
$EndComp
Wire Wire Line
	7720 5980 7720 5880
Wire Wire Line
	7720 6330 7720 6280
$Comp
L power:GND #PWR0108
U 1 1 5DDBD09A
P 6820 6330
F 0 "#PWR0108" H 6820 6080 50  0001 C CNN
F 1 "GND" H 6825 6157 50  0000 C CNN
F 2 "" H 6820 6330 50  0001 C CNN
F 3 "" H 6820 6330 50  0001 C CNN
	1    6820 6330
	1    0    0    -1  
$EndComp
Wire Wire Line
	6820 5880 6820 5830
Wire Wire Line
	6820 6180 6820 6330
Wire Wire Line
	5870 5800 5870 5750
Wire Wire Line
	5870 6100 5870 6350
$Comp
L Device:R R20
U 1 1 5DEE897F
P 6820 6030
F 0 "R20" H 6890 6076 50  0000 L CNN
F 1 "220" H 6890 5985 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6750 6030 50  0001 C CNN
F 3 "~" H 6820 6030 50  0001 C CNN
	1    6820 6030
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5DCCB55D
P 8240 8900
F 0 "C11" H 8355 8946 50  0000 L CNN
F 1 "4.7n" H 8355 8855 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D9.0mm_W5.0mm_P10.00mm" H 8278 8750 50  0001 C CNN
F 3 "~" H 8240 8900 50  0001 C CNN
	1    8240 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8240 8750 8240 8650
Wire Wire Line
	8240 8650 8590 8650
Connection ~ 8590 8650
Wire Wire Line
	8590 8650 8590 8800
Wire Wire Line
	8240 9050 8240 9350
Wire Wire Line
	8240 9350 8590 9350
Connection ~ 8590 9350
Wire Notes Line
	6850 11100 650  11100
Wire Notes Line
	650  11100 650  7200
Text GLabel 2940 900  0    50   Input ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5DC5CB62
P 3340 900
F 0 "J1" H 3420 892 50  0000 L CNN
F 1 "Conn_01x02" H 3420 801 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02_Pitch2.54mm" H 3340 900 50  0001 C CNN
F 3 "~" H 3340 900 50  0001 C CNN
	1    3340 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2940 900  3140 900 
$Comp
L power:GND #PWR016
U 1 1 5DC6A3A3
P 2940 1000
F 0 "#PWR016" H 2940 750 50  0001 C CNN
F 1 "GND" H 2945 827 50  0000 C CNN
F 2 "" H 2940 1000 50  0001 C CNN
F 3 "" H 2940 1000 50  0001 C CNN
	1    2940 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11070 3170 11120 3170
Wire Wire Line
	11120 3250 11120 3170
Connection ~ 11120 3170
Wire Wire Line
	11120 3170 11370 3170
Wire Wire Line
	11120 3550 11120 3620
Wire Wire Line
	11120 3620 11220 3620
Connection ~ 11220 3620
Wire Wire Line
	4670 2820 4670 3070
Wire Wire Line
	4970 3070 4670 3070
Connection ~ 4670 3070
Wire Wire Line
	4670 3070 4670 3220
Wire Wire Line
	4670 3220 4830 3220
Wire Wire Line
	4830 3220 4830 3230
Wire Wire Line
	4670 3220 4490 3220
Wire Wire Line
	4490 3220 4490 3230
Connection ~ 4670 3220
Wire Wire Line
	4490 3530 4490 3610
Wire Wire Line
	4830 3610 4830 3530
Wire Wire Line
	3700 10250 3700 10290
Wire Wire Line
	1650 8850 1590 8850
Wire Wire Line
	10420 3470 10570 3470
Wire Wire Line
	10570 3670 10570 3470
Connection ~ 10570 3470
Wire Wire Line
	10570 3470 10670 3470
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5DB11DC8
P 2700 5600
F 0 "A1" H 2700 4511 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 2700 4420 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 2850 4650 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 2700 4600 50  0001 C CNN
	1    2700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2940 1000 3140 1000
NoConn ~ 2200 5000
NoConn ~ 2200 5100
NoConn ~ 2200 5900
NoConn ~ 2200 6000
NoConn ~ 2200 6100
NoConn ~ 2600 4600
NoConn ~ 2800 4600
NoConn ~ 2200 6300
NoConn ~ 2200 5400
NoConn ~ 3200 6300
NoConn ~ 3200 6200
NoConn ~ 3200 6100
NoConn ~ 3200 6000
NoConn ~ 3200 5900
NoConn ~ 3200 5600
NoConn ~ 3200 5100
NoConn ~ 3200 5000
NoConn ~ 2900 4600
Wire Wire Line
	6370 2070 6370 2350
Wire Wire Line
	6170 2870 6370 2870
Connection ~ 6370 2870
Wire Wire Line
	6370 2870 6370 3020
Wire Wire Line
	2700 6640 2800 6640
Wire Wire Line
	2700 6600 2700 6640
Wire Wire Line
	2800 6600 2800 6640
Connection ~ 2800 6640
Wire Wire Line
	2800 6640 3200 6640
Wire Wire Line
	3200 6640 3200 6700
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5DEA965C
P 1550 880
F 0 "#FLG0101" H 1550 955 50  0001 C CNN
F 1 "PWR_FLAG" H 1550 1053 50  0000 C CNN
F 2 "" H 1550 880 50  0001 C CNN
F 3 "~" H 1550 880 50  0001 C CNN
	1    1550 880 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5DEA9D5B
P 1560 1180
F 0 "#FLG0102" H 1560 1255 50  0001 C CNN
F 1 "PWR_FLAG" H 1560 1353 50  0000 C CNN
F 2 "" H 1560 1180 50  0001 C CNN
F 3 "~" H 1560 1180 50  0001 C CNN
	1    1560 1180
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5DEABF05
P 6370 2350
F 0 "#FLG0103" H 6370 2425 50  0001 C CNN
F 1 "PWR_FLAG" V 6370 2477 50  0000 L CNN
F 2 "" H 6370 2350 50  0001 C CNN
F 3 "~" H 6370 2350 50  0001 C CNN
	1    6370 2350
	0    -1   -1   0   
$EndComp
Connection ~ 6370 2350
Wire Wire Line
	6370 2350 6370 2870
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5DEACECF
P 9670 2290
F 0 "#FLG0104" H 9670 2365 50  0001 C CNN
F 1 "PWR_FLAG" V 9670 2418 50  0000 L CNN
F 2 "" H 9670 2290 50  0001 C CNN
F 3 "~" H 9670 2290 50  0001 C CNN
	1    9670 2290
	0    1    1    0   
$EndComp
Connection ~ 9670 2290
Wire Wire Line
	9670 2290 9670 2970
Wire Wire Line
	4490 3610 4830 3610
Wire Wire Line
	4830 3610 4830 3770
Connection ~ 4830 3610
Connection ~ 1550 880 
Wire Wire Line
	1550 880  1620 880 
Connection ~ 1560 1180
Wire Wire Line
	1560 1180 1620 1180
Wire Wire Line
	770  880  920  880 
Wire Wire Line
	920  1180 1120 1180
Text Notes 550  630  0    50   ~ 0
Alimentación principal
Wire Notes Line
	520  520  520  1420
Wire Notes Line
	520  1420 2490 1420
Wire Notes Line
	2490 1420 2490 520 
Wire Notes Line
	2490 520  520  520 
Wire Notes Line
	2590 520  2590 1420
Wire Notes Line
	2590 1420 4000 1420
Wire Notes Line
	4000 1420 4000 520 
Wire Notes Line
	4000 520  2590 520 
Text Notes 2630 650  0    50   ~ 0
Medidor de batería
Wire Notes Line
	8300 4390 10470 4390
Wire Notes Line
	10470 4390 10470 5420
Wire Notes Line
	10470 5420 8300 5420
Wire Notes Line
	8300 5420 8300 4390
Text Notes 8340 4490 0    50   ~ 0
Referencia para los Op Amps
Wire Notes Line
	530  2850 530  1520
Wire Notes Line
	2430 2850 530  2850
Wire Notes Line
	2430 1520 2430 2850
Wire Notes Line
	530  1520 2430 1520
Text Notes 580  1640 0    50   ~ 0
Alimentación Op Amps
Connection ~ 810  1950
Wire Wire Line
	860  1950 810  1950
Wire Wire Line
	1870 2550 1870 2620
Wire Wire Line
	1160 2550 1160 2450
$Comp
L power:GND #PWR014
U 1 1 5DBAB5D2
P 1160 2550
F 0 "#PWR014" H 1160 2300 50  0001 C CNN
F 1 "GND" H 1165 2377 50  0000 C CNN
F 2 "" H 1160 2550 50  0001 C CNN
F 3 "" H 1160 2550 50  0001 C CNN
	1    1160 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1160 2450 1510 2450
Connection ~ 1160 2450
Wire Wire Line
	1160 2250 1160 2450
Wire Wire Line
	810  2450 1160 2450
Wire Wire Line
	810  1950 810  2150
Wire Wire Line
	1510 1950 1510 2150
$Comp
L Device:C C6
U 1 1 5DB9E92A
P 1510 2300
F 0 "C6" H 1625 2346 50  0000 L CNN
F 1 "0.1u" H 1625 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 1548 2150 50  0001 C CNN
F 3 "~" H 1510 2300 50  0001 C CNN
	1    1510 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5DB9E1BA
P 810 2300
F 0 "C5" H 925 2346 50  0000 L CNN
F 1 "0.33u" H 925 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 848 2150 50  0001 C CNN
F 3 "~" H 810 2300 50  0001 C CNN
	1    810  2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	760  1950 810  1950
Wire Wire Line
	1460 1950 1510 1950
Text GLabel 760  1950 0    50   Input ~ 0
VCC
$Comp
L Regulator_Linear:LM7808_TO220 U4
U 1 1 5DB840F8
P 1160 1950
F 0 "U4" H 1160 2192 50  0000 C CNN
F 1 "LM7808_TO220" H 1160 2101 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 1160 2175 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 1160 1900 50  0001 C CNN
	1    1160 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5DB6DC78
P 1870 2620
F 0 "#PWR015" H 1870 2370 50  0001 C CNN
F 1 "GND" H 1875 2447 50  0000 C CNN
F 2 "" H 1870 2620 50  0001 C CNN
F 3 "" H 1870 2620 50  0001 C CNN
	1    1870 2620
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2902 U1
U 5 1 5DB6B7EE
P 1970 2250
F 0 "U1" H 1928 2296 50  0000 L CNN
F 1 "LM2902" H 1928 2205 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1920 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 2020 2450 50  0001 C CNN
	5    1970 2250
	1    0    0    -1  
$EndComp
Wire Notes Line
	4090 520  4090 4130
Wire Notes Line
	4090 4130 11880 4130
Wire Notes Line
	11880 4130 11880 520 
Wire Notes Line
	11880 520  4090 520 
Text Notes 4130 680  0    79   ~ 0
Driver para el peltier
Text Notes 730  4510 0    79   ~ 0
Microcontrolador
Wire Notes Line
	650  4380 5110 4380
Wire Notes Line
	5110 4380 5110 6960
Wire Notes Line
	5110 6960 650  6960
Wire Notes Line
	650  4380 650  6960
Wire Wire Line
	5460 5550 5570 5550
Wire Wire Line
	6520 5630 6420 5630
Wire Wire Line
	7420 5680 7330 5680
Text GLabel 2300 1950 3    50   Input ~ 0
VCC_OPAMPS
Wire Wire Line
	1510 1950 1870 1950
Connection ~ 1510 1950
Wire Wire Line
	1870 1950 2300 1950
Connection ~ 1870 1950
Text Notes 5320 4500 0    50   ~ 0
LEDs indicadores
Wire Notes Line
	5290 4390 8150 4390
Wire Notes Line
	8150 4390 8150 6660
Wire Notes Line
	8150 6660 5290 6660
Wire Notes Line
	5290 6660 5290 4390
Wire Notes Line
	7150 7210 9590 7210
Wire Notes Line
	9590 7210 9590 10500
Wire Notes Line
	9590 10500 7150 10500
Wire Notes Line
	7150 10500 7150 7210
Text Notes 7630 7430 0    50   ~ 0
Sensor de temperatura disipador
Wire Notes Line
	9750 5580 13190 5580
Wire Notes Line
	13190 5580 13190 7950
Wire Notes Line
	13190 7950 9750 7950
Wire Notes Line
	9750 7950 9750 5580
Text Notes 10540 5880 0    79   ~ 0
Sensor de temperatura del peltier
Text GLabel 11550 6900 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_SUPERFICIAL
Wire Wire Line
	2900 9250 2840 9250
Wire Wire Line
	2440 9250 2400 9250
Connection ~ 2400 9250
$EndSCHEMATC
