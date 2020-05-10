EESchema Schematic File Version 4
EELAYER 30 0
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
Text GLabel 1550 6100 0    50   Input ~ 0
PWM_FRIO
Text GLabel 1550 5950 0    50   Input ~ 0
PWM_CALOR
Text GLabel 1450 5550 0    50   Input ~ 0
PMOS_FRIO
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
Text GLabel 3500 5850 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_2
Wire Wire Line
	3200 5700 3500 5700
$Comp
L Device:R R3
U 1 1 5DBD5433
P 5665 2135
F 0 "R3" H 5735 2181 50  0000 L CNN
F 1 "10k" H 5735 2090 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 5595 2135 50  0001 C CNN
F 3 "~" H 5665 2135 50  0001 C CNN
	1    5665 2135
	1    0    0    -1  
$EndComp
Wire Wire Line
	5665 2285 5665 2635
Wire Wire Line
	5665 2635 5815 2635
$Comp
L power:GND #PWR010
U 1 1 5DBEDCE3
P 5815 2635
F 0 "#PWR010" H 5815 2385 50  0001 C CNN
F 1 "GND" H 5820 2462 50  0000 C CNN
F 2 "" H 5815 2635 50  0001 C CNN
F 3 "" H 5815 2635 50  0001 C CNN
	1    5815 2635
	1    0    0    -1  
$EndComp
Wire Wire Line
	6015 1235 5665 1235
Wire Wire Line
	5665 1235 5665 1680
Connection ~ 5665 1735
Wire Wire Line
	5665 1735 5665 1985
Wire Wire Line
	5665 1680 5915 1680
Text GLabel 5665 1085 1    50   Input ~ 0
REF_5
Wire Wire Line
	5665 1085 5665 1135
Wire Wire Line
	5665 1135 6015 1135
Text GLabel 3500 5700 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_1
Wire Wire Line
	3200 5800 3450 5800
Wire Wire Line
	3450 5800 3450 5850
Wire Wire Line
	3450 5850 3500 5850
Text GLabel 770  880  0    50   Input ~ 0
VCC
$Comp
L Device:CP C7
U 1 1 5DDEEE5E
P 920 1030
F 0 "C7" H 1038 1076 50  0000 L CNN
F 1 "4700u" H 1038 985 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D16.0mm_H25.0mm_P7.50mm" H 958 880 50  0001 C CNN
F 3 "~" H 920 1030 50  0001 C CNN
	1    920  1030
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5DDEF386
P 1320 1030
F 0 "C8" H 1435 1076 50  0000 L CNN
F 1 "4.7u" H 1435 985 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L29.0mm_W9.1mm_P27.50mm_MKT" H 1358 880 50  0001 C CNN
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
Connection ~ 1320 880 
Wire Wire Line
	1620 980  1620 1180
Wire Wire Line
	1120 1180 1320 1180
Connection ~ 1320 1180
$Comp
L Device:C C9
U 1 1 5DE3A5E4
P 3800 5300
F 0 "C9" H 3915 5346 50  0000 L CNN
F 1 "100n" H 3915 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3838 5150 50  0001 C CNN
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
L Device:C C10
U 1 1 5DC34274
P 5265 2085
F 0 "C10" H 5380 2131 50  0000 L CNN
F 1 "4.7n" H 5380 2040 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5303 1935 50  0001 C CNN
F 3 "~" H 5265 2085 50  0001 C CNN
	1    5265 2085
	1    0    0    -1  
$EndComp
Wire Wire Line
	5265 1935 5265 1735
Wire Wire Line
	5265 1735 5665 1735
Wire Wire Line
	5265 2235 5265 2635
Wire Wire Line
	5265 2635 5665 2635
Connection ~ 5665 2635
Text GLabel 3575 6115 2    50   Input ~ 0
PIN-READY-LED-GREEN
Text GLabel 13085 5805 3    50   Input ~ 0
PIN-WARNING-LED-RED
Text GLabel 12160 5735 3    50   Input ~ 0
PIN-CAUTION-LED-YELLOW
Text GLabel 11275 5740 3    50   Input ~ 0
PIN-READY-LED-GREEN
$Comp
L Transistor_BJT:BC548 Q7
U 1 1 5DD2F3EB
P 13410 5675
F 0 "Q7" H 13601 5721 50  0000 L CNN
F 1 "BC548" H 13601 5630 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 13610 5600 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 13410 5675 50  0001 L CNN
	1    13410 5675
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5DD3680D
P 13510 6075
F 0 "R18" V 13303 6075 50  0000 C CNN
F 1 "220" V 13394 6075 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13440 6075 50  0001 C CNN
F 3 "~" H 13510 6075 50  0001 C CNN
	1    13510 6075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5DD4C48B
