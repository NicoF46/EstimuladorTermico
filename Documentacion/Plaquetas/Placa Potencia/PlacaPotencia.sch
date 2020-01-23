EESchema Schematic File Version 4
LIBS:PlacaPotencia-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
	6920 2470 7170 2470
Text GLabel 7170 2470 1    50   Input ~ 0
VCC
Wire Wire Line
	7170 2470 7170 2620
Wire Wire Line
	4120 1620 4420 1620
Connection ~ 4120 1620
Wire Wire Line
	4770 1620 4870 1620
Connection ~ 4770 1620
Wire Wire Line
	4520 1620 4770 1620
$Comp
L Connector:Screw_Terminal_01x02 PELTIER1
U 1 1 5DA5EBF3
P 4420 1420
F 0 "PELTIER1" V 4384 1232 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 4293 1232 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4420 1420 50  0001 C CNN
F 3 "~" H 4420 1420 50  0001 C CNN
	1    4420 1420
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4770 2120 4770 2470
Wire Wire Line
	4770 1820 4770 1620
$Comp
L Device:CP C2
U 1 1 5DA56A1D
P 4770 1970
F 0 "C2" H 4888 2016 50  0000 L CNN
F 1 "33uF" H 4888 1925 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P7.50mm" H 4808 1820 50  0001 C CNN
F 3 "~" H 4770 1970 50  0001 C CNN
	1    4770 1970
	1    0    0    -1  
$EndComp
Connection ~ 3620 2470
Wire Wire Line
	4120 2470 3620 2470
Wire Wire Line
	4120 2120 4120 2470
Wire Wire Line
	4120 1620 4120 1820
Wire Wire Line
	3970 1620 4120 1620
$Comp
L Device:CP C1
U 1 1 5DA5452F
P 4120 1970
F 0 "C1" H 4238 2016 50  0000 L CNN
F 1 "33uF" H 4238 1925 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P7.50mm" H 4158 1820 50  0001 C CNN
F 3 "~" H 4120 1970 50  0001 C CNN
	1    4120 1970
	1    0    0    -1  
$EndComp
Wire Wire Line
	5170 820  5620 820 
Wire Wire Line
	5170 1320 5170 820 
Wire Wire Line
	5620 2470 5620 2320
Wire Wire Line
	5170 2470 5620 2470
Wire Wire Line
	5170 2220 5170 2470
Wire Wire Line
	3620 2470 3620 2170
Wire Wire Line
	3170 2470 3620 2470
Wire Wire Line
	3170 2320 3170 2470
Wire Wire Line
	3170 820  3620 820 
Wire Wire Line
	3620 1320 3620 820 
Wire Wire Line
	3620 1870 3620 1620
Wire Wire Line
	5170 1620 5170 1920
$Comp
L Diode:1N5822 D2
U 1 1 5DA4EC68
P 3620 2020
F 0 "D2" V 3574 2099 50  0000 L CNN
F 1 "1N5822" V 3665 2099 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 3620 1845 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 3620 2020 50  0001 C CNN
	1    3620 2020
	0    1    1    0   
$EndComp
Wire Wire Line
	3620 1620 3170 1620
Connection ~ 3620 1620
$Comp
L Diode:1N5822 D1
U 1 1 5DA49F1B
P 3620 1470
F 0 "D1" V 3574 1549 50  0000 L CNN
F 1 "1N5822" V 3665 1549 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 3620 1295 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 3620 1470 50  0001 C CNN
	1    3620 1470
	0    1    1    0   
$EndComp
Wire Wire Line
	5620 820  5620 970 
Wire Wire Line
	3170 970  3170 820 
Wire Wire Line
	5620 1620 5620 1920
Connection ~ 5620 1620
Wire Wire Line
	5620 1370 5620 1620
Wire Wire Line
	5170 1620 5620 1620
Wire Wire Line
	3170 1620 3170 1920
Connection ~ 3170 1620
Wire Wire Line
	3170 1370 3170 1620
Wire Wire Line
	3670 1620 3620 1620
