EESchema Schematic File Version 4
LIBS:PlacaEstimuladorTermico-cache
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
	8300 2350 8550 2350
Text GLabel 8400 2350 1    50   Input ~ 0
VCC
Wire Wire Line
	8550 2350 8550 2500
Text GLabel 5500 700  1    50   Input ~ 0
VCC
Wire Wire Line
	5500 1500 5800 1500
Connection ~ 5500 1500
Wire Wire Line
	6150 1500 6250 1500
Connection ~ 6150 1500
Wire Wire Line
	5900 1500 6150 1500
$Comp
L Connector:Screw_Terminal_01x02 PELTIER1
U 1 1 5DA5EBF3
P 5800 1300
F 0 "PELTIER1" V 5764 1112 50  0000 R CNN
F 1 "Screw_Terminal_01x02" V 5673 1112 50  0000 R CNN
F 2 "" H 5800 1300 50  0001 C CNN
F 3 "~" H 5800 1300 50  0001 C CNN
	1    5800 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5850 2350 6150 2350
Connection ~ 5850 2350
Wire Wire Line
	5850 2550 5850 2350
$Comp
L power:GND #PWR09
U 1 1 5DA5A71B
P 5850 2550
F 0 "#PWR09" H 5850 2300 50  0001 C CNN
F 1 "GND" H 5855 2377 50  0000 C CNN
F 2 "" H 5850 2550 50  0001 C CNN
F 3 "" H 5850 2550 50  0001 C CNN
	1    5850 2550
	1    0    0    -1  
$EndComp
Connection ~ 6150 2350
Connection ~ 5500 2350
Wire Wire Line
	5500 2350 5850 2350
Connection ~ 6550 2350
Wire Wire Line
	6150 2350 6550 2350
Wire Wire Line
	6150 2000 6150 2350
Wire Wire Line
	6150 1700 6150 1500
$Comp
L Device:CP C2
U 1 1 5DA56A1D
P 6150 1850
F 0 "C2" H 6268 1896 50  0000 L CNN
F 1 "33uF" H 6268 1805 50  0000 L CNN
F 2 "" H 6188 1700 50  0001 C CNN
F 3 "~" H 6150 1850 50  0001 C CNN
	1    6150 1850
	1    0    0    -1  
$EndComp
Connection ~ 5000 2350
Wire Wire Line
	5500 2350 5000 2350
Wire Wire Line
	5500 2000 5500 2350
Wire Wire Line
	5500 1500 5500 1700
Wire Wire Line
	5350 1500 5500 1500
$Comp
L Device:CP C1
U 1 1 5DA5452F
P 5500 1850
F 0 "C1" H 5618 1896 50  0000 L CNN
F 1 "33uF" H 5618 1805 50  0000 L CNN
F 2 "" H 5538 1700 50  0001 C CNN
F 3 "~" H 5500 1850 50  0001 C CNN
	1    5500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 700  7000 700 
Connection ~ 6550 700 
Wire Wire Line
	6550 1200 6550 700 
Wire Wire Line
	7000 2350 7000 2200
Wire Wire Line
	6550 2350 7000 2350
Wire Wire Line
	6550 2100 6550 2350
Wire Wire Line
	5000 2350 5000 2050
Wire Wire Line
	4550 2350 5000 2350
Wire Wire Line
	4550 2200 4550 2350
Wire Wire Line
	5000 700  6550 700 
Connection ~ 5000 700 
Wire Wire Line
	4550 700  5000 700 
Wire Wire Line
	5000 1200 5000 700 
Wire Wire Line
	5000 1750 5000 1500
Wire Wire Line
	6550 1500 6550 1800
$Comp
L Diode:1N5822 D4
U 1 1 5DA4FEC6
P 6550 1950
F 0 "D4" V 6504 2029 50  0000 L CNN
F 1 "1N5822" V 6595 2029 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 6550 1775 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 6550 1950 50  0001 C CNN
	1    6550 1950
	0    1    1    0   
$EndComp
Connection ~ 6550 1500
$Comp
L Diode:1N5822 D3
U 1 1 5DA4F4D5
P 6550 1350
F 0 "D3" V 6504 1429 50  0000 L CNN
F 1 "1N5822" V 6595 1429 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 6550 1175 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 6550 1350 50  0001 C CNN
	1    6550 1350
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5822 D2
U 1 1 5DA4EC68
P 5000 1900
F 0 "D2" V 4954 1979 50  0000 L CNN
F 1 "1N5822" V 5045 1979 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 5000 1725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 5000 1900 50  0001 C CNN
	1    5000 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 1500 4550 1500