P 13510 6475
F 0 "#PWR0106" H 13510 6225 50  0001 C CNN
F 1 "GND" H 13515 6302 50  0000 C CNN
F 2 "" H 13510 6475 50  0001 C CNN
F 3 "" H 13510 6475 50  0001 C CNN
	1    13510 6475
	1    0    0    -1  
$EndComp
Text GLabel 11615 4780 1    50   Input ~ 0
VCC
$Comp
L Transistor_BJT:BC548 Q8
U 1 1 5DDA6B4D
P 11600 5660
F 0 "Q8" H 11791 5706 50  0000 L CNN
F 1 "BC548" H 11791 5615 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 11800 5585 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 11600 5660 50  0001 L CNN
	1    11600 5660
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5DDA6B5A
P 11700 6310
F 0 "#PWR0107" H 11700 6060 50  0001 C CNN
F 1 "GND" H 11705 6137 50  0000 C CNN
F 2 "" H 11700 6310 50  0001 C CNN
F 3 "" H 11700 6310 50  0001 C CNN
	1    11700 6310
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC548 Q9
U 1 1 5DDBD08D
P 12465 5660
F 0 "Q9" H 12656 5706 50  0000 L CNN
F 1 "BC548" H 12656 5615 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 12665 5585 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 12465 5660 50  0001 L CNN
	1    12465 5660
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5DE483A4
P 11700 6110
F 0 "R19" H 11770 6156 50  0000 L CNN
F 1 "220" H 11770 6065 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11630 6110 50  0001 C CNN
F 3 "~" H 11700 6110 50  0001 C CNN
	1    11700 6110
	1    0    0    -1  
$EndComp
Wire Wire Line
	11700 5960 11700 5860
Wire Wire Line
	11700 6310 11700 6260
$Comp
L power:GND #PWR0108
U 1 1 5DDBD09A
P 12565 6360
F 0 "#PWR0108" H 12565 6110 50  0001 C CNN
F 1 "GND" H 12570 6187 50  0000 C CNN
F 2 "" H 12565 6360 50  0001 C CNN
F 3 "" H 12565 6360 50  0001 C CNN
	1    12565 6360
	1    0    0    -1  
$EndComp
Wire Wire Line
	12565 5910 12565 5860
Wire Wire Line
	12565 6210 12565 6360
Wire Wire Line
	13510 5925 13510 5875
Wire Wire Line
	13510 6225 13510 6475
$Comp
L Device:R R20
U 1 1 5DEE897F
P 12565 6060
F 0 "R20" H 12635 6106 50  0000 L CNN
F 1 "220" H 12635 6015 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 12495 6060 50  0001 C CNN
F 3 "~" H 12565 6060 50  0001 C CNN
	1    12565 6060
	1    0    0    -1  
$EndComp
NoConn ~ 2200 5000
NoConn ~ 2200 5100
NoConn ~ 2200 6100
NoConn ~ 2600 4600
NoConn ~ 2800 4600
NoConn ~ 2200 6300
NoConn ~ 2200 6200
NoConn ~ 3200 6000
NoConn ~ 3200 5900
NoConn ~ 3200 5100
NoConn ~ 3200 5000
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
Wire Wire Line
	770  880  920  880 
Wire Wire Line
	920  1180 1120 1180
Wire Notes Line
	520  520  520  1420
Wire Notes Line
	520  1420 2490 1420
Wire Notes Line
	2490 1420 2490 520 
Wire Notes Line
	2490 520  520  520 
Text Notes 730  4510 0    79   ~ 0
Microcontrolador
Wire Notes Line
	5110 6960 650  6960
Wire Notes Line
	650  4380 650  6960
Text Notes 11065 4530 0    50   ~ 0
LEDs indicadores
Wire Notes Line
	11035 4420 13895 4420
Wire Notes Line
	5115 515  8555 515 
Wire Notes Line
	8555 515  8555 2885
Wire Notes Line
	8555 2885 5115 2885
Wire Notes Line
	5115 2885 5115 515 
Text Notes 5905 815  0    79   ~ 0
Sensor de temperatura del peltier
Text GLabel 5915 1680 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_2
Text GLabel 6015 1135 2    50   Input ~ 0
term_2_1
Text GLabel 6015 1235 2    50   Input ~ 0
term_2_2
Text GLabel 820  1720 0    50   Input ~ 0
VCC
$Comp
L power:GND #PWR018
U 1 1 5DDE60B0
P 820 1920
F 0 "#PWR018" H 820 1670 50  0001 C CNN
F 1 "GND" H 825 1747 50  0000 C CNN
F 2 "" H 820 1920 50  0001 C CNN
F 3 "" H 820 1920 50  0001 C CNN
	1    820  1920
	0    1    1    0   