$Comp
L Device:L L1
U 1 1 5DA335AC
P 3820 1620
F 0 "L1" V 3639 1620 50  0000 C CNN
F 1 "22uH" V 3730 1620 50  0000 C CNN
F 2 "Inductor_THT:L_Radial_D10.0mm_P5.00mm_Neosid_SD12k_style3" H 3820 1620 50  0001 C CNN
F 3 "~" H 3820 1620 50  0001 C CNN
	1    3820 1620
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRF4905 Q1
U 1 1 5DA1F9F5
P 3070 1170
F 0 "Q1" H 3276 1124 50  0000 L CNN
F 1 "IRF4905" H 3276 1215 50  0000 L CNN
F 2 "custom_footprints:TO-220-3_Vertical" H 3270 1095 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 3070 1170 50  0001 L CNN
	1    3070 1170
	1    0    0    1   
$EndComp
$Comp
L Transistor_FET:IRF4905 Q3
U 1 1 5DA1E5F0
P 5720 1170
F 0 "Q3" H 5925 1124 50  0000 L CNN
F 1 "IRF4905" H 5925 1215 50  0000 L CNN
F 2 "custom_footprints:TO-220-3_Vertical" H 5920 1095 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 5720 1170 50  0001 L CNN
	1    5720 1170
	-1   0    0    1   
$EndComp
$Comp
L irfz44n:IRFZ44N Q4
U 1 1 5DA18B26
P 5720 2120
F 0 "Q4" H 5926 2166 50  0000 L CNN
F 1 "IRFZ44N" H 5926 2075 50  0000 L CNN
F 2 "custom_footprints:TO-220-3_Vertical" H 6570 2145 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BU/BUZ11.pdf" H 5720 2120 50  0001 L CNN
	1    5720 2120
	-1   0    0    -1  
$EndComp
$Comp
L irfz44n:IRFZ44N Q2
U 1 1 5DA1721F
P 3070 2120
F 0 "Q2" H 3276 2166 50  0000 L CNN
F 1 "IRFZ44N" H 3276 2075 50  0000 L CNN
F 2 "custom_footprints:TO-220-3_Vertical" H 3920 2145 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BU/BUZ11.pdf" H 3070 2120 50  0001 L CNN
	1    3070 2120
	1    0    0    -1  
$EndComp
Wire Wire Line
	5920 2120 6170 2120
$Comp
L power:GND #PWR05
U 1 1 5DA78781
P 1970 3620
F 0 "#PWR05" H 1970 3370 50  0001 C CNN
F 1 "GND" H 1975 3447 50  0000 C CNN
F 2 "" H 1970 3620 50  0001 C CNN
F 3 "" H 1970 3620 50  0001 C CNN
	1    1970 3620
	1    0    0    -1  
$EndComp
Wire Wire Line
	1970 3420 1970 3620
Connection ~ 1970 3420
Wire Wire Line
	1970 3420 2120 3420
$Comp
L power:GND #PWR03
U 1 1 5DA7AF7F
P 1330 3820
F 0 "#PWR03" H 1330 3570 50  0001 C CNN
F 1 "GND" H 1335 3647 50  0000 C CNN
F 2 "" H 1330 3820 50  0001 C CNN
F 3 "" H 1330 3820 50  0001 C CNN
	1    1330 3820
	1    0    0    -1  
$EndComp
Wire Wire Line
	2670 3070 2870 3070
Wire Wire Line
	1870 3420 1970 3420
$Comp
L Device:C C3
U 1 1 5DA7830A
P 1330 3430
F 0 "C3" H 1445 3476 50  0000 L CNN
F 1 "2.2n" H 1445 3385 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1368 3280 50  0001 C CNN
F 3 "~" H 1330 3430 50  0001 C CNN
	1    1330 3430
	1    0    0    -1  
$EndComp
Wire Wire Line
	1470 2870 1170 2870
$Comp
L Device:R R1
U 1 1 5DA77ABB
P 990 3430
F 0 "R1" H 1060 3476 50  0000 L CNN
F 1 "391 ohm" H 1060 3385 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 920 3430 50  0001 C CNN
F 3 "~" H 990 3430 50  0001 C CNN
	1    990  3430
	1    0    0    -1  