Connection ~ 5000 1500
$Comp
L Diode:1N5822 D1
U 1 1 5DA49F1B
P 5000 1350
F 0 "D1" V 4954 1429 50  0000 L CNN
F 1 "1N5822" V 5045 1429 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 5000 1175 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 5000 1350 50  0001 C CNN
	1    5000 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 700  7000 850 
Wire Wire Line
	4550 850  4550 700 
Wire Wire Line
	7000 1500 7000 1800
Connection ~ 7000 1500
Wire Wire Line
	7000 1250 7000 1500
Wire Wire Line
	6550 1500 7000 1500
Wire Wire Line
	4550 1500 4550 1800
Connection ~ 4550 1500
Wire Wire Line
	4550 1250 4550 1500
Wire Wire Line
	5050 1500 5000 1500
$Comp
L Device:L L2
U 1 1 5DA42AEC
P 6400 1500
F 0 "L2" V 6219 1500 50  0000 C CNN
F 1 "22uH" V 6310 1500 50  0000 C CNN
F 2 "" H 6400 1500 50  0001 C CNN
F 3 "~" H 6400 1500 50  0001 C CNN
	1    6400 1500
	0    1    1    0   
$EndComp
$Comp
L Device:L L1
U 1 1 5DA335AC
P 5200 1500
F 0 "L1" V 5019 1500 50  0000 C CNN
F 1 "22uH" V 5110 1500 50  0000 C CNN
F 2 "" H 5200 1500 50  0001 C CNN
F 3 "~" H 5200 1500 50  0001 C CNN
	1    5200 1500
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRF4905 Q1
U 1 1 5DA1F9F5
P 4450 1050
F 0 "Q1" H 4656 1004 50  0000 L CNN
F 1 "IRF4905" H 4656 1095 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4650 975 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 4450 1050 50  0001 L CNN
	1    4450 1050
	1    0    0    1   
$EndComp
$Comp
L Transistor_FET:IRF4905 Q3
U 1 1 5DA1E5F0
P 7100 1050
F 0 "Q3" H 7305 1004 50  0000 L CNN
F 1 "IRF4905" H 7305 1095 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7300 975 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 7100 1050 50  0001 L CNN
	1    7100 1050
	-1   0    0    1   
$EndComp
$Comp
L Transistor_FET:IRFZ44N Q4
U 1 1 5DA18B26
P 7100 2000
F 0 "Q4" H 7306 2046 50  0000 L CNN
F 1 "IRFZ44N" H 7306 1955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7950 2025 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BU/BUZ11.pdf" H 7100 2000 50  0001 L CNN
	1    7100 2000
	-1   0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRFZ44N Q2
U 1 1 5DA1721F
P 4450 2000
F 0 "Q2" H 4656 2046 50  0000 L CNN
F 1 "IRFZ44N" H 4656 1955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5300 2025 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BU/BUZ11.pdf" H 4450 2000 50  0001 L CNN
	1    4450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2000 7550 2000
Connection ~ 4250 2800
Wire Wire Line
	4250 2950 4250 2800
$Comp
L power:GND #PWR05
U 1 1 5DA78781
P 3350 3500
F 0 "#PWR05" H 3350 3250 50  0001 C CNN
F 1 "GND" H 3355 3327 50  0000 C CNN
F 2 "" H 3350 3500 50  0001 C CNN
F 3 "" H 3350 3500 50  0001 C CNN
	1    3350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3300 3350 3500
Connection ~ 3350 3300
Wire Wire Line
	3350 3300 3500 3300
$Comp
L power:GND #PWR03
U 1 1 5DA7AF7F
P 2700 3700
F 0 "#PWR03" H 2700 3450 50  0001 C CNN
F 1 "GND" H 2705 3527 50  0000 C CNN
F 2 "" H 2700 3700 50  0001 C CNN
F 3 "" H 2700 3700 50  0001 C CNN
	1    2700 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3700 2700 3450
Wire Wire Line
	4050 2950 4250 2950
Wire Wire Line
	4050 2800 4250 2800