$EndComp
Text GLabel 1020 1720 2    50   Input ~ 0
fan_1
Wire Wire Line
	820  1720 1020 1720
Wire Wire Line
	820  1920 1020 1920
Text Notes 530  1600 0    50   ~ 0
Alimentación disipador\n
Wire Notes Line
	510  1500 1440 1500
Text Label 1020 1920 0    50   ~ 0
fan_2
Text Notes 10215 2120 0    50   ~ 0
Conector hacia peltier
Text GLabel 10360 3150 1    50   Input ~ 0
term_2_2C
Text GLabel 10565 3025 1    50   Input ~ 0
term_1_1C
Text GLabel 10755 3085 1    50   Input ~ 0
term_1_2C
Text GLabel 10850 2970 1    50   Input ~ 0
fan_1C
Wire Notes Line
	12180 540  12180 4050
Wire Notes Line
	12185 4060 8875 4060
Wire Notes Line
	8870 530  9285 530 
Text Notes 8910 2020 0    50   ~ 0
Placa de conexion DB9 a conector de cable plano\n
Text Notes 13250 910  0    50   ~ 0
Conector a placa del gabinete del peltier\n\n
Wire Wire Line
	2200 5500 1450 5500
Wire Wire Line
	1450 5500 1450 5550
Wire Wire Line
	1450 5750 1450 5600
Wire Wire Line
	1450 5600 2200 5600
Wire Wire Line
	2200 5900 1550 5900
Wire Wire Line
	1550 5900 1550 5950
Wire Wire Line
	1550 6100 1800 6100
Wire Wire Line
	1800 6100 1800 6000
Wire Wire Line
	1800 6000 2200 6000
Text GLabel 10440 2885 1    50   Input ~ 0
fan_2C
Text GLabel 10155 3225 1    50   Input ~ 0
term_2_1C
Text GLabel 14465 1320 2    50   Input ~ 0
term_2_1
Text GLabel 13345 1360 0    50   Input ~ 0
term_2_2
Text GLabel 14475 1470 2    50   Input ~ 0
term_1_1
Text GLabel 13475 1485 0    50   Input ~ 0
term_1_2
Wire Wire Line
	14135 1465 14285 1465
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J7
U 1 1 5E576CF9
P 13835 1565
F 0 "J7" H 13885 1982 50  0000 C CNN
F 1 "Conn_02x05_Counter_Clockwise" H 13885 1891 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_VerticalNico" H 13835 1565 50  0001 C CNN
F 3 "~" H 13835 1565 50  0001 C CNN
	1    13835 1565
	1    0    0    -1  
$EndComp
Wire Wire Line
	14135 1365 14405 1365
Wire Wire Line
	14405 1365 14405 1320
Wire Wire Line
	14405 1320 14465 1320
Wire Wire Line
	13345 1360 13635 1360
Wire Wire Line
	13635 1360 13635 1365
Wire Wire Line
	14475 1470 14285 1470
Wire Wire Line
	14285 1470 14285 1465
Wire Wire Line
	14130 1565 14135 1565
Wire Wire Line
	13635 1465 13475 1465
Wire Wire Line
	13475 1465 13475 1485
Wire Wire Line
	13635 1665 13460 1665
Wire Wire Line
	13460 1665 13460 1905
Wire Wire Line
	14135 1665 14130 1665
Wire Notes Line
	13895 4420 13895 6965
Wire Notes Line
	11035 6965 13895 6965
Wire Notes Line
	11035 4420 11035 6965
Wire Wire Line
	11275 5660 11275 5740
Wire Wire Line
	11275 5660 11400 5660
Wire Wire Line
	12160 5735 12160 5660
Wire Wire Line
	12160 5660 12265 5660
Wire Wire Line
	12565 5230 12565 5460
Wire Wire Line
	11700 5120 11700 5460
Wire Notes Line
	14005 5540 15440 5540
Wire Notes Line
	15440 5540 15440 6940
Wire Notes Line
	15440 6940 14000 6940
Wire Notes Line
	14000 6940 14000 5545
Wire Notes Line
	14000 5545 14010 5545
$Comp
L Device:LED D6
U 1 1 5E993710
P 14700 6395
F 0 "D6" H 14693 6140 50  0000 C CNN
F 1 "Yellow" H 14693 6231 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 14700 6395 50  0001 C CNN
F 3 "~" H 14700 6395 50  0001 C CNN
	1    14700 6395
	0    1    1    0   