$EndComp
Wire Wire Line
	2120 2520 2120 2370
Wire Wire Line
	1870 2370 1870 2520
Wire Wire Line
	2120 2370 1870 2370
$Comp
L mcp1407:MCP1407 U3
U 1 1 5DA4EB9C
P 1970 2820
F 0 "U3" H 2420 2920 50  0000 L CNN
F 1 "MCP1407" H 1820 2670 50  0000 L CNN
F 2 "Package_SO:SOIC-8-1EP_3.9x4.9mm_P1.27mm_EP2.41x3.3mm" H 2370 2920 50  0001 C CNN
F 3 "" H 2370 2920 50  0001 C CNN
	1    1970 2820
	1    0    0    -1  
$EndComp
Text GLabel 2020 2370 1    50   Input ~ 0
VCC
Wire Wire Line
	6920 2620 6920 2470
Wire Wire Line
	6370 3170 6170 3170
Wire Wire Line
	6370 3020 6170 3020
$Comp
L mcp1407:MCP1407 U2
U 1 1 5DA9A531
P 7070 2920
F 0 "U2" H 7520 3020 50  0000 L CNN
F 1 "MCP1407" H 6920 2770 50  0000 L CNN
F 2 "Package_SO:SOIC-8-1EP_3.9x4.9mm_P1.27mm_EP2.41x3.3mm" H 7470 3020 50  0001 C CNN
F 3 "" H 7470 3020 50  0001 C CNN
	1    7070 2920
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DA9A525
P 7870 3520
F 0 "R2" H 7800 3566 50  0000 R CNN
F 1 "391 ohm" H 7800 3475 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7800 3520 50  0001 C CNN
F 3 "~" H 7870 3520 50  0001 C CNN
	1    7870 3520
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5DA9A50D
P 7720 3920
F 0 "#PWR013" H 7720 3670 50  0001 C CNN
F 1 "GND" H 7725 3747 50  0000 C CNN
F 2 "" H 7720 3920 50  0001 C CNN
F 3 "" H 7720 3920 50  0001 C CNN
	1    7720 3920
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7720 3920 7720 3670
$Comp
L Device:C C4
U 1 1 5DA9A519
P 7620 3450
F 0 "C4" H 7735 3496 50  0000 L CNN
F 1 "2.2n" H 7735 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7658 3300 50  0001 C CNN
F 3 "~" H 7620 3450 50  0001 C CNN
	1    7620 3450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7870 3220 7870 3370
Wire Wire Line
	7870 3670 7720 3670
Connection ~ 7870 3220
Wire Wire Line
	7570 2970 7870 2970
Wire Wire Line
	7870 2970 7870 3220
$Comp
L power:GND #PWR012
U 1 1 5DA9A504
P 7070 3720
F 0 "#PWR012" H 7070 3470 50  0001 C CNN
F 1 "GND" H 7075 3547 50  0000 C CNN
F 2 "" H 7070 3720 50  0001 C CNN
F 3 "" H 7070 3720 50  0001 C CNN
	1    7070 3720
	-1   0    0    -1  
$EndComp
Text GLabel 7870 3070 2    50   Input ~ 0
PWM_FRIO
Text GLabel 1170 2870 0    50   Input ~ 0
PWM_CALOR
$Comp
L Transistor_BJT:BC337 Q5
U 1 1 5DD40153
P 1970 1370
F 0 "Q5" H 2161 1416 50  0000 L CNN
F 1 "BC337" H 2161 1325 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 2170 1295 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 1970 1370 50  0001 L CNN
	1    1970 1370
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5DD46258
P 2070 970
F 0 "R11" H 2140 1016 50  0000 L CNN
F 1 "1K" H 2140 925 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2000 970 50  0001 C CNN
F 3 "~" H 2070 970 50  0001 C CNN
	1    2070 970 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2070 1120 2070 1170