Wire Wire Line
	3250 3300 3350 3300
Wire Wire Line
	2900 3000 2900 3150
Wire Wire Line
	2700 3450 2900 3450
$Comp
L Device:C C3
U 1 1 5DA7830A
P 2900 3300
F 0 "C3" H 3015 3346 50  0000 L CNN
F 1 "2.2n" H 3015 3255 50  0000 L CNN
F 2 "" H 2938 3150 50  0001 C CNN
F 3 "~" H 2900 3300 50  0001 C CNN
	1    2900 3300
	1    0    0    -1  
$EndComp
Connection ~ 2700 3450
Connection ~ 2550 3000
Wire Wire Line
	2550 2750 2550 3000
Wire Wire Line
	2850 2750 2550 2750
Wire Wire Line
	2550 3000 2550 3150
Wire Wire Line
	2550 3450 2700 3450
$Comp
L Device:R R1
U 1 1 5DA77ABB
P 2550 3300
F 0 "R1" H 2620 3346 50  0000 L CNN
F 1 "391 ohm" H 2620 3255 50  0000 L CNN
F 2 "" V 2480 3300 50  0001 C CNN
F 3 "~" H 2550 3300 50  0001 C CNN
	1    2550 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2400 3500 2250
Wire Wire Line
	3250 2250 3250 2400
Connection ~ 2850 3000
Wire Wire Line
	2550 3000 2850 3000
Wire Wire Line
	2850 3000 2900 3000
Wire Wire Line
	3500 2250 3250 2250
$Comp
L power:MCP1407 U3
U 1 1 5DA4EB9C
P 3350 2700
F 0 "U3" H 3800 2800 50  0000 L CNN
F 1 "MCP1407" H 3200 2550 50  0000 L CNN
F 2 "" H 3750 2800 50  0001 C CNN
F 3 "" H 3750 2800 50  0001 C CNN
	1    3350 2700
	1    0    0    -1  
$EndComp
Text GLabel 3400 2250 1    50   Input ~ 0
VCC
Wire Wire Line
	8300 2500 8300 2350
Connection ~ 7550 2900
Wire Wire Line
	7550 2900 7550 3050
Wire Wire Line
	7750 3050 7550 3050
Wire Wire Line
	7750 2900 7550 2900
$Comp
L power:MCP1407 U2
U 1 1 5DA9A531
P 8450 2800
F 0 "U2" H 8900 2900 50  0000 L CNN
F 1 "MCP1407" H 8300 2650 50  0000 L CNN
F 2 "" H 8850 2900 50  0001 C CNN
F 3 "" H 8850 2900 50  0001 C CNN
	1    8450 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8950 3100 8900 3100
Wire Wire Line
	9250 3100 8950 3100
Connection ~ 8950 3100
Connection ~ 9100 3550
$Comp
L Device:R R2
U 1 1 5DA9A525
P 9250 3400
F 0 "R2" H 9180 3446 50  0000 R CNN
F 1 "391 ohm" H 9180 3355 50  0000 R CNN
F 2 "" V 9180 3400 50  0001 C CNN
F 3 "~" H 9250 3400 50  0001 C CNN
	1    9250 3400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5DA9A50D
P 9100 3800
F 0 "#PWR013" H 9100 3550 50  0001 C CNN
F 1 "GND" H 9105 3627 50  0000 C CNN
F 2 "" H 9100 3800 50  0001 C CNN
F 3 "" H 9100 3800 50  0001 C CNN
	1    9100 3800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9100 3800 9100 3550
Wire Wire Line
	8900 3100 8900 3250
Wire Wire Line
	9100 3550 8900 3550
$Comp
L Device:C C4
U 1 1 5DA9A519
P 8900 3400
F 0 "C4" H 9015 3446 50  0000 L CNN
F 1 "2.2n" H 9015 3355 50  0000 L CNN
F 2 "" H 8938 3250 50  0001 C CNN
F 3 "~" H 8900 3400 50  0001 C CNN
	1    8900 3400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9250 3100 9250 3250
Wire Wire Line
	9250 3550 9100 3550
Connection ~ 9250 3100
Wire Wire Line
	8950 2850 9250 2850
Wire Wire Line
	9250 2850 9250 3100
Wire Wire Line
	8550 3400 8450 3400
Wire Wire Line
	8450 3400 8300 3400
