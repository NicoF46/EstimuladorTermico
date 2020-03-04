EESchema Schematic File Version 4
LIBS:PlacaProteccion-cache
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
Text GLabel 5520 3980 2    50   Input ~ 0
VCC
$Comp
L Device:CP C2
U 1 1 5DDEEE5E
P 3030 4130
F 0 "C2" H 3148 4176 50  0000 L CNN
F 1 "1000u" H 3148 4085 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D18.0mm_H35.5mm_P7.50mm" H 3068 3980 50  0001 C CNN
F 3 "~" H 3030 4130 50  0001 C CNN
	1    3030 4130
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5DE02718
P 5520 4580
F 0 "#PWR01" H 5520 4330 50  0001 C CNN
F 1 "GND" H 5525 4407 50  0000 C CNN
F 2 "" H 5520 4580 50  0001 C CNN
F 3 "" H 5520 4580 50  0001 C CNN
	1    5520 4580
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5DBB5534
P 1010 2140
F 0 "RV1" H 940 2094 50  0000 R CNN
F 1 "R_POT" H 940 2185 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3266Y_Vertical" H 1010 2140 50  0001 C CNN
F 3 "~" H 1010 2140 50  0001 C CNN
	1    1010 2140
	1    0    0    1   
$EndComp
Wire Wire Line
	1160 2140 1760 2140
$Comp
L power:GND #PWR0102
U 1 1 5DBD017E
P 1010 2290
F 0 "#PWR0102" H 1010 2040 50  0001 C CNN
F 1 "GND" H 1015 2117 50  0000 C CNN
F 2 "" H 1010 2290 50  0001 C CNN
F 3 "" H 1010 2290 50  0001 C CNN
	1    1010 2290
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DBD19E0
P 1560 1640
F 0 "R2" H 1630 1686 50  0000 L CNN
F 1 "1.5k" H 1630 1595 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 1490 1640 50  0001 C CNN
F 3 "~" H 1560 1640 50  0001 C CNN
	1    1560 1640
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1560 1940 1760 1940
Text GLabel 1010 1470 0    50   Input ~ 0
VCC
Text Notes 1310 740  0    118  ~ 24
Proteccion de la bateria
$Comp
L pspice:DIODE D2
U 1 1 5DC0F8BF
P 2650 2040
F 0 "D2" H 2650 2305 50  0000 C CNN
F 1 "DIODE" H 2650 2214 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 2650 2040 50  0001 C CNN
F 3 "~" H 2650 2040 50  0001 C CNN
	1    2650 2040
	1    0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5DEA965C
P 1340 5100
F 0 "#FLG0101" H 1340 5175 50  0001 C CNN
F 1 "PWR_FLAG" H 1340 5273 50  0000 C CNN
F 2 "" H 1340 5100 50  0001 C CNN
F 3 "~" H 1340 5100 50  0001 C CNN
	1    1340 5100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5DEA9D5B
P 1340 5200
F 0 "#FLG0102" H 1340 5275 50  0001 C CNN
F 1 "PWR_FLAG" H 1340 5373 50  0000 C CNN
F 2 "" H 1340 5200 50  0001 C CNN
F 3 "~" H 1340 5200 50  0001 C CNN
	1    1340 5200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5E3E5CAB
P 3820 1790
F 0 "#PWR017" H 3820 1540 50  0001 C CNN
F 1 "GND" V 3825 1662 50  0000 R CNN
F 2 "" H 3820 1790 50  0001 C CNN
F 3 "" H 3820 1790 50  0001 C CNN
	1    3820 1790
	0    1    1    0   
$EndComp
NoConn ~ 4720 1540
$Comp
L power:GND #PWR0103
U 1 1 5EC7DBC2
P 1560 2590
F 0 "#PWR0103" H 1560 2340 50  0001 C CNN
F 1 "GND" H 1565 2417 50  0000 C CNN
F 2 "" H 1560 2590 50  0001 C CNN
F 3 "" H 1560 2590 50  0001 C CNN
	1    1560 2590
	-1   0    0    -1  
$EndComp
$Comp
L Reference_Voltage:TL431LP U6
U 1 1 5EC9680D
P 1560 2440
F 0 "U6" V 1606 2370 50  0000 R CNN
F 1 "TL431LP" V 1515 2370 50  0000 R CNN
F 2 "custom_footprints:TO-92_HandSolder" H 1560 2290 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 1560 2440 50  0001 C CIN
	1    1560 2440
	0    1    -1   0   
$EndComp
Wire Wire Line
	1560 2240 1710 2240
Wire Wire Line
	1710 2240 1710 2440
Wire Wire Line
	1710 2440 1660 2440
Wire Wire Line
	1560 2240 1560 2340
Wire Notes Line
	580  620  550  620 
$Comp
L Device:Fuse F1
U 1 1 5E5D589E
P 1480 3980
F 0 "F1" V 1283 3980 50  0000 C CNN
F 1 "Fuse" V 1374 3980 50  0000 C CNN
F 2 "Fuse:Fuseholder_Cylinder-5x20mm_Stelvio-Kontek_PTF78_Horizontal_Open" V 1410 3980 50  0001 C CNN
F 3 "~" H 1480 3980 50  0001 C CNN
	1    1480 3980
	0    1    1    0   