Wire Wire Line
	2870 1170 2070 1170
Connection ~ 2070 1170
$Comp
L power:GND #PWR06
U 1 1 5DD527FE
P 2070 1570
F 0 "#PWR06" H 2070 1320 50  0001 C CNN
F 1 "GND" H 2075 1397 50  0000 C CNN
F 2 "" H 2070 1570 50  0001 C CNN
F 3 "" H 2070 1570 50  0001 C CNN
	1    2070 1570
	1    0    0    -1  
$EndComp
Text GLabel 2070 820  1    50   Input ~ 0
VCC
Text GLabel 1170 1370 0    50   Input ~ 0
PMOS_FRIO
$Comp
L Transistor_BJT:BC337 Q6
U 1 1 5DD8DA09
P 6820 1370
F 0 "Q6" H 7011 1416 50  0000 L CNN
F 1 "BC337" H 7011 1325 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 7020 1295 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 6820 1370 50  0001 L CNN
	1    6820 1370
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5DD8DA0F
P 6720 970
F 0 "R12" H 6650 1016 50  0000 R CNN
F 1 "1K" H 6650 925 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6650 970 50  0001 C CNN
F 3 "~" H 6720 970 50  0001 C CNN
	1    6720 970 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6720 1120 6720 1170
Wire Wire Line
	5920 1170 6720 1170
Connection ~ 6720 1170
$Comp
L power:GND #PWR011
U 1 1 5DD8DA18
P 6720 1570
F 0 "#PWR011" H 6720 1320 50  0001 C CNN
F 1 "GND" H 6725 1397 50  0000 C CNN
F 2 "" H 6720 1570 50  0001 C CNN
F 3 "" H 6720 1570 50  0001 C CNN
	1    6720 1570
	-1   0    0    -1  
$EndComp
Text GLabel 6720 820  1    50   Input ~ 0
VCC
Text GLabel 7470 1370 2    50   Input ~ 0
PMOS_CALOR
$Comp
L Device:R R14
U 1 1 5DA61BA5
P 1520 1370
F 0 "R14" V 1313 1370 50  0000 C CNN
F 1 "4k7" V 1404 1370 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1450 1370 50  0001 C CNN
F 3 "~" H 1520 1370 50  0001 C CNN
	1    1520 1370
	0    1    1    0   
$EndComp
Wire Wire Line
	1370 1370 1170 1370
Wire Wire Line
	1670 1370 1770 1370
$Comp
L Device:R R15
U 1 1 5DA8E2C9
P 7220 1370
F 0 "R15" V 7013 1370 50  0000 C CNN
F 1 "4k7" V 7104 1370 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7150 1370 50  0001 C CNN
F 3 "~" H 7220 1370 50  0001 C CNN
	1    7220 1370
	0    1    1    0   
$EndComp
Wire Wire Line
	7070 1370 7020 1370
Wire Wire Line
	7370 1370 7470 1370
Connection ~ 5170 1620
Connection ~ 5170 2470
$Comp
L Diode:1N5822 D3
U 1 1 5DA4F4D5
P 5170 1470
F 0 "D3" V 5124 1549 50  0000 L CNN
F 1 "1N5822" V 5215 1549 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 5170 1295 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 5170 1470 50  0001 C CNN
	1    5170 1470
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5822 D4
U 1 1 5DA4FEC6
P 5170 2070
F 0 "D4" V 5124 2149 50  0000 L CNN
F 1 "1N5822" V 5215 2149 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 5170 1895 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 5170 2070 50  0001 C CNN
	1    5170 2070
	0    1    1    0   
$EndComp
Wire Wire Line
	7620 3300 7620 3220
Wire Wire Line
	7620 3220 7870 3220
Wire Wire Line
	7620 3600 7620 3670
Wire Wire Line
	7620 3670 7720 3670
Connection ~ 7720 3670
Wire Wire Line
	1170 3270 1330 3270
Wire Wire Line
	1330 3270 1330 3280
Wire Wire Line
	1170 3270 990  3270
Wire Wire Line
	990  3270 990  3280