Connection ~ 8450 3400
Wire Wire Line
	8450 3400 8450 3600
$Comp
L power:GND #PWR012
U 1 1 5DA9A504
P 8450 3600
F 0 "#PWR012" H 8450 3350 50  0001 C CNN
F 1 "GND" H 8455 3427 50  0000 C CNN
F 2 "" H 8450 3600 50  0001 C CNN
F 3 "" H 8450 3600 50  0001 C CNN
	1    8450 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7550 2000 7550 2900
Wire Wire Line
	4250 2000 4250 2800
Text GLabel 9250 2950 2    50   Input ~ 0
PWM_FRIO
Text GLabel 2550 2900 0    50   Input ~ 0
PWM_CALOR
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5DB11DC8
P 2550 5750
F 0 "A1" H 2550 4661 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 2550 4570 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 2700 4800 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 2550 4750 50  0001 C CNN
	1    2550 5750
	1    0    0    -1  
$EndComp
Text GLabel 1600 5750 0    50   Input ~ 0
PWM_FRIO
Text GLabel 1550 5600 0    50   Input ~ 0
PWM_CALOR
Wire Wire Line
	1600 5750 2050 5750
Wire Wire Line
	1550 5600 1600 5600
Wire Wire Line
	1600 5600 1600 5650
Wire Wire Line
	1600 5650 2050 5650
Text GLabel 1550 5900 0    50   Input ~ 0
PMOS_CALOR
Text GLabel 1600 6050 0    50   Input ~ 0
PMOS_FRIO
Wire Wire Line
	2050 5850 1550 5850
Wire Wire Line
	1550 5850 1550 5900
Wire Wire Line
	2050 5950 1600 5950
Wire Wire Line
	1600 5950 1600 6050
Wire Wire Line
	2550 6750 2650 6750
Wire Wire Line
	2650 6750 3050 6750
Wire Wire Line
	3050 6750 3050 6850
Connection ~ 2650 6750
$Comp
L power:GND #PWR04
U 1 1 5DB35EB1
P 3050 6850
F 0 "#PWR04" H 3050 6600 50  0001 C CNN
F 1 "GND" H 3055 6677 50  0000 C CNN
F 2 "" H 3050 6850 50  0001 C CNN
F 3 "" H 3050 6850 50  0001 C CNN
	1    3050 6850
	1    0    0    -1  
$EndComp
Text GLabel 3350 5850 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_SUPERFICIAL
Wire Wire Line
	3050 5850 3350 5850
$Comp
L Amplifier_Operational:LM2902 U1
U 1 1 5DB6759D
P 7450 5000
F 0 "U1" H 7450 5367 50  0000 C CNN
F 1 "LM2902" H 7450 5276 50  0000 C CNN
F 2 "" H 7400 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 7500 5200 50  0001 C CNN
	1    7450 5000
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2902 U1
U 2 1 5DB680CD
P 10350 5650
F 0 "U1" H 10350 6017 50  0000 C CNN
F 1 "LM2902" H 10350 5926 50  0000 C CNN
F 2 "" H 10300 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 10400 5850 50  0001 C CNN
	2    10350 5650
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2902 U1
U 3 1 5DB69274
P 4900 4450
F 0 "U1" H 4900 4817 50  0000 C CNN
F 1 "LM2902" H 4900 4726 50  0000 C CNN
F 2 "" H 4850 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 4950 4650 50  0001 C CNN
	3    4900 4450
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2902 U1
U 4 1 5DB6A558
P 6100 5000
F 0 "U1" H 6100 5367 50  0000 C CNN
F 1 "LM2902" H 6100 5276 50  0000 C CNN
F 2 "" H 6050 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 6150 5200 50  0001 C CNN
	4    6100 5000
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2902 U1
U 5 1 5DB6B7EE
P 10750 4300
F 0 "U1" H 10708 4346 50  0000 L CNN
F 1 "LM2902" H 10708 4255 50  0000 L CNN
F 2 "" H 10700 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 10800 4500 50  0001 C CNN
	5    10750 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5DB6DC78
P 10650 4600
F 0 "#PWR015" H 10650 4350 50  0001 C CNN
F 1 "GND" H 10655 4427 50  0000 C CNN
F 2 "" H 10650 4600 50  0001 C CNN
F 3 "" H 10650 4600 50  0001 C CNN
	1    10650 4600
	1    0    0    -1  
