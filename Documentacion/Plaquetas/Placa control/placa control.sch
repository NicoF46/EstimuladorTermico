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
$Comp
L power:GND #PWR04
U 1 1 5DB35EB1
P 5100 2830
F 0 "#PWR04" H 5100 2580 50  0001 C CNN
F 1 "GND" H 5105 2657 50  0000 C CNN
F 2 "" H 5100 2830 50  0001 C CNN
F 3 "" H 5100 2830 50  0001 C CNN
	1    5100 2830
	1    0    0    -1  
$EndComp
Text GLabel 5400 2430 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_2
Wire Wire Line
	5100 2330 5400 2330
$Comp
L Device:R R3
U 1 1 5DBD5433
P 6275 4775
F 0 "R3" H 6345 4821 50  0000 L CNN
F 1 "10k" H 6345 4730 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 6205 4775 50  0001 C CNN
F 3 "~" H 6275 4775 50  0001 C CNN
	1    6275 4775
	1    0    0    -1  
$EndComp
Wire Wire Line
	6275 4925 6275 5275
Wire Wire Line
	6275 5275 6425 5275
$Comp
L power:GND #PWR010
U 1 1 5DBEDCE3
P 6425 5275
F 0 "#PWR010" H 6425 5025 50  0001 C CNN
F 1 "GND" H 6430 5102 50  0000 C CNN
F 2 "" H 6425 5275 50  0001 C CNN
F 3 "" H 6425 5275 50  0001 C CNN
	1    6425 5275
	1    0    0    -1  
$EndComp
Wire Wire Line
	6625 3875 6275 3875
Wire Wire Line
	6275 3875 6275 4320
Connection ~ 6275 4375
Wire Wire Line
	6275 4375 6275 4625
Wire Wire Line
	6275 4320 6525 4320
Text GLabel 5400 2330 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_1
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
P 5700 1250
F 0 "C9" H 5815 1296 50  0000 L CNN
F 1 "100n" H 5815 1205 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 5738 1100 50  0001 C CNN
F 3 "~" H 5700 1250 50  0001 C CNN
	1    5700 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5DE3AC3D
P 5700 1400
F 0 "#PWR0101" H 5700 1150 50  0001 C CNN
F 1 "GND" H 5705 1227 50  0000 C CNN
F 2 "" H 5700 1400 50  0001 C CNN
F 3 "" H 5700 1400 50  0001 C CNN
	1    5700 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1100 5450 1100
Wire Wire Line
	5450 1530 5100 1530
$Comp
L Device:C C10
U 1 1 5DC34274
P 5875 4725
F 0 "C10" H 5990 4771 50  0000 L CNN
F 1 "4.7n" H 5990 4680 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 5913 4575 50  0001 C CNN
F 3 "~" H 5875 4725 50  0001 C CNN
	1    5875 4725
	1    0    0    -1  
$EndComp
Wire Wire Line
	5875 4575 5875 4375
Wire Wire Line
	5875 4375 6275 4375
Wire Wire Line
	5875 4875 5875 5275
Wire Wire Line
	5875 5275 6275 5275
Connection ~ 6275 5275
Text GLabel 8110 1955 3    50   Input ~ 0
PIN-HOT-LED-YELLOW
Text GLabel 8995 1870 3    50   Input ~ 0
PIN-WARNING-LED-RED
Text GLabel 9830 1875 3    50   Input ~ 0
PIN-READY-LED-GREEN
$Comp
L Transistor_BJT:BC548 Q7
U 1 1 5DD2F3EB
P 8435 1825
F 0 "Q7" H 8626 1871 50  0000 L CNN
F 1 "BC548" H 8626 1780 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 8635 1750 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 8435 1825 50  0001 L CNN
	1    8435 1825
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5DD3680D
P 8535 2225
F 0 "R18" V 8328 2225 50  0000 C CNN
F 1 "220" V 8419 2225 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 8465 2225 50  0001 C CNN
F 3 "~" H 8535 2225 50  0001 C CNN
	1    8535 2225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5DD4C48B
P 8535 2625
F 0 "#PWR0106" H 8535 2375 50  0001 C CNN
F 1 "GND" H 8540 2452 50  0000 C CNN
F 2 "" H 8535 2625 50  0001 C CNN
F 3 "" H 8535 2625 50  0001 C CNN
	1    8535 2625
	1    0    0    -1  
$EndComp
Text GLabel 8450 915  1    50   Input ~ 0
VCC
$Comp
L Transistor_BJT:BC548 Q8
U 1 1 5DDA6B4D
P 10155 1795
F 0 "Q8" H 10346 1841 50  0000 L CNN
F 1 "BC548" H 10346 1750 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 10355 1720 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 10155 1795 50  0001 L CNN
	1    10155 1795
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5DDA6B5A
P 10255 2445
F 0 "#PWR0107" H 10255 2195 50  0001 C CNN
F 1 "GND" H 10260 2272 50  0000 C CNN
F 2 "" H 10255 2445 50  0001 C CNN
F 3 "" H 10255 2445 50  0001 C CNN
	1    10255 2445
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC548 Q9
U 1 1 5DDBD08D
P 9300 1795
F 0 "Q9" H 9491 1841 50  0000 L CNN
F 1 "BC548" H 9491 1750 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 9500 1720 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 9300 1795 50  0001 L CNN
	1    9300 1795
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5DE483A4
P 10255 2245
F 0 "R19" H 10325 2291 50  0000 L CNN
F 1 "220" H 10325 2200 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 10185 2245 50  0001 C CNN
F 3 "~" H 10255 2245 50  0001 C CNN
	1    10255 2245
	1    0    0    -1  