Connection ~ 1170 3270
Wire Wire Line
	990  3580 990  3660
Wire Wire Line
	1330 3660 1330 3580
Wire Wire Line
	6920 3520 7070 3520
Connection ~ 7070 3520
Wire Wire Line
	7070 3520 7170 3520
Wire Wire Line
	2670 2920 2870 2920
Wire Wire Line
	2870 2920 2870 3070
Wire Wire Line
	990  3660 1330 3660
Wire Wire Line
	1330 3660 1330 3820
Connection ~ 1330 3660
Wire Notes Line
	590  570  590  4180
Wire Notes Line
	590  4180 8380 4180
Wire Notes Line
	8380 4180 8380 570 
Wire Notes Line
	8380 570  590  570 
Text Notes 630  730  0    79   ~ 0
Driver para el peltier
$Comp
L Device:L L2
U 1 1 5DA42AEC
P 5020 1620
F 0 "L2" V 4839 1620 50  0000 C CNN
F 1 "22uH" V 4930 1620 50  0000 C CNN
F 2 "Inductor_THT:L_Radial_D10.0mm_P5.00mm_Neosid_SD12k_style3" H 5020 1620 50  0001 C CNN
F 3 "~" H 5020 1620 50  0001 C CNN
	1    5020 1620
	0    1    1    0   
$EndComp
Text GLabel 3170 820  0    50   Input ~ 0
VCC_P_1
Text GLabel 5170 825  0    50   Input ~ 0
VCC_P_2
Wire Wire Line
	4120 2470 4235 2470
Connection ~ 4120 2470
Connection ~ 4770 2470
Wire Wire Line
	4770 2470 5170 2470
Wire Wire Line
	7070 3520 7070 3720
Text GLabel 3385 820  1    50   Input ~ 0
VCC
Text GLabel 5300 820  1    50   Input ~ 0
VCC
$Comp
L power:GND #PWR0104
U 1 1 5DE4CA6E
P 4235 2470
F 0 "#PWR0104" H 4235 2220 50  0001 C CNN
F 1 "GND" H 4240 2297 50  0000 C CNN
F 2 "" H 4235 2470 50  0001 C CNN
F 3 "" H 4235 2470 50  0001 C CNN
	1    4235 2470
	1    0    0    -1  
$EndComp
Connection ~ 4235 2470
Wire Wire Line
	4235 2470 4770 2470
Wire Wire Line
	1170 2870 1170 3270
$Comp
L Device:R R21
U 1 1 5E0B39C4
P 6170 2690
F 0 "R21" H 6240 2736 50  0000 L CNN
F 1 "15" H 6240 2645 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6100 2690 50  0001 C CNN
F 3 "~" H 6170 2690 50  0001 C CNN
	1    6170 2690
	1    0    0    -1  
$EndComp
Wire Wire Line
	6170 2540 6170 2120
Wire Wire Line
	6170 2830 6170 2840
Connection ~ 6170 2840
Wire Wire Line
	6170 2840 6170 3020
Connection ~ 6170 3020
Wire Wire Line
	6170 3020 6170 3170
$Comp
L Device:R R22
U 1 1 5E0ECAAC
P 2870 2510
F 0 "R22" H 2940 2556 50  0000 L CNN
F 1 "15" H 2940 2465 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2800 2510 50  0001 C CNN
F 3 "~" H 2870 2510 50  0001 C CNN
	1    2870 2510
	1    0    0    -1  
$EndComp
Wire Wire Line
	2870 2360 2870 2120
Wire Wire Line
	2870 2920 2870 2660
Wire Wire Line
	2870 2660 2880 2660
Connection ~ 2870 2920
Connection ~ 2870 2660
Wire Notes Line rgb(0, 136, 194)
	580  560  580  4210
Wire Notes Line rgb(53, 150, 194)
	580  4210 8410 4210
Wire Notes Line rgb(53, 150, 194)
	8410 4210 8410 560 
Wire Notes Line rgb(53, 150, 194)
	8410 560  580  560 
