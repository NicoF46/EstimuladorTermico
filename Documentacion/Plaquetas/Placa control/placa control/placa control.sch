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
Text GLabel 3450 2230 0    50   Input ~ 0
PWM_FRIO
Text GLabel 3450 2080 0    50   Input ~ 0
PWM_CALOR
Text GLabel 3350 1680 0    50   Input ~ 0
PMOS_FRIO
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
Text GLabel 5400 1980 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_2
Wire Wire Line
	5100 1830 5400 1830
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
Wire Wire Line
	6275 3775 6625 3775
Text GLabel 5400 1830 2    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_1
Wire Wire Line
	5100 1930 5350 1930
Wire Wire Line
	5350 1930 5350 1980
Wire Wire Line
	5350 1980 5400 1980
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
P 5700 1430
F 0 "C9" H 5815 1476 50  0000 L CNN
F 1 "100n" H 5815 1385 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5738 1280 50  0001 C CNN
F 3 "~" H 5700 1430 50  0001 C CNN
	1    5700 1430
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5DE3AC3D
P 5700 1580
F 0 "#PWR0101" H 5700 1330 50  0001 C CNN
F 1 "GND" H 5705 1407 50  0000 C CNN
F 2 "" H 5700 1580 50  0001 C CNN
F 3 "" H 5700 1580 50  0001 C CNN
	1    5700 1580
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1280 5450 1280
Wire Wire Line
	5450 1280 5450 1530
Wire Wire Line
	5450 1530 5100 1530
$Comp
L Device:C C10
U 1 1 5DC34274
P 5875 4725
F 0 "C10" H 5990 4771 50  0000 L CNN
F 1 "4.7n" H 5990 4680 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5913 4575 50  0001 C CNN
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
Text GLabel 5475 2245 2    50   Input ~ 0
PIN-READY-LED-GREEN
Text GLabel 8825 1915 3    50   Input ~ 0
PIN-WARNING-LED-RED
Text GLabel 7900 1845 3    50   Input ~ 0
PIN-CAUTION-LED-YELLOW
Text GLabel 7015 1850 3    50   Input ~ 0
PIN-READY-LED-GREEN
$Comp
L Transistor_BJT:BC548 Q7
U 1 1 5DD2F3EB
P 9150 1785
F 0 "Q7" H 9341 1831 50  0000 L CNN
F 1 "BC548" H 9341 1740 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 9350 1710 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 9150 1785 50  0001 L CNN
	1    9150 1785
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5DD3680D
P 9250 2185
F 0 "R18" V 9043 2185 50  0000 C CNN
F 1 "220" V 9134 2185 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9180 2185 50  0001 C CNN
F 3 "~" H 9250 2185 50  0001 C CNN
	1    9250 2185
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5DD4C48B
P 9250 2585
F 0 "#PWR0106" H 9250 2335 50  0001 C CNN
F 1 "GND" H 9255 2412 50  0000 C CNN
F 2 "" H 9250 2585 50  0001 C CNN
F 3 "" H 9250 2585 50  0001 C CNN
	1    9250 2585
	1    0    0    -1  
$EndComp
Text GLabel 7355 890  1    50   Input ~ 0
VCC
$Comp
L Transistor_BJT:BC548 Q8
U 1 1 5DDA6B4D
P 7340 1770
F 0 "Q8" H 7531 1816 50  0000 L CNN
F 1 "BC548" H 7531 1725 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 7540 1695 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 7340 1770 50  0001 L CNN
	1    7340 1770
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5DDA6B5A
P 7440 2420
F 0 "#PWR0107" H 7440 2170 50  0001 C CNN
F 1 "GND" H 7445 2247 50  0000 C CNN
F 2 "" H 7440 2420 50  0001 C CNN
F 3 "" H 7440 2420 50  0001 C CNN
	1    7440 2420
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC548 Q9
U 1 1 5DDBD08D
P 8205 1770
F 0 "Q9" H 8396 1816 50  0000 L CNN
F 1 "BC548" H 8396 1725 50  0000 L CNN
F 2 "custom_footprints:TO-92_HandSolder" H 8405 1695 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 8205 1770 50  0001 L CNN
	1    8205 1770
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5DE483A4
P 7440 2220
F 0 "R19" H 7510 2266 50  0000 L CNN
F 1 "220" H 7510 2175 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7370 2220 50  0001 C CNN
F 3 "~" H 7440 2220 50  0001 C CNN
	1    7440 2220
	1    0    0    -1  