$EndComp
Wire Wire Line
	10255 2095 10255 1995
Wire Wire Line
	10255 2445 10255 2395
$Comp
L power:GND #PWR0108
U 1 1 5DDBD09A
P 9400 2495
F 0 "#PWR0108" H 9400 2245 50  0001 C CNN
F 1 "GND" H 9405 2322 50  0000 C CNN
F 2 "" H 9400 2495 50  0001 C CNN
F 3 "" H 9400 2495 50  0001 C CNN
	1    9400 2495
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 2045 9400 1995
Wire Wire Line
	9400 2345 9400 2495
Wire Wire Line
	8535 2075 8535 2025
Wire Wire Line
	8535 2375 8535 2625
$Comp
L Device:R R20
U 1 1 5DEE897F
P 9400 2195
F 0 "R20" H 9470 2241 50  0000 L CNN
F 1 "220" H 9470 2150 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 9330 2195 50  0001 C CNN
F 3 "~" H 9400 2195 50  0001 C CNN
	1    9400 2195
	1    0    0    -1  
$EndComp
NoConn ~ 4100 1130
NoConn ~ 4100 1230
NoConn ~ 4700 730 
NoConn ~ 5100 1230
NoConn ~ 5100 1130
Wire Wire Line
	4600 2770 4700 2770
Wire Wire Line
	4600 2730 4600 2770
Wire Wire Line
	4700 2730 4700 2770
Connection ~ 4700 2770
Wire Wire Line
	4700 2770 5100 2770
Wire Wire Line
	5100 2770 5100 2830
Wire Wire Line
	770  880  830  880 
Wire Wire Line
	920  1180 965  1180
Wire Notes Line
	520  520  520  1420
Wire Notes Line
	520  1420 2490 1420
Wire Notes Line
	2490 1420 2490 520 
Wire Notes Line
	2490 520  520  520 
Text Notes 2630 640  0    79   ~ 0
Microcontrolador
Wire Notes Line
	2550 510  2550 3090
Wire Notes Line
	5725 3155 9165 3155
Wire Notes Line
	9165 3155 9165 5525
Wire Notes Line
	9165 5525 5725 5525
Wire Notes Line
	5725 5525 5725 3155
Text Notes 6515 3455 0    79   ~ 0
Sensor de temperatura del peltier
Text GLabel 6525 4320 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_2
Text Notes 1135 4620 0    50   ~ 0
Conector a placa del gabinete del peltier\n\n
Text GLabel 2495 4875 2    50   Input ~ 0
REF_5
Text GLabel 1375 4915 0    50   Input ~ 0
term_2
Text GLabel 1505 5040 0    50   Input ~ 0
term_1
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J7
U 1 1 5E576CF9
P 1865 5120
F 0 "J7" H 1915 5537 50  0000 C CNN
F 1 "Conn_02x05_Counter_Clockwise" H 1915 5446 50  0000 C CNN
F 2 "custom_footprints:PinHeader_2x05_P2.54mm_VerticalNico" H 1865 5120 50  0001 C CNN
F 3 "~" H 1865 5120 50  0001 C CNN
	1    1865 5120
	1    0    0    -1  
$EndComp
Wire Wire Line
	2165 4920 2435 4920
Wire Wire Line
	2435 4920 2435 4875
Wire Wire Line
	2435 4875 2495 4875
Wire Wire Line
	1375 4915 1665 4915
Wire Wire Line
	1665 4915 1665 4920
Wire Wire Line
	1665 5020 1505 5020
Wire Wire Line
	1505 5020 1505 5040
Wire Notes Line
	6775 530  6775 3075
Wire Wire Line
	9830 1795 9830 1875
Wire Wire Line
	9830 1795 9955 1795
Wire Wire Line
	8995 1870 8995 1795
Wire Wire Line
	8995 1795 9100 1795
Wire Wire Line
	9400 1365 9400 1595
Wire Wire Line
	10255 1255 10255 1595
Wire Notes Line
	9245 4570 10680 4570
Wire Notes Line
	10680 4570 10680 5970
Wire Notes Line
	10680 5970 9240 5970
Wire Notes Line
	9240 5970 9240 4575
Wire Notes Line
	9240 4575 9250 4575
$Comp
L Device:LED D6
U 1 1 5E993710
P 9940 5425
F 0 "D6" H 9933 5170 50  0000 C CNN
F 1 "Yellow" H 9933 5261 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 9940 5425 50  0001 C CNN
F 3 "~" H 9940 5425 50  0001 C CNN
	1    9940 5425
	0    1    1    0   
$EndComp
$Comp
L Device:LED D8
U 1 1 5EA2CB1E
P 9450 5240
F 0 "D8" H 9443 4985 50  0000 C CNN
F 1 "RED" H 9443 5076 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 9450 5240 50  0001 C CNN
F 3 "~" H 9450 5240 50  0001 C CNN
	1    9450 5240
	0    1    1    0   
$EndComp
Wire Wire Line
	9940 5210 9940 5275
Wire Wire Line
	7910 4990 8075 4990
Wire Wire Line
	7910 4690 7910 4990
Wire Wire Line
	7910 4290 8260 4290
Wire Wire Line
	7910 4390 7910 4290
$Comp
L Device:C C11
U 1 1 5DCCB55D
P 7910 4540
F 0 "C11" H 8025 4586 50  0000 L CNN
F 1 "4.7n" H 8025 4495 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 7948 4390 50  0001 C CNN
F 3 "~" H 7910 4540 50  0001 C CNN
	1    7910 4540
	1    0    0    -1  