$EndComp
$Comp
L Device:LED D8
U 1 1 5EA2CB1E
P 14210 6210
F 0 "D8" H 14203 5955 50  0000 C CNN
F 1 "RED" H 14203 6046 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 14210 6210 50  0001 C CNN
F 3 "~" H 14210 6210 50  0001 C CNN
	1    14210 6210
	0    1    1    0   
$EndComp
Wire Wire Line
	14700 6180 14700 6245
Text GLabel 4020 1580 2    50   Input ~ 0
term_1_2
Text GLabel 4020 1480 2    50   Input ~ 0
term_1_1
Text Notes 3060 760  0    50   ~ 0
Sensor de temperatura disipador
Wire Notes Line
	2580 3830 2580 540 
Wire Notes Line
	5020 3830 2580 3830
Wire Notes Line
	5020 540  5020 3830
Wire Notes Line
	2580 540  5020 540 
Wire Wire Line
	3670 2680 3835 2680
Wire Wire Line
	3670 2380 3670 2680
Wire Wire Line
	3670 1980 4020 1980
Wire Wire Line
	3670 2080 3670 1980
$Comp
L Device:C C11
U 1 1 5DCCB55D
P 3670 2230
F 0 "C11" H 3785 2276 50  0000 L CNN
F 1 "4.7n" H 3785 2185 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3708 2080 50  0001 C CNN
F 3 "~" H 3670 2230 50  0001 C CNN
	1    3670 2230
	1    0    0    -1  
$EndComp
Wire Wire Line
	4020 2430 4020 2680
Wire Wire Line
	3720 1480 4020 1480
Text GLabel 3720 1480 0    50   Input ~ 0
REF_5
Wire Notes Line
	15155 545  15155 2430
Wire Notes Line
	15155 2430 12345 2430
Wire Notes Line
	12345 2430 12345 545 
Wire Notes Line
	12345 545  15155 545 
Connection ~ 5665 1680
Wire Wire Line
	5665 1680 5665 1735
Wire Wire Line
	4020 1580 4020 1980
Wire Wire Line
	4020 1980 4450 1980
Wire Wire Line
	4450 1980 4450 2295
Connection ~ 4020 1980
Wire Wire Line
	4020 1980 4020 2130
Wire Wire Line
	13085 5805 13085 5675
Wire Wire Line
	13085 5675 13210 5675
$Comp
L power:GND #PWR0102
U 1 1 5EB3C9AA
P 3835 2735
F 0 "#PWR0102" H 3835 2485 50  0001 C CNN
F 1 "GND" H 3840 2562 50  0000 C CNN
F 2 "" H 3835 2735 50  0001 C CNN
F 3 "" H 3835 2735 50  0001 C CNN
	1    3835 2735
	1    0    0    -1  
$EndComp
Wire Wire Line
	3835 2735 3835 2680
Connection ~ 3835 2680
Wire Wire Line
	3835 2680 4020 2680
$Comp
L Regulator_Linear:LM7805_TO220 U1
U 1 1 5EB72DF2
P 6350 4855
F 0 "U1" H 6350 5097 50  0000 C CNN
F 1 "LM7805_TO220" H 6350 5006 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6350 5080 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 6350 4805 50  0001 C CNN
	1    6350 4855
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N4002 D1
U 1 1 5EB858E5
P 5645 4855
F 0 "D1" H 5645 5071 50  0000 C CNN
F 1 "1N4002" H 5645 4980 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5645 4680 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5645 4855 50  0001 C CNN
	1    5645 4855
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EB9134E
P 6345 5375
F 0 "#PWR0103" H 6345 5125 50  0001 C CNN
F 1 "GND" H 6350 5202 50  0000 C CNN
F 2 "" H 6345 5375 50  0001 C CNN
F 3 "" H 6345 5375 50  0001 C CNN
	1    6345 5375
	1    0    0    -1  
$EndComp
Wire Wire Line
	6345 5375 6345 5360
Text GLabel 6855 4855 2    50   Input ~ 0
VCC
Wire Wire Line
	6650 4855 6740 4855
$Comp
L Device:C C2
U 1 1 5EBF2723
P 5900 5155
F 0 "C2" H 6015 5201 50  0000 L CNN
F 1 "100n" H 6015 5110 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5938 5005 50  0001 C CNN
F 3 "~" H 5900 5155 50  0001 C CNN
	1    5900 5155
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5010 5900 5005
Wire Wire Line
	5795 4855 5900 4855
Connection ~ 5900 4855
Wire Wire Line
	5900 4855 6050 4855