$EndComp
Wire Wire Line
	7440 2070 7440 1970
Wire Wire Line
	7440 2420 7440 2370
$Comp
L power:GND #PWR0108
U 1 1 5DDBD09A
P 8305 2470
F 0 "#PWR0108" H 8305 2220 50  0001 C CNN
F 1 "GND" H 8310 2297 50  0000 C CNN
F 2 "" H 8305 2470 50  0001 C CNN
F 3 "" H 8305 2470 50  0001 C CNN
	1    8305 2470
	1    0    0    -1  
$EndComp
Wire Wire Line
	8305 2020 8305 1970
Wire Wire Line
	8305 2320 8305 2470
Wire Wire Line
	9250 2035 9250 1985
Wire Wire Line
	9250 2335 9250 2585
$Comp
L Device:R R20
U 1 1 5DEE897F
P 8305 2170
F 0 "R20" H 8375 2216 50  0000 L CNN
F 1 "220" H 8375 2125 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8235 2170 50  0001 C CNN
F 3 "~" H 8305 2170 50  0001 C CNN
	1    8305 2170
	1    0    0    -1  
$EndComp
NoConn ~ 4100 1130
NoConn ~ 4100 1230
NoConn ~ 4100 2230
NoConn ~ 4700 730 
NoConn ~ 4100 2430
NoConn ~ 4100 2330
NoConn ~ 5100 2130
NoConn ~ 5100 2030
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
Text Notes 6805 640  0    50   ~ 0
LEDs indicadores
Wire Notes Line
	6775 530  9635 530 
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
Text GLabel 6625 3775 2    50   Input ~ 0
term_2_1
Text GLabel 6625 3875 2    50   Input ~ 0
term_2_2
Text Notes 1135 4620 0    50   ~ 0
Conector a placa del gabinete del peltier\n\n
Wire Wire Line
	4100 1630 3350 1630
Wire Wire Line
	3350 1630 3350 1680
Wire Wire Line
	3350 1880 3350 1730
Wire Wire Line
	3350 1730 4100 1730
Wire Wire Line
	4100 2030 3450 2030
Wire Wire Line
	3450 2030 3450 2080
Wire Wire Line
	3450 2230 3700 2230
Wire Wire Line
	3700 2230 3700 2130
Wire Wire Line
	3700 2130 4100 2130
Text GLabel 2495 4875 2    50   Input ~ 0
term_2_1
Text GLabel 1375 4915 0    50   Input ~ 0
term_2_2
Text GLabel 2505 5025 2    50   Input ~ 0
term_1_1
Text GLabel 1505 5040 0    50   Input ~ 0
term_1_2
Wire Wire Line
	2165 5020 2315 5020
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
	2505 5025 2315 5025
Wire Wire Line
	2315 5025 2315 5020
Wire Wire Line
	1665 5020 1505 5020
Wire Wire Line
	1505 5020 1505 5040
Wire Notes Line
	9635 530  9635 3075
Wire Notes Line
	6775 3075 9635 3075
Wire Notes Line
	6775 530  6775 3075
Wire Wire Line
	7015 1770 7015 1850
Wire Wire Line
	7015 1770 7140 1770
Wire Wire Line
	7900 1845 7900 1770
Wire Wire Line
	7900 1770 8005 1770
Wire Wire Line
	8305 1340 8305 1570
Wire Wire Line
	7440 1230 7440 1570
Wire Notes Line
	9770 545  11205 545 
Wire Notes Line
	11205 545  11205 1945
Wire Notes Line
	11205 1945 9765 1945
Wire Notes Line
	9765 1945 9765 550 
Wire Notes Line
	9765 550  9775 550 