$EndComp
Wire Wire Line
	8260 4740 8260 4990
Wire Notes Line
	3335 4350 3335 6235
Wire Notes Line
	3335 6235 525  6235
Wire Notes Line
	525  6235 525  4350
Wire Notes Line
	525  4350 3335 4350
Connection ~ 6275 4320
Wire Wire Line
	6275 4320 6275 4375
Wire Wire Line
	8260 3890 8260 4290
Wire Wire Line
	8260 4290 8690 4290
Connection ~ 8260 4290
Wire Wire Line
	8260 4290 8260 4440
Wire Wire Line
	8110 1955 8110 1825
Wire Wire Line
	8110 1825 8235 1825
$Comp
L power:GND #PWR0102
U 1 1 5EB3C9AA
P 8075 5045
F 0 "#PWR0102" H 8075 4795 50  0001 C CNN
F 1 "GND" H 8080 4872 50  0000 C CNN
F 2 "" H 8075 5045 50  0001 C CNN
F 3 "" H 8075 5045 50  0001 C CNN
	1    8075 5045
	1    0    0    -1  
$EndComp
Wire Wire Line
	8075 5045 8075 4990
Connection ~ 8075 4990
Wire Wire Line
	8075 4990 8260 4990
$Comp
L Regulator_Linear:LM7805_TO220 U1
U 1 1 5EB72DF2
P 1450 3535
F 0 "U1" H 1450 3777 50  0000 C CNN
F 1 "LM7805_TO220" H 1450 3686 50  0000 C CNN
F 2 "custom_footprints:TO-220-3_Vertical" H 1450 3760 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 1450 3485 50  0001 C CNN
	1    1450 3535
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N4002 D1
U 1 1 5EB858E5
P 2105 3535
F 0 "D1" H 2105 3751 50  0000 C CNN
F 1 "1N4002" H 2105 3660 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2105 3360 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2105 3535 50  0001 C CNN
	1    2105 3535
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EB9134E
P 1445 4055
F 0 "#PWR0103" H 1445 3805 50  0001 C CNN
F 1 "GND" H 1450 3882 50  0000 C CNN
F 2 "" H 1445 4055 50  0001 C CNN
F 3 "" H 1445 4055 50  0001 C CNN
	1    1445 4055
	1    0    0    -1  
$EndComp
Wire Wire Line
	1445 4055 1445 4040
Text GLabel 2255 3535 2    50   Input ~ 0
VCC
Wire Wire Line
	1750 3535 1840 3535
$Comp
L Device:C C2
U 1 1 5EBF2723
P 1000 3835
F 0 "C2" H 1115 3881 50  0000 L CNN
F 1 "100n" H 1115 3790 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 1038 3685 50  0001 C CNN
F 3 "~" H 1000 3835 50  0001 C CNN
	1    1000 3835
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 3690 1000 3685
Connection ~ 1000 3535
Wire Wire Line
	1000 3535 1150 3535
Connection ~ 1000 3685
Wire Wire Line
	1000 3685 1000 3535
Wire Wire Line
	1840 3690 1840 3685
Connection ~ 1840 3535
Wire Wire Line
	1840 3535 1905 3535
Connection ~ 1445 4040
$Comp
L custom_symbols:Arduino_Nano_v2.x A1
U 1 1 5DB11DC8
P 4600 1730
F 0 "A1" H 4600 641 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4600 550 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4750 780 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4600 730 50  0001 C CNN
	1    4600 1730
	1    0    0    -1  
$EndComp
Text GLabel 800  3535 0    50   Input ~ 0
REF_5
$Comp
L Device:C C3
U 1 1 5EBF44A4
P 1840 3835
F 0 "C3" H 1955 3881 50  0000 L CNN
F 1 "330n" H 1955 3790 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 1878 3685 50  0001 C CNN
F 3 "~" H 1840 3835 50  0001 C CNN
	1    1840 3835
	1    0    0    -1  
$EndComp
Connection ~ 1840 3685
Wire Wire Line
	1840 3685 1840 3535
Wire Wire Line
	1445 3835 1450 3835
Wire Wire Line
	1445 3835 1445 4040
Wire Wire Line
	1840 4040 1840 3985
Wire Wire Line
	1445 4040 1840 4040
$Comp
L Connector:Conn_01x06_Female J10
U 1 1 5E826EAF
P 9785 4595
F 0 "J10" V 9723 4207 50  0000 R CNN
F 1 "Conn_01x06_Female" V 9632 4207 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 9785 4595 50  0001 C CNN
F 3 "~" H 9785 4595 50  0001 C CNN
	1    9785 4595
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9085 980  9085 1075
Wire Wire Line
	9085 1075 9285 1075
Wire Wire Line
	9285 1075 9285 980 
Wire Wire Line
	8885 980  8885 1075
Wire Wire Line
	8885 1075 9085 1075
Connection ~ 9085 1075
Wire Wire Line
	8450 915  8450 1075
Connection ~ 8885 1075
Wire Wire Line
	9185 980  9185 1365
Wire Wire Line
	9185 1365 9400 1365
Wire Wire Line
	9940 5575 9940 5590
$Comp
L Device:LED D7
U 1 1 5E9B7C79
P 10355 5415
F 0 "D7" H 10348 5160 50  0000 C CNN
F 1 "Green" H 10348 5251 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 10355 5415 50  0001 C CNN
F 3 "~" H 10355 5415 50  0001 C CNN
	1    10355 5415
	0    1    1    0   