$EndComp
Text GLabel 10650 4000 1    50   Input ~ 0
VCC_OPAMPS
$Comp
L Regulator_Linear:LM7808_TO220 U4
U 1 1 5DB840F8
P 10250 1000
F 0 "U4" H 10250 1242 50  0000 C CNN
F 1 "LM7808_TO220" H 10250 1151 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 10250 1225 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 10250 950 50  0001 C CNN
	1    10250 1000
	1    0    0    -1  
$EndComp
Text GLabel 9850 1000 0    50   Input ~ 0
VCC
Text GLabel 10650 1000 2    50   Input ~ 0
VCC_OPAMPS
Wire Wire Line
	10550 1000 10600 1000
Wire Wire Line
	9850 1000 9900 1000
$Comp
L Device:C C5
U 1 1 5DB9E1BA
P 9900 1350
F 0 "C5" H 10015 1396 50  0000 L CNN
F 1 "0.33u" H 10015 1305 50  0000 L CNN
F 2 "" H 9938 1200 50  0001 C CNN
F 3 "~" H 9900 1350 50  0001 C CNN
	1    9900 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5DB9E92A
P 10600 1350
F 0 "C6" H 10715 1396 50  0000 L CNN
F 1 "0.1u" H 10715 1305 50  0000 L CNN
F 2 "" H 10638 1200 50  0001 C CNN
F 3 "~" H 10600 1350 50  0001 C CNN
	1    10600 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 1000 10600 1200
Connection ~ 10600 1000
Wire Wire Line
	10600 1000 10650 1000
Wire Wire Line
	9900 1000 9900 1200
Connection ~ 9900 1000
Wire Wire Line
	9900 1000 9950 1000
Wire Wire Line
	9900 1500 10250 1500
Wire Wire Line
	10250 1300 10250 1500
Connection ~ 10250 1500
Wire Wire Line
	10250 1500 10600 1500
$Comp
L power:GND #PWR014
U 1 1 5DBAB5D2
P 10250 1600
F 0 "#PWR014" H 10250 1350 50  0001 C CNN
F 1 "GND" H 10255 1427 50  0000 C CNN
F 2 "" H 10250 1600 50  0001 C CNN
F 3 "" H 10250 1600 50  0001 C CNN
	1    10250 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 1600 10250 1500
$Comp
L Reference_Voltage:TL431LP U5
U 1 1 5DBB7301
P 1900 3900
F 0 "U5" V 1946 3830 50  0000 R CNN
F 1 "TL431LP" V 1855 3830 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1900 3750 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 1900 3900 50  0001 C CIN
	1    1900 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 3800 1900 3650
Wire Wire Line
	1900 3650 1800 3650
Wire Wire Line
	1800 3650 1800 3900
$Comp
L power:GND #PWR02
U 1 1 5DBBB4F4
P 1900 4100
F 0 "#PWR02" H 1900 3850 50  0001 C CNN
F 1 "GND" H 1905 3927 50  0000 C CNN
F 2 "" H 1900 4100 50  0001 C CNN
F 3 "" H 1900 4100 50  0001 C CNN
	1    1900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4100 1900 4000
$Comp
L Device:R R13
U 1 1 5DBBEB07
P 1400 3650
F 0 "R13" V 1193 3650 50  0000 C CNN
F 1 "1k" V 1284 3650 50  0000 C CNN
F 2 "" V 1330 3650 50  0001 C CNN
F 3 "~" H 1400 3650 50  0001 C CNN
	1    1400 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 3650 1800 3650
Connection ~ 1800 3650
Text GLabel 1050 3650 0    50   Input ~ 0
VCC_OPAMPS
Wire Wire Line
	1250 3650 1050 3650
$Comp
L Device:R R3
U 1 1 5DBD5433
P 6750 5300
F 0 "R3" H 6820 5346 50  0000 L CNN
F 1 "R" H 6820 5255 50  0000 L CNN
F 2 "" V 6680 5300 50  0001 C CNN
F 3 "~" H 6750 5300 50  0001 C CNN
	1    6750 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5DBD9E8B
P 7100 5650
F 0 "R5" H 7170 5696 50  0000 L CNN
F 1 "R" H 7170 5605 50  0000 L CNN
F 2 "" V 7030 5650 50  0001 C CNN
F 3 "~" H 7100 5650 50  0001 C CNN
	1    7100 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5DBDA8F2