$Comp
L Device:LED D6
U 1 1 5E993710
P 10465 1400
F 0 "D6" H 10458 1145 50  0000 C CNN
F 1 "Yellow" H 10458 1236 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 10465 1400 50  0001 C CNN
F 3 "~" H 10465 1400 50  0001 C CNN
	1    10465 1400
	0    1    1    0   
$EndComp
$Comp
L Device:LED D8
U 1 1 5EA2CB1E
P 9975 1215
F 0 "D8" H 9968 960 50  0000 C CNN
F 1 "RED" H 9968 1051 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 9975 1215 50  0001 C CNN
F 3 "~" H 9975 1215 50  0001 C CNN
	1    9975 1215
	0    1    1    0   
$EndComp
Wire Wire Line
	10465 1185 10465 1250
Text GLabel 8260 3890 2    50   Input ~ 0
term_1_2
Text GLabel 8260 3790 2    50   Input ~ 0
term_1_1
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
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7948 4390 50  0001 C CNN
F 3 "~" H 7910 4540 50  0001 C CNN
	1    7910 4540
	1    0    0    -1  
$EndComp
Wire Wire Line
	8260 4740 8260 4990
Wire Wire Line
	7960 3790 8260 3790
Text GLabel 7960 3790 0    50   Input ~ 0
REF_5
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
	8825 1915 8825 1785
Wire Wire Line
	8825 1785 8950 1785
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
P 1750 3535
F 0 "U1" H 1750 3777 50  0000 C CNN
F 1 "LM7805_TO220" H 1750 3686 50  0000 C CNN
F 2 "custom_footprints:TO-220-3_Vertical" H 1750 3760 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 1750 3485 50  0001 C CNN
	1    1750 3535
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N4002 D1
U 1 1 5EB858E5
P 1045 3535
F 0 "D1" H 1045 3751 50  0000 C CNN
F 1 "1N4002" H 1045 3660 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1045 3360 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1045 3535 50  0001 C CNN
	1    1045 3535
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EB9134E
P 1745 4055
F 0 "#PWR0103" H 1745 3805 50  0001 C CNN
F 1 "GND" H 1750 3882 50  0000 C CNN
F 2 "" H 1745 4055 50  0001 C CNN
F 3 "" H 1745 4055 50  0001 C CNN
	1    1745 4055
	1    0    0    -1  
$EndComp
Wire Wire Line
	1745 4055 1745 4040
Text GLabel 2255 3535 2    50   Input ~ 0
VCC
Wire Wire Line
	2050 3535 2140 3535
$Comp
L Device:C C2
U 1 1 5EBF2723
P 1300 3835
F 0 "C2" H 1415 3881 50  0000 L CNN
F 1 "100n" H 1415 3790 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1338 3685 50  0001 C CNN
F 3 "~" H 1300 3835 50  0001 C CNN
	1    1300 3835
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3690 1300 3685
Wire Wire Line
	1195 3535 1300 3535
Connection ~ 1300 3535
Wire Wire Line
	1300 3535 1450 3535
Connection ~ 1300 3685
Wire Wire Line
	1300 3685 1300 3535
Wire Wire Line
	2140 3690 2140 3685
Connection ~ 2140 3535
Wire Wire Line
	2140 3535 2255 3535
Connection ~ 1745 4040
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
P 2140 3835
F 0 "C3" H 2255 3881 50  0000 L CNN
F 1 "330n" H 2255 3790 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2178 3685 50  0001 C CNN
F 3 "~" H 2140 3835 50  0001 C CNN
	1    2140 3835
	1    0    0    -1  
$EndComp
Connection ~ 2140 3685
Wire Wire Line
	2140 3685 2140 3535
Wire Wire Line
	1745 3835 1750 3835
Wire Wire Line
	1745 3835 1745 4040
Wire Wire Line
	2140 4040 2140 3985
Wire Wire Line
	1745 4040 2140 4040
Wire Wire Line
	1535 5200 1405 5200
Wire Wire Line
	1535 5200 1535 5120
Wire Wire Line
	1535 5120 1665 5120
Text GLabel 5470 2410 2    50   Input ~ 0
PIN-CAUTION-LED-YELLOW
Text GLabel 5475 2600 2    50   Input ~ 0
PIN-WARNING-LED-RED
Wire Wire Line
	5100 2230 5445 2230