$EndComp
Wire Wire Line
	9450 5090 9450 4795
Wire Wire Line
	9450 4795 9585 4795
Wire Wire Line
	9685 4795 9685 5390
Wire Wire Line
	9685 5390 9450 5390
Wire Wire Line
	9785 4795 9785 5210
Wire Wire Line
	9785 5210 9940 5210
Wire Wire Line
	9940 5590 10045 5590
Wire Wire Line
	10045 5590 10045 5055
Wire Wire Line
	10045 5055 9885 5055
Wire Wire Line
	9885 5055 9885 4795
Wire Wire Line
	10355 5265 10355 5000
Wire Wire Line
	10355 5000 9985 5000
Wire Wire Line
	9985 5000 9985 4795
Wire Wire Line
	10085 4795 10460 4795
Wire Wire Line
	10460 4795 10460 5565
Wire Wire Line
	10460 5565 10355 5565
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5E84C1E1
P 1920 880
F 0 "J3" H 2075 1080 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 1505 1000 50  0000 L CNN
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
$Comp
L Device:R R8
U 1 1 5DCDF18F
P 8260 4590
F 0 "R8" H 8330 4636 50  0000 L CNN
F 1 "10k" H 8330 4545 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 8190 4590 50  0001 C CNN
F 3 "~" H 8260 4590 50  0001 C CNN
	1    8260 4590
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J4
U 1 1 5E931C53
P 980 1980
F 0 "J4" H 1088 2361 50  0000 C CNN
F 1 "Conn_01x06_Male" H 1088 2270 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x03_P2.54mm_Vertical" H 980 1980 50  0001 C CNN
F 3 "~" H 980 1980 50  0001 C CNN
	1    980  1980
	1    0    0    -1  
$EndComp
Text GLabel 1615 1770 2    50   Input ~ 0
PMOS_CALOR
Text GLabel 1630 1935 2    50   Input ~ 0
PWM_CALOR
Text GLabel 1610 2110 2    50   Input ~ 0
PMOS_FRIO
Text GLabel 1595 2285 2    50   Input ~ 0
PWM_FRIO
Wire Wire Line
	1615 1770 1180 1770
Wire Wire Line
	1180 1770 1180 1780
Wire Wire Line
	1630 1935 1180 1935
Wire Wire Line
	1180 1935 1180 1980
Wire Wire Line
	1610 2110 1180 2110
Wire Wire Line
	1180 2110 1180 2180
Wire Wire Line
	1595 2285 1180 2285
Wire Wire Line
	1180 2285 1180 2280
Wire Notes Line
	520  3035 520  1460
Text Notes 580  2670 0    79   ~ 0
Conector a placa de potencia\n
Text Notes 9525 735  0    79   ~ 0
Conector a leds\n
NoConn ~ 1180 1880
NoConn ~ 1180 2080
NoConn ~ 4100 1530
Wire Wire Line
	9385 1255 9385 980 
Text GLabel 8690 4290 3    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_1
Wire Wire Line
	1000 3985 1000 4040
Wire Wire Line
	1000 4040 1445 4040
$Comp
L Device:R R5
U 1 1 5EBC9F91
P 4760 3900
F 0 "R5" H 4830 3946 50  0000 L CNN
F 1 "10k" H 4830 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 4690 3900 50  0001 C CNN
F 3 "~" H 4760 3900 50  0001 C CNN
	1    4760 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5EBCA31D
P 4355 3895
F 0 "R4" H 4425 3941 50  0000 L CNN
F 1 "10k" H 4425 3850 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 4285 3895 50  0001 C CNN
F 3 "~" H 4355 3895 50  0001 C CNN
	1    4355 3895
	1    0    0    -1  
$EndComp
Wire Wire Line
	4760 3665 4760 3750
Text GLabel 4600 3655 1    50   Input ~ 0
REF_5
Wire Wire Line
	4600 3655 4600 3665
Connection ~ 4600 3665
Wire Wire Line
	4600 3665 4760 3665
Wire Wire Line
	4100 1335 4100 1330
Wire Wire Line
	3965 1520 3965 1430
Wire Wire Line
	3965 1430 4100 1430
Text GLabel 3740 1335 0    50   Input ~ 0
SENSOR_PUMP
Text GLabel 3965 1520 0    50   Input ~ 0
SENSOR_FAN
Wire Wire Line
	3740 1335 4100 1335
Wire Wire Line
	4355 3665 4355 3745
Wire Wire Line
	4355 3665 4600 3665
Wire Notes Line
	3375 5060 3375 3150
Text GLabel 4355 4130 3    50   Input ~ 0
SENSOR_PUMP
Text GLabel 4760 4135 3    50   Input ~ 0
SENSOR_FAN
Wire Wire Line
	4760 4050 4760 4085
Wire Wire Line
	4355 4045 4355 4090
$Comp
L Device:C C4
U 1 1 5EDAF428
P 5065 4350
F 0 "C4" H 5180 4396 50  0000 L CNN
F 1 "2.2n" H 5180 4305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 5103 4200 50  0001 C CNN
F 3 "~" H 5065 4350 50  0001 C CNN
	1    5065 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5EDBC98B
P 4005 4360
F 0 "C6" H 4120 4406 50  0000 L CNN
F 1 "2.2n" H 4120 4315 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 4043 4210 50  0001 C CNN
F 3 "~" H 4005 4360 50  0001 C CNN
	1    4005 4360
	1    0    0    -1  
$EndComp
Wire Wire Line
	4760 4085 5065 4085
Wire Wire Line
	5065 4085 5065 4200