Text GLabel 9050 800  1    50   Input ~ 0
VCC
$Comp
L power:GND #PWR01
U 1 1 5E30E9F7
P 9050 1300
F 0 "#PWR01" H 9050 1050 50  0001 C CNN
F 1 "GND" H 9055 1127 50  0000 C CNN
F 2 "" H 9050 1300 50  0001 C CNN
F 3 "" H 9050 1300 50  0001 C CNN
	1    9050 1300
	1    0    0    -1  
$EndComp
Text GLabel 9950 3100 2    50   Input ~ 0
PMOS_CALOR
$Comp
L Connector:Screw_Terminal_01x02 BORNERA1
U 1 1 5E30EF0B
P 9350 1000
F 0 "BORNERA1" V 9314 812 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 9223 812 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 9350 1000 50  0001 C CNN
F 3 "~" H 9350 1000 50  0001 C CNN
	1    9350 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1100 9050 1200
Wire Wire Line
	9050 1000 9050 900 
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E31469C
P 9050 900
F 0 "#FLG01" H 9050 975 50  0001 C CNN
F 1 "PWR_FLAG" V 9050 1027 50  0000 L CNN
F 2 "" H 9050 900 50  0001 C CNN
F 3 "~" H 9050 900 50  0001 C CNN
	1    9050 900 
	0    -1   -1   0   
$EndComp
Connection ~ 9050 900 
Wire Wire Line
	9050 900  9050 800 
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E314CB7
P 9050 1200
F 0 "#FLG02" H 9050 1275 50  0001 C CNN
F 1 "PWR_FLAG" V 9050 1327 50  0000 L CNN
F 2 "" H 9050 1200 50  0001 C CNN
F 3 "~" H 9050 1200 50  0001 C CNN
	1    9050 1200
	0    -1   -1   0   
$EndComp
Connection ~ 9050 1200
Wire Wire Line
	9050 1200 9050 1300
Wire Wire Line
	9150 1000 9050 1000
Wire Wire Line
	9150 1100 9050 1100
$Comp
L Connector:Screw_Terminal_01x02 BORNERA2
U 1 1 5E335F67
P 9500 1750
F 0 "BORNERA2" V 9464 1562 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 9373 1562 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9500 1750 50  0001 C CNN
F 3 "~" H 9500 1750 50  0001 C CNN
	1    9500 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	9850 1550 9700 1550
Wire Wire Line
	9700 1550 9700 1650
Wire Wire Line
	9850 1850 9700 1850
Wire Wire Line
	9700 1750 9700 1850
NoConn ~ 7570 3220
NoConn ~ 1470 3120
$Comp
L Connector:Screw_Terminal_01x02 BORNERA3
U 1 1 5E34C720
P 9520 3010
F 0 "BORNERA3" V 9484 2822 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 9393 2822 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9520 3010 50  0001 C CNN
F 3 "~" H 9520 3010 50  0001 C CNN
	1    9520 3010
	-1   0    0    1   
$EndComp
Text GLabel 9950 2800 2    50   Input ~ 0
PWM_CALOR
Wire Wire Line
	9720 3010 9850 3010
Wire Wire Line
	9850 3010 9850 3100
Wire Wire Line
	9850 3100 9950 3100
Wire Wire Line
	9720 2910 9850 2910
Wire Wire Line
	9850 2910 9850 2800
Wire Wire Line
	9850 2800 9950 2800
NoConn ~ 10540 810 
NoConn ~ 10540 910 
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5E36A1B8
P 10340 810
F 0 "J1" H 10448 991 50  0000 C CNN
F 1 "Conn_01x02_Male" H 10448 900 50  0000 C CNN
F 2 "custom_footprints:disipadorFETS" H 10340 810 50  0001 C CNN
F 3 "~" H 10340 810 50  0001 C CNN
	1    10340 810 
	1    0    0    -1  
$EndComp
Text GLabel 9850 1850 2    50   Input ~ 0
PMOS_FRIO
Text GLabel 9850 1550 2    50   Input ~ 0
PWM_FRIO
$EndSCHEMATC