P 7450 5400
F 0 "R4" V 7243 5400 50  0000 C CNN
F 1 "R" V 7334 5400 50  0000 C CNN
F 2 "" V 7380 5400 50  0001 C CNN
F 3 "~" H 7450 5400 50  0001 C CNN
	1    7450 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 5100 7100 5100
Wire Wire Line
	7100 5100 7100 5400
Wire Wire Line
	7100 5400 7300 5400
Wire Wire Line
	7100 5400 7100 5500
Connection ~ 7100 5400
Wire Wire Line
	7750 5000 7750 5400
Wire Wire Line
	7750 5400 7600 5400
Wire Wire Line
	7150 4900 6750 4900
Wire Wire Line
	6750 5450 6750 5800
Wire Wire Line
	6750 5800 6900 5800
$Comp
L power:GND #PWR010
U 1 1 5DBEDCE3
P 6900 5800
F 0 "#PWR010" H 6900 5550 50  0001 C CNN
F 1 "GND" H 6905 5627 50  0000 C CNN
F 2 "" H 6900 5800 50  0001 C CNN
F 3 "" H 6900 5800 50  0001 C CNN
	1    6900 5800
	1    0    0    -1  
$EndComp
Connection ~ 6900 5800
Wire Wire Line
	6900 5800 7100 5800
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5DBF66F3
P 7300 4300
F 0 "J2" H 7380 4292 50  0000 L CNN
F 1 "BorneraGrupoTermistores" H 7380 4201 50  0000 L CNN
F 2 "" H 7300 4300 50  0001 C CNN
F 3 "~" H 7300 4300 50  0001 C CNN
	1    7300 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4400 6750 4400
Wire Wire Line
	6750 4400 6750 4900
Connection ~ 6750 4900
Wire Wire Line
	6750 4900 6750 5150
Text GLabel 8000 5000 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_SUPERFICIAL
Wire Wire Line
	7750 5000 8000 5000
Connection ~ 7750 5000
Connection ~ 1900 3650
Text GLabel 2350 3650 3    50   Input ~ 0
REF_OPAMPS
Wire Wire Line
	1900 3650 2350 3650
Text GLabel 6750 4250 1    50   Input ~ 0
REF_OPAMPS
Wire Wire Line
	6750 4250 6750 4300
Wire Wire Line
	6750 4300 7100 4300
Text GLabel 4200 4100 1    50   Input ~ 0
REF_OPAMPS
$Comp
L Device:R R6
U 1 1 5DCA69BD
P 4200 4350
F 0 "R6" H 4270 4396 50  0000 L CNN
F 1 "R" H 4270 4305 50  0000 L CNN
F 2 "" V 4130 4350 50  0001 C CNN
F 3 "~" H 4200 4350 50  0001 C CNN
	1    4200 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5DCA906F
P 4200 4800
F 0 "R7" H 4270 4846 50  0000 L CNN
F 1 "R" H 4270 4755 50  0000 L CNN
F 2 "" V 4130 4800 50  0001 C CNN
F 3 "~" H 4200 4800 50  0001 C CNN
	1    4200 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4100 4200 4200
Wire Wire Line
	4200 4500 4200 4550
Wire Wire Line
	4600 4350 4450 4350
Wire Wire Line
	4450 4350 4450 4550
Wire Wire Line
	4450 4550 4200 4550
Connection ~ 4200 4550
Wire Wire Line
	4200 4550 4200 4650
Wire Wire Line
	4600 4550 4600 4850
Wire Wire Line
	4600 4850 5200 4850
Wire Wire Line
	5200 4850 5200 4450
$Comp
L power:GND #PWR07
U 1 1 5DCC00D9
P 4200 4950
F 0 "#PWR07" H 4200 4700 50  0001 C CNN
F 1 "GND" H 4205 4777 50  0000 C CNN
F 2 "" H 4200 4950 50  0001 C CNN
F 3 "" H 4200 4950 50  0001 C CNN
	1    4200 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5DCC32EF
P 5700 4450
F 0 "J3" H 5780 4442 50  0000 L CNN
F 1 "BorneraTermistor" H 5780 4351 50  0000 L CNN
F 2 "" H 5700 4450 50  0001 C CNN
F 3 "~" H 5700 4450 50  0001 C CNN
	1    5700 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4450 5500 4450