Connection ~ 4760 4085
Wire Wire Line
	4760 4085 4760 4135
Wire Wire Line
	4005 4090 4355 4090
Connection ~ 4355 4090
Wire Wire Line
	4355 4090 4355 4130
$Comp
L power:GND #PWR0104
U 1 1 5EDF4583
P 5065 4605
F 0 "#PWR0104" H 5065 4355 50  0001 C CNN
F 1 "GND" H 5070 4432 50  0000 C CNN
F 2 "" H 5065 4605 50  0001 C CNN
F 3 "" H 5065 4605 50  0001 C CNN
	1    5065 4605
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5EDF5468
P 4005 4645
F 0 "#PWR0105" H 4005 4395 50  0001 C CNN
F 1 "GND" H 4010 4472 50  0000 C CNN
F 2 "" H 4005 4645 50  0001 C CNN
F 3 "" H 4005 4645 50  0001 C CNN
	1    4005 4645
	1    0    0    -1  
$EndComp
Wire Wire Line
	4005 4645 4005 4510
Wire Wire Line
	5065 4605 5065 4500
Text Notes 3445 3330 0    79   ~ 0
Sensores Water Cooling\n
Text GLabel 3980 4095 0    50   Input ~ 0
pump_sensor
Wire Wire Line
	4005 4090 4005 4095
Wire Wire Line
	3980 4095 4005 4095
Connection ~ 4005 4095
Wire Wire Line
	4005 4095 4005 4210
Text GLabel 5065 4085 2    50   Input ~ 0
fan_sensor
Wire Wire Line
	2420 5210 2510 5210
Text GLabel 2510 5210 2    50   Input ~ 0
fan_sensor
Text GLabel 1405 5200 0    50   Input ~ 0
pump_sensor
Text Notes 940  680  0    79   ~ 0
Alimentación 12 V
Text Notes 1105 3210 0    59   ~ 0
Referencia de 5 V\n
Wire Notes Line
	515  3085 2490 3085
Wire Notes Line
	2490 3085 2490 4315
Wire Notes Line
	2490 4315 515  4315
Wire Notes Line
	515  4315 515  3085
Text GLabel 1455 7660 3    50   Input ~ 0
pump_sensor_C
Wire Wire Line
	755  7385 755  7235
Text GLabel 755  7385 3    50   Input ~ 0
fan_sensor_C
Wire Wire Line
	1360 7235 1355 7235
Wire Wire Line
	1360 7390 1360 7235
Wire Wire Line
	955  7255 955  7235
Wire Wire Line
	965  7255 955  7255
Wire Wire Line
	965  7455 965  7255
Wire Wire Line
	1455 7660 1455 7235
Wire Wire Line
	1555 7280 1555 7235
Wire Wire Line
	1565 7280 1555 7280
Wire Wire Line
	1565 7315 1565 7280
$Comp
L Connector:DB9_Female_MountingHoles J2
U 1 1 5DD9E45B
P 1155 6935
F 0 "J2" V 1385 6895 50  0000 L CNN
F 1 "DB9_Female_MountingHoles" V 1495 6415 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 1155 6935 50  0001 C CNN
F 3 " ~" H 1155 6935 50  0001 C CNN
	1    1155 6935
	0    -1   -1   0   
$EndComp
Text GLabel 2095 6995 3    50   Input ~ 0
pump_sensor_C
Text GLabel 2580 7095 3    50   Input ~ 0
term_2C
Text GLabel 2480 7095 3    50   Input ~ 0
term_1C
Text Notes 720  6430 0    50   ~ 0
Placa de conexion: chasis - placa de control\n
Text GLabel 965  7455 3    50   Input ~ 0
term_1C
Text GLabel 1360 7390 3    50   Input ~ 0
term_2C
Text Notes 720  6535 0    50   ~ 0
Conector hacia peltier
Text Notes 9830 5800 0    59   ~ 0
LEDS
Wire Notes Line
	520  3040 2490 3040
Wire Notes Line
	520  1460 2490 1460
Wire Notes Line
	2490 1455 2490 3040
Text GLabel 2195 6995 3    50   Input ~ 0
fan_sensor_C
Wire Notes Line
	3375 5060 5655 5060
Wire Notes Line
	3375 3155 5655 3155
Wire Notes Line
	5655 3155 5655 5060
Wire Notes Line
	2550 3075 6685 3075
Wire Notes Line
	2550 510  6685 510 
Wire Notes Line
	6685 510  6685 3090
Text GLabel 4935 610  2    50   Input ~ 0
REF_5
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5F040BCB
P 2195 6795
F 0 "J1" H 2303 6976 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2303 6885 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2195 6795 50  0001 C CNN
F 3 "~" H 2195 6795 50  0001 C CNN
	1    2195 6795
	0    1    1    0   
$EndComp
Wire Wire Line
	1755 6935 1845 6935
Text Notes 2005 6535 0    50   ~ 0
Conector hacia placa control
Wire Notes Line
	535  6325 3415 6325
Wire Notes Line
	3415 6325 3415 8385
Wire Notes Line
	3415 8385 530  8385
Wire Notes Line
	530  8385 530  6325
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5F1AE24F
P 830 880
F 0 "#FLG0102" H 830 955 50  0001 C CNN
F 1 "PWR_FLAG" H 830 1053 50  0000 C CNN
F 2 "" H 830 880 50  0001 C CNN
F 3 "~" H 830 880 50  0001 C CNN
	1    830  880 
	1    0    0    -1  