Connection ~ 5900 5005
Wire Wire Line
	5900 5005 5900 4855
Wire Wire Line
	6740 5010 6740 5005
Connection ~ 6740 4855
Wire Wire Line
	6740 4855 6855 4855
Connection ~ 6345 5360
$Comp
L MCU_Module:Arduino_Nano_v2.x A1
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
	5495 4600 5495 4855
Text GLabel 4550 4750 3    50   Input ~ 0
REF_5
Wire Wire Line
	2900 4600 4550 4600
Wire Wire Line
	4550 4600 4550 4750
Connection ~ 4550 4600
Wire Wire Line
	4550 4600 5495 4600
$Comp
L Device:C C3
U 1 1 5EBF44A4
P 6740 5155
F 0 "C3" H 6855 5201 50  0000 L CNN
F 1 "330n" H 6855 5110 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6778 5005 50  0001 C CNN
F 3 "~" H 6740 5155 50  0001 C CNN
	1    6740 5155
	1    0    0    -1  
$EndComp
Connection ~ 6740 5005
Wire Wire Line
	6740 5005 6740 4855
Wire Wire Line
	6345 5155 6350 5155
Wire Wire Line
	6345 5155 6345 5360
Wire Wire Line
	6740 5360 6740 5305
Wire Wire Line
	6345 5360 6740 5360
Wire Notes Line
	8310 4380 8310 6965
Wire Notes Line
	8310 6965 5095 6965
Wire Notes Line
	650  4380 8310 4380
Wire Wire Line
	13505 1645 13375 1645
Wire Wire Line
	13505 1645 13505 1565
Wire Wire Line
	13505 1565 13635 1565
Text GLabel 13825 1985 3    50   Input ~ 0
fan_2
Wire Wire Line
	13825 1985 13825 1905
Wire Wire Line
	13460 1905 13825 1905
Connection ~ 13825 1905
Text GLabel 3570 6280 2    50   Input ~ 0
PIN-CAUTION-LED-YELLOW
Text GLabel 3575 6470 2    50   Input ~ 0
PIN-WARNING-LED-RED
Wire Wire Line
	3200 6100 3545 6100
Wire Wire Line
	3545 6100 3545 6115
Wire Wire Line
	3545 6115 3575 6115
Wire Wire Line
	3200 6200 3335 6200
Wire Wire Line
	3335 6200 3335 6280
Wire Wire Line
	3335 6280 3570 6280
Wire Wire Line
	3575 6470 3200 6470
Wire Wire Line
	3200 6470 3200 6300
$Comp
L Connector:Conn_01x06_Male J9
U 1 1 5E822A6F
P 12350 4645
F 0 "J9" V 12412 4889 50  0000 L CNN
F 1 "Conn_01x06_Male" V 12503 4889 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 12350 4645 50  0001 C CNN
F 3 "~" H 12350 4645 50  0001 C CNN
	1    12350 4645
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x06_Female J10
U 1 1 5E826EAF
P 14545 5565
F 0 "J10" V 14483 5177 50  0000 R CNN
F 1 "Conn_01x06_Female" V 14392 5177 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 14545 5565 50  0001 C CNN
F 3 "~" H 14545 5565 50  0001 C CNN
	1    14545 5565
	0    -1   -1   0   
$EndComp
Wire Wire Line
	13510 4920 13510 5475
Wire Wire Line
	12250 4845 12250 4940
Wire Wire Line
	12250 4940 12450 4940
Wire Wire Line
	12450 4940 12450 4845
Wire Wire Line
	12050 4845 12050 4940
Wire Wire Line
	12050 4940 12250 4940
Connection ~ 12250 4940
Wire Wire Line
	11615 4780 11615 4940
Wire Wire Line
	11615 4940 12050 4940
Connection ~ 12050 4940
Wire Wire Line
	12350 4845 12350 5230
Wire Wire Line
	12350 5230 12565 5230
Wire Wire Line
	14700 6545 14700 6560
$Comp
L Device:LED D7
U 1 1 5E9B7C79
P 15115 6385
F 0 "D7" H 15108 6130 50  0000 C CNN
F 1 "Green" H 15108 6221 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 15115 6385 50  0001 C CNN
F 3 "~" H 15115 6385 50  0001 C CNN
	1    15115 6385
	0    1    1    0   
$EndComp
Wire Wire Line
	14210 6060 14210 5765
Wire Wire Line
	14210 5765 14345 5765
Wire Wire Line
	14445 5765 14445 6360
Wire Wire Line
	14445 6360 14210 6360
Wire Wire Line
	14545 5765 14545 6180
Wire Wire Line
	14545 6180 14700 6180