Wire Wire Line
	5445 2230 5445 2245
Wire Wire Line
	5445 2245 5475 2245
Wire Wire Line
	5100 2330 5235 2330
Wire Wire Line
	5235 2330 5235 2410
Wire Wire Line
	5235 2410 5470 2410
Wire Wire Line
	5475 2600 5100 2600
Wire Wire Line
	5100 2600 5100 2430
$Comp
L Connector:Conn_01x06_Male J9
U 1 1 5E822A6F
P 8090 755
F 0 "J9" V 8152 999 50  0000 L CNN
F 1 "Conn_01x06_Male" V 8243 999 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 8090 755 50  0001 C CNN
F 3 "~" H 8090 755 50  0001 C CNN
	1    8090 755 
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x06_Female J10
U 1 1 5E826EAF
P 10310 570
F 0 "J10" V 10248 182 50  0000 R CNN
F 1 "Conn_01x06_Female" V 10157 182 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 10310 570 50  0001 C CNN
F 3 "~" H 10310 570 50  0001 C CNN
	1    10310 570 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9250 1030 9250 1585
Wire Wire Line
	7990 955  7990 1050
Wire Wire Line
	7990 1050 8190 1050
Wire Wire Line
	8190 1050 8190 955 
Wire Wire Line
	7790 955  7790 1050
Wire Wire Line
	7790 1050 7990 1050
Connection ~ 7990 1050
Wire Wire Line
	7355 890  7355 1050
Wire Wire Line
	7355 1050 7790 1050
Connection ~ 7790 1050
Wire Wire Line
	8090 955  8090 1340
Wire Wire Line
	8090 1340 8305 1340
Wire Wire Line
	10465 1550 10465 1565
$Comp
L Device:LED D7
U 1 1 5E9B7C79
P 10880 1390
F 0 "D7" H 10873 1135 50  0000 C CNN
F 1 "Green" H 10873 1226 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 10880 1390 50  0001 C CNN
F 3 "~" H 10880 1390 50  0001 C CNN
	1    10880 1390
	0    1    1    0   
$EndComp
Wire Wire Line
	9975 1065 9975 770 
Wire Wire Line
	9975 770  10110 770 
Wire Wire Line
	10210 770  10210 1365
Wire Wire Line
	10210 1365 9975 1365
Wire Wire Line
	10310 770  10310 1185
Wire Wire Line
	10310 1185 10465 1185
Wire Wire Line
	10465 1565 10570 1565
Wire Wire Line
	10570 1565 10570 1030
Wire Wire Line
	10570 1030 10410 1030
Wire Wire Line
	10410 1030 10410 770 
Wire Wire Line
	10880 1240 10880 975 
Wire Wire Line
	10880 975  10510 975 
Wire Wire Line
	10510 975  10510 770 
Wire Wire Line
	10610 770  10985 770 
Wire Wire Line
	10985 770  10985 1540
Wire Wire Line
	10985 1540 10880 1540
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
Text GLabel 5245 1690 2    50   Input ~ 0
fan_in_2
Wire Wire Line
	5100 1730 5165 1730
Wire Wire Line
	5165 1730 5165 1690
Wire Wire Line
	5165 1690 5245 1690
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
Text GLabel 3350 1880 0    50   Input ~ 0
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
Text Notes 7875 665  0    79   ~ 0
Conector a leds\n
NoConn ~ 1180 1880
NoConn ~ 1180 2080
NoConn ~ 4100 1530
Wire Wire Line
	8290 1230 8290 955 
Wire Wire Line
	7440 1230 8290 1230
Wire Wire Line
	9250 1030 7890 1030
Wire Wire Line
	7890 1030 7890 955 
Text GLabel 8690 4290 3    50   Input ~ 0
PIN_SENSOR_TEMPERATURA_1
Wire Wire Line
	1300 3985 1300 4040
Wire Wire Line
	1300 4040 1745 4040