$EndComp
Connection ~ 830  880 
Wire Wire Line
	830  880  920  880 
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5F1C4CAA
P 965 1180
F 0 "#FLG0103" H 965 1255 50  0001 C CNN
F 1 "PWR_FLAG" H 1125 1345 50  0000 C CNN
F 2 "" H 965 1180 50  0001 C CNN
F 3 "~" H 965 1180 50  0001 C CNN
	1    965  1180
	-1   0    0    1   
$EndComp
Connection ~ 965  1180
Wire Wire Line
	965  1180 1120 1180
NoConn ~ 4500 730 
Wire Wire Line
	4935 610  4800 610 
Wire Wire Line
	4800 610  4800 730 
$Comp
L Transistor_BJT:BC548 Q1
U 1 1 5EBB84B9
P 10330 3860
F 0 "Q1" H 10521 3906 50  0000 L CNN
F 1 "BC548" H 10521 3815 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 10530 3785 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 10330 3860 50  0001 L CNN
	1    10330 3860
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5EBC5200
P 9905 3860
F 0 "R1" H 9975 3906 50  0000 L CNN
F 1 "220" H 9975 3815 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 9835 3860 50  0001 C CNN
F 3 "~" H 9905 3860 50  0001 C CNN
	1    9905 3860
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5EBD2399
P 10430 4235
F 0 "#PWR03" H 10430 3985 50  0001 C CNN
F 1 "GND" H 10435 4062 50  0000 C CNN
F 2 "" H 10430 4235 50  0001 C CNN
F 3 "" H 10430 4235 50  0001 C CNN
	1    10430 4235
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5EBD2A40
P 10630 3555
F 0 "J5" H 10265 3400 50  0000 C CNN
F 1 "Conn_01x02_Male" H 10265 3500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10630 3555 50  0001 C CNN
F 3 "~" H 10630 3555 50  0001 C CNN
	1    10630 3555
	-1   0    0    1   
$EndComp
Wire Wire Line
	10430 3660 10430 3555
Wire Wire Line
	10430 4235 10430 4210
Wire Wire Line
	10055 3860 10095 3860
Text GLabel 4015 2230 0    50   Input ~ 0
BUZZER
Wire Wire Line
	4015 2230 4100 2230
Text GLabel 9680 3860 0    50   Input ~ 0
BUZZER
Wire Wire Line
	9680 3860 9755 3860
Text Notes 9290 3305 0    50   ~ 0
BUZZER\n
Wire Wire Line
	10430 3455 10430 3295
Text GLabel 10430 3295 0    50   Input ~ 0
REF_5
Wire Notes Line
	9225 3160 11365 3160
Wire Notes Line
	11365 3160 11365 4515
Wire Notes Line
	11365 4515 9225 4515
Wire Notes Line
	9225 4515 9225 3160
Wire Wire Line
	8535 1320 8535 1625
Wire Wire Line
	9385 1255 10255 1255
$Comp
L Connector:Conn_01x08_Male J9
U 1 1 5EC71CFF
P 9085 780
F 0 "J9" V 8920 708 50  0000 C CNN
F 1 "Conn_01x08_Male" V 9011 708 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 9085 780 50  0001 C CNN
F 3 "~" H 9085 780 50  0001 C CNN
	1    9085 780 
	0    1    1    0   
$EndComp
Wire Wire Line
	8685 980  8685 1075
Wire Wire Line
	8450 1075 8685 1075
Connection ~ 8685 1075
Wire Wire Line
	8685 1075 8885 1075
Text GLabel 7180 1985 3    50   Input ~ 0
PIN-COLD-LED-BLUE
$Comp
L Transistor_BJT:BC548 Q2
U 1 1 5ECC48FF
P 7505 1855
F 0 "Q2" H 7696 1901 50  0000 L CNN
F 1 "BC548" H 7696 1810 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 7705 1780 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 7505 1855 50  0001 L CNN
	1    7505 1855
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5ECC4905
P 7605 2255
F 0 "R2" V 7398 2255 50  0000 C CNN
F 1 "220" V 7489 2255 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 7535 2255 50  0001 C CNN
F 3 "~" H 7605 2255 50  0001 C CNN
	1    7605 2255
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5ECC490B
P 7605 2655
F 0 "#PWR05" H 7605 2405 50  0001 C CNN
F 1 "GND" H 7610 2482 50  0000 C CNN
F 2 "" H 7605 2655 50  0001 C CNN
F 3 "" H 7605 2655 50  0001 C CNN
	1    7605 2655
	1    0    0    -1  
$EndComp
Wire Wire Line
	7605 2105 7605 2055
Wire Wire Line
	7605 2405 7605 2655
Wire Wire Line
	7180 1985 7180 1855
Wire Wire Line
	7180 1855 7305 1855
Wire Wire Line
	7605 1250 7605 1655
Wire Notes Line
	6775 3075 11035 3075
Wire Notes Line
	6775 530  11035 530 
Wire Notes Line
	11035 520  11035 3075
Wire Wire Line
	5450 1100 5450 1530
Text GLabel 3350 1630 0    50   Input ~ 0
PMOS_FRIO
Wire Wire Line
	4100 1630 3350 1630
Wire Wire Line
	3350 1730 4100 1730
Wire Wire Line
	3595 2230 3595 2130
Wire Wire Line
	3450 2230 3595 2230
Text GLabel 3450 2230 0    50   Input ~ 0
PWM_FRIO
Wire Wire Line
	3450 2030 3450 2080
Wire Wire Line
	4100 2030 3450 2030