Wire Wire Line
	14700 6560 14805 6560
Wire Wire Line
	14805 6560 14805 6025
Wire Wire Line
	14805 6025 14645 6025
Wire Wire Line
	14645 6025 14645 5765
Wire Wire Line
	15115 6235 15115 5970
Wire Wire Line
	15115 5970 14745 5970
Wire Wire Line
	14745 5970 14745 5765
Wire Wire Line
	14845 5765 15220 5765
Wire Wire Line
	15220 5765 15220 6535
Wire Wire Line
	15220 6535 15115 6535
Wire Notes Line
	1440 1500 1440 2290
Wire Notes Line
	510  1500 510  2290
Wire Notes Line
	510  2290 1445 2290
Wire Wire Line
	14135 1665 14220 1665
Wire Wire Line
	14220 1665 14220 1905
Wire Wire Line
	13825 1905 14220 1905
Connection ~ 14135 1665
$Comp
L Connector:Conn_01x03_Male J11
U 1 1 5EBC481E
P 9225 675
F 0 "J11" V 9287 819 50  0000 L CNN
F 1 "Conn_01x03_Male" V 9378 819 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9225 675 50  0001 C CNN
F 3 "~" H 9225 675 50  0001 C CNN
	1    9225 675 
	0    1    1    0   
$EndComp
Text GLabel 9125 1015 3    50   Input ~ 0
fan_2C
Wire Notes Line
	8870 4050 8870 530 
Text GLabel 9230 1015 3    50   Input ~ 0
fan_1C
Wire Wire Line
	9125 1015 9125 875 
Wire Wire Line
	9230 1015 9230 875 
Wire Wire Line
	9230 875  9225 875 
Wire Wire Line
	9325 875  9325 1015
Wire Wire Line
	9325 1015 9330 1015
$Comp
L Connector:Conn_01x02_Male J13
U 1 1 5EC9B6CD
P 11905 850
F 0 "J13" H 12013 1031 50  0000 C CNN
F 1 "Conn_01x02_Male" H 12013 940 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 11905 850 50  0001 C CNN
F 3 "~" H 11905 850 50  0001 C CNN
	1    11905 850 
	0    1    1    0   
$EndComp
Text GLabel 11905 1150 3    50   Input ~ 0
term_1_1C
Text GLabel 11810 1155 3    50   Input ~ 0
term_1_2C
Wire Wire Line
	11905 1050 11905 1150
Wire Wire Line
	11810 1155 11810 1050
Wire Wire Line
	11810 1050 11805 1050
Wire Notes Line
	9270 540  12180 540 
Wire Wire Line
	11375 1055 11375 1135
Text GLabel 11275 1130 3    50   Input ~ 0
term_2_2C
Text GLabel 11375 1135 3    50   Input ~ 0
term_2_1C
$Comp
L Connector:Conn_01x02_Male J12
U 1 1 5EC67904
P 11375 855
F 0 "J12" H 11483 1036 50  0000 C CNN
F 1 "Conn_01x02_Male" H 11483 945 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 11375 855 50  0001 C CNN
F 3 "~" H 11375 855 50  0001 C CNN
	1    11375 855 
	0    1    1    0   
$EndComp
Text GLabel 9330 1015 3    50   Input ~ 0
pump_sensor_C
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5E84C1E1
P 1920 880
F 0 "J3" H 2000 872 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 2000 781 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1920 880 50  0001 C CNN
F 3 "~" H 1920 880 50  0001 C CNN
	1    1920 880 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1620 980  1720 980 
Wire Wire Line
	1320 1180 1620 1180
Wire Wire Line
	1320 880  1720 880 
Text GLabel 3345 5560 2    50   Input ~ 0
fan_in_2
Wire Wire Line
	3200 5600 3265 5600
Wire Wire Line
	3265 5600 3265 5560
Wire Wire Line
	3265 5560 3345 5560
$Comp
L Device:R R8
U 1 1 5DCDF18F
P 4020 2280
F 0 "R8" H 4090 2326 50  0000 L CNN
F 1 "10k" H 4090 2235 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 3950 2280 50  0001 C CNN
F 3 "~" H 4020 2280 50  0001 C CNN
	1    4020 2280
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J4
U 1 1 5E931C53
P 1400 7770
F 0 "J4" H 1508 8151 50  0000 C CNN
F 1 "Conn_01x06_Male" H 1508 8060 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x03_P2.54mm_Vertical" H 1400 7770 50  0001 C CNN
F 3 "~" H 1400 7770 50  0001 C CNN
	1    1400 7770
	1    0    0    -1  