Connection ~ 5200 4450
Wire Wire Line
	5500 4550 5500 4900
$Comp
L Device:R R8
U 1 1 5DCDF18F
P 5500 5250
F 0 "R8" H 5570 5296 50  0000 L CNN
F 1 "R" H 5570 5205 50  0000 L CNN
F 2 "" V 5430 5250 50  0001 C CNN
F 3 "~" H 5500 5250 50  0001 C CNN
	1    5500 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5DCDF900
P 5800 5500
F 0 "R9" H 5870 5546 50  0000 L CNN
F 1 "R" H 5870 5455 50  0000 L CNN
F 2 "" V 5730 5500 50  0001 C CNN
F 3 "~" H 5800 5500 50  0001 C CNN
	1    5800 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5DCE03B3
P 6050 5300
F 0 "R10" V 5843 5300 50  0000 C CNN
F 1 "R" V 5934 5300 50  0000 C CNN
F 2 "" V 5980 5300 50  0001 C CNN
F 3 "~" H 6050 5300 50  0001 C CNN
	1    6050 5300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5DD05E54
P 5800 5650
F 0 "#PWR08" H 5800 5400 50  0001 C CNN
F 1 "GND" H 5805 5477 50  0000 C CNN
F 2 "" H 5800 5650 50  0001 C CNN
F 3 "" H 5800 5650 50  0001 C CNN
	1    5800 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4900 5800 4900
Wire Wire Line
	5500 4900 5500 5100
Connection ~ 5500 4900
Wire Wire Line
	5500 5400 5500 5650
Wire Wire Line
	5500 5650 5800 5650
Connection ~ 5800 5650
Wire Wire Line
	5800 5350 5800 5300
Wire Wire Line
	5800 5300 5900 5300
Wire Wire Line
	5800 5300 5800 5100
Connection ~ 5800 5300
Wire Wire Line
	6200 5300 6400 5300
Wire Wire Line
	6400 5300 6400 5000
Text GLabel 6400 5300 3    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_PUNTUAL
Text GLabel 3350 6000 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_PUNTUAL
Wire Wire Line
	3050 5950 3300 5950
Wire Wire Line
	3300 5950 3300 6000
Wire Wire Line
	3300 6000 3350 6000
$Comp
L Transistor_BJT:BC337 Q5
U 1 1 5DD40153
P 3350 1250
F 0 "Q5" H 3541 1296 50  0000 L CNN
F 1 "BC337" H 3541 1205 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3550 1175 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 3350 1250 50  0001 L CNN
	1    3350 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5DD46258
P 3450 850
F 0 "R11" H 3520 896 50  0000 L CNN
F 1 "1K" H 3520 805 50  0000 L CNN
F 2 "" V 3380 850 50  0001 C CNN
F 3 "~" H 3450 850 50  0001 C CNN
	1    3450 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1000 3450 1050
Wire Wire Line
	4250 1050 3450 1050
Connection ~ 3450 1050
$Comp
L power:GND #PWR06
U 1 1 5DD527FE
P 3450 1450
F 0 "#PWR06" H 3450 1200 50  0001 C CNN
F 1 "GND" H 3455 1277 50  0000 C CNN
F 2 "" H 3450 1450 50  0001 C CNN
F 3 "" H 3450 1450 50  0001 C CNN
	1    3450 1450
	1    0    0    -1  
$EndComp
Text GLabel 3450 700  1    50   Input ~ 0
VCC
Text GLabel 2550 1250 0    50   Input ~ 0
PMOS_FRIO
$Comp
L Transistor_BJT:BC337 Q6
U 1 1 5DD8DA09
P 8200 1250
F 0 "Q6" H 8391 1296 50  0000 L CNN
F 1 "BC337" H 8391 1205 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8400 1175 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 8200 1250 50  0001 L CNN
	1    8200 1250
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5DD8DA0F
P 8100 850
F 0 "R12" H 8030 896 50  0000 R CNN
F 1 "1K" H 8030 805 50  0000 R CNN
F 2 "" V 8030 850 50  0001 C CNN
F 3 "~" H 8100 850 50  0001 C CNN
	1    8100 850 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8100 1000 8100 1050