$EndComp
$Comp
L Comparator:LM2903 U1
U 3 1 5E5F23B8
P 4030 4280
F 0 "U1" H 3988 4326 50  0000 L CNN
F 1 "LM2903" H 3988 4235 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 4030 4280 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 4030 4280 50  0001 C CNN
	3    4030 4280
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5E64A634
P 1090 5200
F 0 "J1" H 1170 5192 50  0000 L CNN
F 1 "POW_IN" H 1170 5101 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1090 5200 50  0001 C CNN
F 3 "~" H 1090 5200 50  0001 C CNN
	1    1090 5200
	-1   0    0    1   
$EndComp
Text Notes 740  4870 0    50   ~ 0
Fuente switching / Batería
Text GLabel 1390 5100 2    50   Input ~ 0
POW_IN+
Text GLabel 1390 5200 2    50   Input ~ 0
POW_IN-
Wire Wire Line
	1290 5100 1340 5100
Wire Wire Line
	1290 5200 1340 5200
Text GLabel 1130 3980 0    50   Input ~ 0
POW_IN+
Text GLabel 1130 4580 0    50   Input ~ 0
POW_IN-
Wire Wire Line
	1130 3980 1330 3980
Connection ~ 1340 5100
Wire Wire Line
	1340 5100 1390 5100
Connection ~ 1340 5200
Wire Wire Line
	1340 5200 1390 5200
Text GLabel 1830 3980 2    50   Input ~ 0
RELAY_COM
Text GLabel 2730 3980 0    50   Input ~ 0
RELAY_NO
Wire Notes Line style solid
	2030 4080 2230 4080
Wire Notes Line style solid
	2430 4080 2630 4080
Wire Notes Line style solid
	2230 4050 2430 4050
Wire Wire Line
	1630 3980 1720 3980
Wire Wire Line
	2730 3980 2800 3980
Wire Wire Line
	3030 3980 3530 3980
Connection ~ 3030 3980
Wire Wire Line
	3530 3980 3930 3980
Connection ~ 3530 3980
Wire Wire Line
	3930 4580 3530 4580
Wire Wire Line
	3530 4280 3530 4580
Connection ~ 3530 4580
Wire Wire Line
	3530 4580 3030 4580
Wire Wire Line
	3030 4280 3030 4580
Connection ~ 3030 4580
Wire Wire Line
	3030 4580 1130 4580
Connection ~ 3930 3980
Wire Wire Line
	3930 4580 4480 4580
Connection ~ 3930 4580
Text Notes 750  3650 0    50   ~ 0
Circuito de potencia
Text GLabel 4720 1790 2    50   Input ~ 0
RELAY_COM
Text GLabel 4850 2040 2    50   Input ~ 0
RELAY_NO
Text GLabel 3820 1540 0    50   Input ~ 0
RELAY_COM
$Comp
L custom_symbols:Modulo_Relé K1
U 1 1 5E40A870
P 4270 1340
F 0 "K1" H 4270 325 50  0000 C CNN
F 1 "Modulo_Relé" H 4270 416 50  0000 C CNN
F 2 "custom_footprints:Modulo_Relé_Arduino" H 4270 1340 50  0001 C CNN
F 3 "" H 4270 1340 50  0001 C CNN
	1    4270 1340
	1    0    0    -1  
$EndComp
Text GLabel 1820 2990 0    50   Input ~ 0
RELAY_COM
Connection ~ 4480 4580
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5E6BE01F
P 2800 3980
F 0 "#FLG0104" H 2800 4055 50  0001 C CNN
F 1 "PWR_FLAG" H 2800 4153 50  0000 C CNN
F 2 "" H 2800 3980 50  0001 C CNN
F 3 "~" H 2800 3980 50  0001 C CNN
	1    2800 3980
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Open SW2
U 1 1 5E6BF658
P 3260 2040
F 0 "SW2" H 3260 2255 50  0000 C CNN
F 1 "OFF_SW" H 3260 2164 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 3260 2240 50  0001 C CNN
F 3 "~" H 3260 2240 50  0001 C CNN
	1    3260 2040
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5E6C00FE
P 2130 2990
F 0 "SW1" H 2130 3275 50  0000 C CNN
F 1 "ON_SW" H 2130 3184 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 2130 3190 50  0001 C CNN
F 3 "~" H 2130 3190 50  0001 C CNN
	1    2130 2990
	1    0    0    -1  
$EndComp
Wire Wire Line
	1820 2990 1930 2990
Wire Wire Line
	1560 2540 1560 2590
Connection ~ 1560 2240
Connection ~ 1560 1940
Wire Wire Line
	1560 1940 1560 2240
Wire Wire Line
	1560 1790 1560 1940
Wire Wire Line
	2450 2040 2360 2040