$EndComp
Text GLabel 2035 7560 2    50   Input ~ 0
PMOS_CALOR
Text GLabel 1450 5750 0    50   Input ~ 0
PMOS_CALOR
Text GLabel 2050 7725 2    50   Input ~ 0
PWM_CALOR
Text GLabel 2030 7900 2    50   Input ~ 0
PMOS_FRIO
Text GLabel 2015 8075 2    50   Input ~ 0
PWM_FRIO
Wire Wire Line
	2035 7560 1600 7560
Wire Wire Line
	1600 7560 1600 7570
Wire Wire Line
	2050 7725 1600 7725
Wire Wire Line
	1600 7725 1600 7770
Wire Wire Line
	2030 7900 1600 7900
Wire Wire Line
	1600 7900 1600 7970
Wire Wire Line
	2015 8075 1600 8075
Wire Wire Line
	1600 8075 1600 8070
Wire Notes Line
	675  7095 2930 7095
Wire Notes Line
	2930 7095 2930 8675
Wire Notes Line
	2930 8675 650  8675
Wire Notes Line
	650  8675 650  7100
Wire Notes Line
	650  7100 710  7100
Text Notes 770  8395 0    79   ~ 0
Conector a placa de potencia\n
Text Notes 12135 4555 0    79   ~ 0
Conector a leds\n
NoConn ~ 1600 7670
NoConn ~ 1600 7870
NoConn ~ 2200 5400
Wire Wire Line
	12550 5120 12550 4845
Wire Wire Line
	11700 5120 12550 5120
Wire Wire Line
	13510 4920 12150 4920
Wire Wire Line
	12150 4920 12150 4845
Text GLabel 4450 2295 3    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_1
Wire Wire Line
	5900 5305 5900 5360
Wire Wire Line
	5900 5360 6345 5360
$Comp
L Device:R R5
U 1 1 5EBC9F91
P 5890 7825
F 0 "R5" H 5960 7871 50  0000 L CNN
F 1 "10k" H 5960 7780 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5820 7825 50  0001 C CNN
F 3 "~" H 5890 7825 50  0001 C CNN
	1    5890 7825
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5EBCA31D
P 5485 7820
F 0 "R4" H 5555 7866 50  0000 L CNN
F 1 "10k" H 5555 7775 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5415 7820 50  0001 C CNN
F 3 "~" H 5485 7820 50  0001 C CNN
	1    5485 7820
	1    0    0    -1  
$EndComp
Wire Wire Line
	5890 7590 5890 7675
Text GLabel 5730 7580 1    50   Input ~ 0
REF_5
Wire Wire Line
	5730 7580 5730 7590
Connection ~ 5730 7590
Wire Wire Line
	5730 7590 5890 7590
Wire Wire Line
	2200 5205 2200 5200
Wire Wire Line
	2065 5390 2065 5300
Wire Wire Line
	2065 5300 2200 5300
Text GLabel 1840 5205 0    50   Input ~ 0
SENSOR_PUMP
Text GLabel 2065 5390 0    50   Input ~ 0
SENSOR_FAN
Wire Wire Line
	1840 5205 2200 5205
Wire Wire Line
	5485 7590 5485 7670
Wire Wire Line
	5485 7590 5730 7590
Wire Notes Line
	4305 7220 7760 7220
Wire Notes Line
	7760 7220 7760 9125
Wire Notes Line
	7760 9125 4295 9125
Wire Notes Line
	4295 9125 4295 7215
Text GLabel 5485 8055 3    50   Input ~ 0
SENSOR_PUMP
Text GLabel 5890 8060 3    50   Input ~ 0
SENSOR_FAN
Wire Wire Line
	5890 7975 5890 8010
Wire Wire Line
	5485 7970 5485 8015
$Comp
L Device:C C4
U 1 1 5EDAF428
P 6195 8275
F 0 "C4" H 6310 8321 50  0000 L CNN
F 1 "2.2n" H 6310 8230 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6233 8125 50  0001 C CNN
F 3 "~" H 6195 8275 50  0001 C CNN
	1    6195 8275
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5EDBC98B
P 5135 8285
F 0 "C6" H 5250 8331 50  0000 L CNN
F 1 "2.2n" H 5250 8240 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5173 8135 50  0001 C CNN
F 3 "~" H 5135 8285 50  0001 C CNN
	1    5135 8285
	1    0    0    -1  
$EndComp
Wire Wire Line
	5890 8010 6195 8010
Wire Wire Line
	6195 8010 6195 8125
Connection ~ 5890 8010
Wire Wire Line
	5890 8010 5890 8060
Wire Wire Line
	5135 8015 5485 8015