Text GLabel 3450 2080 0    50   Input ~ 0
PWM_CALOR
Text GLabel 5400 2030 2    50   Input ~ 0
PIN-READY-LED-GREEN
Text GLabel 5400 1930 2    50   Input ~ 0
PIN-WARNING-LED-RED
NoConn ~ 4100 2330
Text GLabel 3350 1730 0    50   Input ~ 0
PMOS_CALOR
Text GLabel 5190 2130 2    50   Input ~ 0
SDA-DISPLAY
Text GLabel 5190 2230 2    50   Input ~ 0
SCL-DISPLAY
Wire Wire Line
	5100 2230 5190 2230
Wire Wire Line
	5100 2130 5190 2130
$Comp
L Connector:Conn_01x04_Male J6
U 1 1 5EE5F252
P 3650 5735
F 0 "J6" H 3758 6016 50  0000 C CNN
F 1 "Conn_01x04_Male" H 3758 5925 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3650 5735 50  0001 C CNN
F 3 "~" H 3650 5735 50  0001 C CNN
	1    3650 5735
	1    0    0    -1  
$EndComp
Text GLabel 4620 5735 2    50   Input ~ 0
SDA-DISPLAY
Text GLabel 4620 5835 2    50   Input ~ 0
SCL-DISPLAY
Text GLabel 4980 5235 2    50   Input ~ 0
REF_5
$Comp
L Device:R R7
U 1 1 5EE92728
P 4550 5490
F 0 "R7" H 4620 5536 50  0000 L CNN
F 1 "10k" H 4620 5445 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 4480 5490 50  0001 C CNN
F 3 "~" H 4550 5490 50  0001 C CNN
	1    4550 5490
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5EE931B7
P 4300 5490
F 0 "R6" H 4370 5536 50  0000 L CNN
F 1 "10k" H 4370 5445 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 4230 5490 50  0001 C CNN
F 3 "~" H 4300 5490 50  0001 C CNN
	1    4300 5490
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5735 4550 5640
Wire Wire Line
	4550 5735 4620 5735
Wire Wire Line
	4550 5235 4980 5235
Wire Wire Line
	4300 5835 4300 5640
Wire Wire Line
	4300 5835 4620 5835
Wire Wire Line
	4550 5340 4550 5235
Wire Wire Line
	4300 5340 4300 5235
Wire Wire Line
	4300 5235 4550 5235
Connection ~ 4550 5235
Wire Wire Line
	4300 5835 3850 5835
Connection ~ 4300 5835
Wire Wire Line
	4550 5735 3850 5735
Connection ~ 4550 5735
Wire Wire Line
	3850 5635 4100 5635
Wire Wire Line
	4100 5635 4100 5235
Wire Wire Line
	4100 5235 4300 5235
Connection ~ 4300 5235
Text Notes 4765 5495 0    50   ~ 0
Pull up resistors
$Comp
L power:GND #PWR06
U 1 1 5EEFEB7F
P 4100 5940
F 0 "#PWR06" H 4100 5690 50  0001 C CNN
F 1 "GND" H 4105 5767 50  0000 C CNN
F 2 "" H 4100 5940 50  0001 C CNN
F 3 "" H 4100 5940 50  0001 C CNN
	1    4100 5940
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 5935 4100 5935
Wire Wire Line
	4100 5935 4100 5940
Wire Notes Line
	3370 5115 5650 5115
Wire Notes Line
	5650 5115 5650 6240
Wire Notes Line
	5650 6240 3370 6240
Wire Notes Line
	3370 6240 3370 5115
Text Notes 3435 5215 0    50   ~ 0
Conector display
Text GLabel 6625 3875 2    50   Input ~ 0
term_2
Wire Notes Line style solid
	6275 3750 6275 3660
Wire Notes Line style solid
	6635 3750 6275 3750
Text Notes 6205 3635 0    50   ~ 0
5 V
Wire Notes Line style solid
	8255 3745 8255 3655
Text Notes 8185 3630 0    50   ~ 0
5 V
Text GLabel 8465 3890 2    50   Input ~ 0
term_1
Wire Wire Line
	8260 3890 8465 3890
Wire Notes Line style solid
	8470 3745 8255 3745
NoConn ~ 2165 5020
Text GLabel 2265 5320 2    50   Input ~ 0
VCC
Wire Wire Line
	2165 5220 2265 5220
Wire Wire Line
	2265 5220 2265 5320
$Comp
L power:GND #PWR0109
U 1 1 5EC8211E
P 1520 5395
F 0 "#PWR0109" H 1520 5145 50  0001 C CNN
F 1 "GND" H 1525 5222 50  0000 C CNN
F 2 "" H 1520 5395 50  0001 C CNN
F 3 "" H 1520 5395 50  0001 C CNN
	1    1520 5395
	1    0    0    -1  
$EndComp
Wire Wire Line
	1520 5320 1520 5395
Text GLabel 1565 7315 3    50   Input ~ 0
REF_5C
$Comp
L Connector:Conn_01x03_Male J11
U 1 1 5ECDB511
P 2580 6800
F 0 "J11" H 2650 7120 50  0000 L CNN
F 1 "Conn_01x03_Male" H 2350 7025 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 2580 6800 50  0001 C CNN
F 3 "~" H 2580 6800 50  0001 C CNN
	1    2580 6800
	0    1    1    0   
$EndComp
Text GLabel 2680 7090 3    50   Input ~ 0
REF_5C
Wire Wire Line
	2480 7000 2480 7095
Wire Wire Line
	2580 7000 2580 7095
Wire Wire Line
	2680 7000 2680 7090