Wire Wire Line
	7300 1050 8100 1050
Connection ~ 8100 1050
$Comp
L power:GND #PWR011
U 1 1 5DD8DA18
P 8100 1450
F 0 "#PWR011" H 8100 1200 50  0001 C CNN
F 1 "GND" H 8105 1277 50  0000 C CNN
F 2 "" H 8100 1450 50  0001 C CNN
F 3 "" H 8100 1450 50  0001 C CNN
	1    8100 1450
	-1   0    0    -1  
$EndComp
Text GLabel 8100 700  1    50   Input ~ 0
VCC
Text GLabel 8850 1250 2    50   Input ~ 0
PMOS_CALOR
Text GLabel 950  950  0    50   Input ~ 0
VCC
$Comp
L Device:CP C7
U 1 1 5DDEEE5E
P 1100 1100
F 0 "C7" H 1218 1146 50  0000 L CNN
F 1 "1000u" H 1218 1055 50  0000 L CNN
F 2 "" H 1138 950 50  0001 C CNN
F 3 "~" H 1100 1100 50  0001 C CNN
	1    1100 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5DDEF386
P 1500 1100
F 0 "C8" H 1615 1146 50  0000 L CNN
F 1 "1u" H 1615 1055 50  0000 L CNN
F 2 "" H 1538 950 50  0001 C CNN
F 3 "~" H 1500 1100 50  0001 C CNN
	1    1500 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  950  1100 950 
Wire Wire Line
	1100 950  1500 950 
Connection ~ 1100 950 
Wire Wire Line
	1100 1250 1300 1250
$Comp
L power:GND #PWR01
U 1 1 5DE02718
P 1300 1250
F 0 "#PWR01" H 1300 1000 50  0001 C CNN
F 1 "GND" H 1305 1077 50  0000 C CNN
F 2 "" H 1300 1250 50  0001 C CNN
F 3 "" H 1300 1250 50  0001 C CNN
	1    1300 1250
	1    0    0    -1  
$EndComp
Connection ~ 1300 1250
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 5DE0CFDA
P 2000 950
F 0 "J4" H 2080 942 50  0000 L CNN
F 1 "BORNERA_VCC" H 2080 851 50  0000 L CNN
F 2 "" H 2000 950 50  0001 C CNN
F 3 "~" H 2000 950 50  0001 C CNN
	1    2000 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 950  1800 950 
Connection ~ 1500 950 
Wire Wire Line
	1800 1050 1800 1250
Wire Wire Line
	1300 1250 1500 1250
Connection ~ 1500 1250
Wire Wire Line
	1500 1250 1800 1250
$Comp
L Device:C C9
U 1 1 5DE3A5E4
P 3650 5450
F 0 "C9" H 3765 5496 50  0000 L CNN
F 1 "100n" H 3765 5405 50  0000 L CNN
F 2 "" H 3688 5300 50  0001 C CNN
F 3 "~" H 3650 5450 50  0001 C CNN
	1    3650 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE3AC3D
P 3650 5600
F 0 "#PWR?" H 3650 5350 50  0001 C CNN
F 1 "GND" H 3655 5427 50  0000 C CNN
F 2 "" H 3650 5600 50  0001 C CNN
F 3 "" H 3650 5600 50  0001 C CNN
	1    3650 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 5300 3400 5300
Wire Wire Line
	3400 5300 3400 5550
Wire Wire Line
	3400 5550 3050 5550
$Comp
L Device:R R14
U 1 1 5DA61BA5
P 2900 1250
F 0 "R14" V 2693 1250 50  0000 C CNN
F 1 "R" V 2784 1250 50  0000 C CNN
F 2 "" V 2830 1250 50  0001 C CNN
F 3 "~" H 2900 1250 50  0001 C CNN
	1    2900 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 1250 2550 1250
Wire Wire Line
	3050 1250 3150 1250
$Comp
L Device:R R15
U 1 1 5DA8E2C9
P 8600 1250
F 0 "R15" V 8393 1250 50  0000 C CNN
F 1 "R" V 8484 1250 50  0000 C CNN
F 2 "" V 8530 1250 50  0001 C CNN
F 3 "~" H 8600 1250 50  0001 C CNN
	1    8600 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 1250 8400 1250
Wire Wire Line
	8750 1250 8850 1250
$EndSCHEMATC