Connection ~ 5485 8015
Wire Wire Line
	5485 8015 5485 8055
$Comp
L power:GND #PWR0104
U 1 1 5EDF4583
P 6195 8530
F 0 "#PWR0104" H 6195 8280 50  0001 C CNN
F 1 "GND" H 6200 8357 50  0000 C CNN
F 2 "" H 6195 8530 50  0001 C CNN
F 3 "" H 6195 8530 50  0001 C CNN
	1    6195 8530
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5EDF5468
P 5135 8570
F 0 "#PWR0105" H 5135 8320 50  0001 C CNN
F 1 "GND" H 5140 8397 50  0000 C CNN
F 2 "" H 5135 8570 50  0001 C CNN
F 3 "" H 5135 8570 50  0001 C CNN
	1    5135 8570
	1    0    0    -1  
$EndComp
Wire Wire Line
	5135 8570 5135 8435
Wire Wire Line
	6195 8530 6195 8425
Text Notes 4365 7395 0    79   ~ 0
Sensores Water Cooling\n
$Comp
L Connector:DB9_Female_MountingHoles J2
U 1 1 5DD9E45B
P 10565 3605
F 0 "J2" V 10795 3565 50  0000 L CNN
F 1 "DB9_Female_MountingHoles" V 10905 3085 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 10565 3605 50  0001 C CNN
F 3 " ~" H 10565 3605 50  0001 C CNN
	1    10565 3605
	0    1    1    0   
$EndComp
Wire Wire Line
	10155 3225 10155 3260
Wire Wire Line
	10155 3260 10165 3260
Wire Wire Line
	10165 3260 10165 3305
Wire Wire Line
	10565 3305 10565 3025
Wire Wire Line
	10465 3305 10440 3305
Wire Wire Line
	10440 3305 10440 3215
Wire Wire Line
	10665 3215 10665 3305
Wire Wire Line
	10440 3215 10665 3215
Connection ~ 10440 3215
Wire Wire Line
	10440 3215 10440 2885
Wire Wire Line
	10265 2880 10265 3305
Wire Wire Line
	10755 3085 10755 3285
Wire Wire Line
	10755 3285 10765 3285
Wire Wire Line
	10765 3285 10765 3305
Wire Wire Line
	10360 3150 10360 3305
Wire Wire Line
	10360 3305 10365 3305
Wire Wire Line
	10865 2995 10850 2995
Wire Wire Line
	10850 2995 10850 2970
Wire Wire Line
	10865 2995 10865 3305
Text GLabel 10965 3155 1    50   Input ~ 0
fan_sensor_C
Wire Wire Line
	10965 3155 10965 3305
$Comp
L Connector:Conn_01x03_Male J14
U 1 1 5F0FD136
P 10515 715
F 0 "J14" V 10577 859 50  0000 L CNN
F 1 "Conn_01x03_Male" V 10668 859 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10515 715 50  0001 C CNN
F 3 "~" H 10515 715 50  0001 C CNN
	1    10515 715 
	0    1    1    0   
$EndComp
Text GLabel 10415 1055 3    50   Input ~ 0
fan_2C
Text GLabel 10520 1055 3    50   Input ~ 0
fan_1C
Wire Wire Line
	10415 1055 10415 915 
Wire Wire Line
	10520 1055 10520 915 
Wire Wire Line
	10520 915  10515 915 
Wire Wire Line
	10615 915  10615 1055
Wire Wire Line
	10615 1055 10620 1055
Text GLabel 10620 1055 3    50   Input ~ 0
fan_sensor_C
Wire Wire Line
	11275 1055 11275 1130
Text GLabel 5110 8020 0    50   Input ~ 0
pump_sensor
Wire Wire Line
	5135 8015 5135 8020
Wire Wire Line
	5110 8020 5135 8020
Connection ~ 5135 8020
Wire Wire Line
	5135 8020 5135 8135
Text GLabel 6195 8010 2    50   Input ~ 0
fan_sensor
Wire Wire Line
	14390 1765 14390 1830
Wire Wire Line
	14390 1830 14560 1830
Wire Wire Line
	14390 1655 14480 1655
Wire Wire Line
	14390 1565 14390 1655
Text GLabel 14480 1655 2    50   Input ~ 0
fan_sensor
Wire Wire Line
	14135 1765 14390 1765
Connection ~ 14135 1565
Wire Wire Line
	14135 1565 14390 1565
Text GLabel 10265 2880 1    50   Input ~ 0
pump_sensor_C
Text GLabel 14560 1830 2    50   Input ~ 0
fan_1
Text GLabel 13375 1645 0    50   Input ~ 0
pump_sensor
$EndSCHEMATC