$Comp
L Connector:Conn_01x03_Male J12
U 1 1 5ED376B9
P 2580 7590
F 0 "J12" H 2650 7910 50  0000 L CNN
F 1 "Conn_01x03_Male" H 2350 7815 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 2580 7590 50  0001 C CNN
F 3 "~" H 2580 7590 50  0001 C CNN
	1    2580 7590
	0    1    1    0   
$EndComp
Text GLabel 2580 7935 3    50   Input ~ 0
GND_C
Wire Wire Line
	2480 7790 2480 7865
Wire Wire Line
	2480 7865 2580 7865
Wire Wire Line
	2680 7865 2680 7790
Wire Wire Line
	2580 7790 2580 7865
Connection ~ 2580 7865
Wire Wire Line
	2580 7865 2680 7865
Wire Wire Line
	2580 7935 2580 7865
$Comp
L Connector:Conn_01x03_Male J13
U 1 1 5ED66AD6
P 3120 6800
F 0 "J13" H 3190 7120 50  0000 L CNN
F 1 "Conn_01x03_Male" H 2890 7025 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3120 6800 50  0001 C CNN
F 3 "~" H 3120 6800 50  0001 C CNN
	1    3120 6800
	0    1    1    0   
$EndComp
Text GLabel 3120 7145 3    50   Input ~ 0
VCC_C
Wire Wire Line
	3020 7000 3020 7075
Wire Wire Line
	3020 7075 3120 7075
Wire Wire Line
	3220 7075 3220 7000
Wire Wire Line
	3120 7000 3120 7075
Connection ~ 3120 7075
Wire Wire Line
	3120 7075 3220 7075
Wire Wire Line
	3120 7145 3120 7075
Text GLabel 1255 7295 3    50   Input ~ 0
GND_C
Text GLabel 1055 7300 3    50   Input ~ 0
GND_C
Text GLabel 1155 7305 3    50   Input ~ 0
VCC_C
Text GLabel 855  7330 3    50   Input ~ 0
VCC_C
Wire Wire Line
	855  7235 855  7330
Wire Wire Line
	1055 7235 1055 7300
Wire Wire Line
	1155 7235 1155 7305
Wire Wire Line
	1255 7235 1255 7295
Text GLabel 1845 6935 3    50   Input ~ 0
GND_C
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 5EDB904C
P 1970 5380
F 0 "J8" V 2315 5330 50  0000 C CNN
F 1 "Conn_01x02_Male" V 2395 5335 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1970 5380 50  0001 C CNN
F 3 "~" H 1970 5380 50  0001 C CNN
	1    1970 5380
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 2430 5400 2430
Wire Wire Line
	5100 1930 5400 1930
Wire Wire Line
	5100 2030 5400 2030
Wire Wire Line
	4045 1830 4100 1830
Wire Wire Line
	4045 1930 4100 1930
Text GLabel 4045 1930 0    50   Input ~ 0
PIN-COLD-LED-BLUE
Text GLabel 4045 1830 0    50   Input ~ 0
PIN-HOT-LED-YELLOW
NoConn ~ 5100 1730
NoConn ~ 5100 1830
Wire Wire Line
	3595 2130 4100 2130
NoConn ~ 4100 2430
Wire Wire Line
	1520 5320 1620 5320
NoConn ~ 1870 5580
NoConn ~ 1970 5580
Wire Wire Line
	2105 5320 2105 5640
Wire Wire Line
	2105 5640 1620 5640
Wire Wire Line
	1620 5640 1620 5320
Connection ~ 1620 5320
Wire Wire Line
	1620 5320 1665 5320
Wire Wire Line
	2105 5320 2165 5320
Wire Wire Line
	2265 5120 2265 5220
Connection ~ 2265 5220
Wire Wire Line
	1665 5200 1665 5220
Wire Wire Line
	1405 5200 1665 5200
Wire Wire Line
	2165 5120 2265 5120
Wire Wire Line
	2420 5065 1665 5065
Wire Wire Line
	1665 5065 1665 5120
Wire Wire Line
	2420 5065 2420 5210
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5EC5321D
P 1905 3535
F 0 "#FLG0104" H 1905 3610 50  0001 C CNN
F 1 "PWR_FLAG" H 1905 3708 50  0000 C CNN
F 2 "" H 1905 3535 50  0001 C CNN
F 3 "~" H 1905 3535 50  0001 C CNN
	1    1905 3535
	1    0    0    -1  
$EndComp
Connection ~ 1905 3535
Wire Wire Line
	1905 3535 1955 3535
Wire Wire Line
	800  3535 1000 3535
Wire Wire Line
	8985 1250 8985 980 
Wire Wire Line
	7605 1250 8985 1250
Wire Wire Line
	8535 1320 8785 1320
Wire Wire Line
	8785 1320 8785 980 
$Comp
L Device:C C1
U 1 1 5ECB0042
P 10095 4095
F 0 "C1" H 10210 4141 50  0000 L CNN
F 1 "2u" H 10210 4050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 10133 3945 50  0001 C CNN
F 3 "~" H 10095 4095 50  0001 C CNN
	1    10095 4095
	1    0    0    -1  
$EndComp
Wire Wire Line
	10095 4245 10285 4245
Wire Wire Line
	10285 4245 10285 4210
Wire Wire Line
	10285 4210 10430 4210
Connection ~ 10430 4210
Wire Wire Line
	10430 4210 10430 4060
Wire Wire Line
	10095 3860 10095 3945
Connection ~ 10095 3860
Wire Wire Line
	10095 3860 10130 3860
$EndSCHEMATC