$Comp
L Device:R R5
U 1 1 5EBC9F91
P 4760 3900
F 0 "R5" H 4830 3946 50  0000 L CNN
F 1 "10k" H 4830 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4690 3900 50  0001 C CNN
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
F 2 "Resistor_SMD:R_1206_3216Metric" V 4285 3895 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5103 4200 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4043 4210 50  0001 C CNN
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
Wire Wire Line
	2420 5120 2420 5210
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
	2500 6985 2500 7060
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
	1155 7235 1155 7515
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
$Comp
L Connector:Conn_01x02_Male J12
U 1 1 5EC67904
P 2600 6785
F 0 "J12" H 2708 6966 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2708 6875 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2600 6785 50  0001 C CNN
F 3 "~" H 2600 6785 50  0001 C CNN
	1    2600 6785
	0    1    1    0   
$EndComp
Text GLabel 2600 7065 3    50   Input ~ 0
term_2_1C
Text GLabel 2500 7060 3    50   Input ~ 0
term_2_2C
Wire Wire Line
	2600 6985 2600 7065
Wire Wire Line
	3035 6980 3030 6980
Wire Wire Line
	3035 7085 3035 6980
Wire Wire Line
	3130 6980 3130 7080
Text GLabel 3035 7085 3    50   Input ~ 0
term_1_2C
Text GLabel 3130 7080 3    50   Input ~ 0
term_1_1C
$Comp
L Connector:Conn_01x02_Male J13
U 1 1 5EC9B6CD
P 3130 6780
F 0 "J13" H 3238 6961 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3238 6870 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3130 6780 50  0001 C CNN
F 3 "~" H 3130 6780 50  0001 C CNN
	1    3130 6780
	0    1    1    0   
$EndComp
Text GLabel 1565 7315 3    50   Input ~ 0
term_2_1C
Text Notes 720  6430 0    50   ~ 0
Placa de conexion: chasis - placa de control\n
Text GLabel 965  7455 3    50   Input ~ 0
term_1_2C
Text GLabel 1155 7515 3    50   Input ~ 0
term_1_1C
Text GLabel 1360 7390 3    50   Input ~ 0
term_2_2C
Text Notes 720  6535 0    50   ~ 0
Conector hacia peltier
Text Notes 10355 1775 0    59   ~ 0
LEDS
Wire Notes Line
	520  3040 2490 3040
Wire Notes Line
	520  1460 2490 1460
Wire Notes Line
	2490 1455 2490 3040
Text GLabel 2195 6995 3    50   Input ~ 0
fan_sensor_C
Text GLabel 6275 3775 0    50   Input ~ 0
REF_5
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
NoConn ~ 2165 5320
NoConn ~ 1665 5320
NoConn ~ 1665 5220
NoConn ~ 2165 5220
Wire Wire Line
	2165 5120 2420 5120
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
$Comp
L power:GND #PWR02
U 1 1 5F0AC7D1
P 1845 6935
F 0 "#PWR02" H 1845 6685 50  0001 C CNN
F 1 "GND" H 1850 6762 50  0000 C CNN
F 2 "" H 1845 6935 50  0001 C CNN
F 3 "" H 1845 6935 50  0001 C CNN
	1    1845 6935
	-1   0    0    1   
$EndComp
Wire Wire Line
	1755 6935 1845 6935
NoConn ~ 1255 7235
NoConn ~ 1055 7235
NoConn ~ 855  7235
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
NoConn ~ 5165 1730
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5F1AC07D
P 850 3535
F 0 "#FLG0101" H 850 3610 50  0001 C CNN
F 1 "PWR_FLAG" H 700 3695 50  0000 C CNN
F 2 "" H 850 3535 50  0001 C CNN
F 3 "~" H 850 3535 50  0001 C CNN
	1    850  3535
	1    0    0    -1  
$EndComp
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
NoConn ~ 4100 1930
NoConn ~ 4100 1830
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
Wire Wire Line
	800  3535 850  3535
Connection ~ 850  3535
Wire Wire Line
	850  3535 895  3535
NoConn ~ 4500 730 
Wire Wire Line
	4935 610  4800 610 
Wire Wire Line
	4800 610  4800 730 
$EndSCHEMATC