$Comp
L Comparator:LM2903 U1
U 2 1 5E5F4C38
P 2060 2040
F 0 "U1" H 2060 1673 50  0000 C CNN
F 1 "LM2903" H 2060 1764 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 2060 2040 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 2060 2040 50  0001 C CNN
	2    2060 2040
	1    0    0    1   
$EndComp
Wire Wire Line
	1010 1470 1560 1470
Wire Wire Line
	1010 1470 1010 1990
Wire Wire Line
	1560 1470 1560 1490
Wire Wire Line
	2330 2990 2960 2990
Text Notes 610  1300 0    50   ~ 0
la red POW_IN es el conector que va directo a la fuente de alimentacion.\nEl rele posiblemente convenga comprar un modulo de arduino, que trae el optoacoplador integrado,\nporque es posible que el opamp no pueda entregar corriente como para encender el rele\nEl interruptor seria un pulsador de encendido. Cuando se lo presiona, se enciende el rele y el \nopamp lo mantiene activado despues que se suelta el interruptor. Hasta que la tension baje 10%\n\n
Text Notes 610  1340 0    50   ~ 0
Circuito de control
Text Notes 1660 1550 0    50   ~ 0
Corte por nivel batería
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5E720436
P 3200 5100
F 0 "J2" H 3280 5092 50  0000 L CNN
F 1 "POW_OUT" H 3280 5001 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 3200 5100 50  0001 C CNN
F 3 "~" H 3200 5100 50  0001 C CNN
	1    3200 5100
	1    0    0    -1  
$EndComp
Text GLabel 2800 5100 0    50   Input ~ 0
VCC
$Comp
L power:GND #PWR0101
U 1 1 5E721E2F
P 2800 5200
F 0 "#PWR0101" H 2800 4950 50  0001 C CNN
F 1 "GND" H 2805 5027 50  0000 C CNN
F 2 "" H 2800 5200 50  0001 C CNN
F 3 "" H 2800 5200 50  0001 C CNN
	1    2800 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 5200 3000 5200
Wire Wire Line
	2800 5100 2900 5100
Text Notes 2590 4880 0    50   ~ 0
Salida Potencia
Connection ~ 2900 5100
Wire Wire Line
	2900 5100 3000 5100
Wire Wire Line
	4720 2040 4850 2040
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5E72634C
P 1720 3980
F 0 "#FLG0103" H 1720 4055 50  0001 C CNN
F 1 "PWR_FLAG" H 1720 4153 50  0000 C CNN
F 2 "" H 1720 3980 50  0001 C CNN
F 3 "~" H 1720 3980 50  0001 C CNN
	1    1720 3980
	-1   0    0    -1  
$EndComp
Connection ~ 1720 3980
Wire Wire Line
	1720 3980 1830 3980
Wire Wire Line
	3460 2040 3820 2040
Wire Wire Line
	2850 2040 2960 2040
Connection ~ 2960 2040
Wire Wire Line
	2960 2040 2960 2990
Wire Wire Line
	2960 2040 3060 2040
$Comp
L Diode:1N4007 D1
U 1 1 5E731E9F
P 4480 4130
F 0 "D1" V 4434 4209 50  0000 L CNN
F 1 "1N4007" V 4525 4209 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 4480 3955 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4480 4130 50  0001 C CNN
	1    4480 4130
	0    1    1    0   
$EndComp
Wire Wire Line
	4480 4280 4480 4580
$Comp
L Transistor_FET:IRF4905 Q1
U 1 1 5E734FD2
P 4980 4080
F 0 "Q1" V 5323 4080 50  0000 C CNN
F 1 "IRF4905" V 5232 4080 50  0000 C CNN
F 2 "custom_footprints:TO-220-3_Vertical" H 5180 4005 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 4980 4080 50  0001 L CNN
	1    4980 4080
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E73773D
P 4980 4430
F 0 "R1" H 5050 4476 50  0000 L CNN
F 1 "100k" H 5050 4385 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4910 4430 50  0001 C CNN
F 3 "~" H 4980 4430 50  0001 C CNN
	1    4980 4430
	1    0    0    -1  
$EndComp
Wire Wire Line
	3930 3980 4480 3980
Connection ~ 4480 3980
Wire Wire Line
	4480 3980 4780 3980
Wire Wire Line
	5180 3980 5520 3980
Wire Wire Line
	4980 4580 5520 4580
Connection ~ 4980 4580
Wire Notes Line
	4340 3480 4340 4840
Wire Notes Line
	4340 4840 5270 4840
Wire Notes Line
	5270 4840 5270 3470
Wire Notes Line
	5270 3470 4340 3470
Wire Wire Line
	4480 4580 4980 4580
Text Notes 4470 3580 0    50   ~ 0
Choose only ONE
$Comp
L Device:C C1
U 1 1 5DDEF386
P 3530 4130
F 0 "C1" H 3645 4176 50  0000 L CNN
F 1 "1u" H 3645 4085 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3568 3980 50  0001 C CNN
F 3 "~" H 3530 4130 50  0001 C CNN
	1    3530 4130
	1    0    0    -1  
$EndComp
Connection ~ 2800 3980
Wire Wire Line
	2800 3980 3030 3980
$EndSCHEMATC
