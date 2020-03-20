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
Text GLabel 5680 3980 2    50   Input ~ 0
VCC
$Comp
L Device:CP C2
U 1 1 5DDEEE5E
P 4230 4130
F 0 "C2" H 4348 4176 50  0000 L CNN
F 1 "1000u" H 4348 4085 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D18.0mm_H35.5mm_P7.50mm" H 4268 3980 50  0001 C CNN
F 3 "~" H 4230 4130 50  0001 C CNN
	1    4230 4130
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5DE02718
P 5680 4580
F 0 "#PWR01" H 5680 4330 50  0001 C CNN
F 1 "GND" H 5685 4407 50  0000 C CNN
F 2 "" H 5680 4580 50  0001 C CNN
F 3 "" H 5680 4580 50  0001 C CNN
	1    5680 4580
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
	1560 1940 1710 1940
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
P 1320 5160
F 0 "#FLG0101" H 1320 5235 50  0001 C CNN
F 1 "PWR_FLAG" H 1320 5333 50  0000 C CNN
F 2 "" H 1320 5160 50  0001 C CNN
F 3 "~" H 1320 5160 50  0001 C CNN
	1    1320 5160
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5DEA9D5B
P 1320 5260
F 0 "#FLG0102" H 1320 5335 50  0001 C CNN
F 1 "PWR_FLAG" H 1320 5433 50  0000 C CNN
F 2 "" H 1320 5260 50  0001 C CNN
F 3 "~" H 1320 5260 50  0001 C CNN
	1    1320 5260
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5E3E5CAB
P 3900 1550
F 0 "#PWR017" H 3900 1300 50  0001 C CNN
F 1 "GND" V 3905 1422 50  0000 R CNN
F 2 "" H 3900 1550 50  0001 C CNN
F 3 "" H 3900 1550 50  0001 C CNN
	1    3900 1550
	0    1    1    0   
$EndComp
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
	1710 2440 1660 2440
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
P 5230 4280
F 0 "U1" H 5188 4326 50  0000 L CNN
F 1 "LM2903" H 5188 4235 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 5230 4280 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 5230 4280 50  0001 C CNN
	3    5230 4280
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5E64A634
P 1070 5260
F 0 "J1" H 1150 5252 50  0000 L CNN
F 1 "POW_IN" H 1150 5161 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1070 5260 50  0001 C CNN
F 3 "~" H 1070 5260 50  0001 C CNN
	1    1070 5260
	-1   0    0    1   
$EndComp
Text Notes 720  4930 0    50   ~ 0
Fuente switching / Batería
Text GLabel 1370 5160 2    50   Input ~ 0
POW_IN+
Text GLabel 1370 5260 2    50   Input ~ 0
POW_IN-
Wire Wire Line
	1270 5160 1320 5160
Wire Wire Line
	1270 5260 1320 5260
Text GLabel 1130 3980 0    50   Input ~ 0
POW_IN+
Text GLabel 1130 4580 0    50   Input ~ 0
POW_IN-
Wire Wire Line
	1130 3980 1330 3980
Connection ~ 1320 5160
Wire Wire Line
	1320 5160 1370 5160
Connection ~ 1320 5260
Wire Wire Line
	1320 5260 1370 5260
Text GLabel 3030 3980 2    50   Input ~ 0
RELAY_COM
Text GLabel 3930 3980 0    50   Input ~ 0
RELAY_NO
Wire Notes Line style solid
	3230 4080 3430 4080
Wire Notes Line style solid
	3630 4080 3830 4080
Wire Notes Line style solid
	3430 4050 3630 4050
Wire Wire Line
	3930 3980 4000 3980
Wire Wire Line
	4230 3980 4730 3980
Connection ~ 4230 3980
Wire Wire Line
	4730 3980 5130 3980
Connection ~ 4730 3980
Wire Wire Line
	5130 4580 4730 4580
Wire Wire Line
	4730 4280 4730 4580
Connection ~ 4730 4580
Wire Wire Line
	4730 4580 4230 4580
Wire Wire Line
	4230 4280 4230 4580
Connection ~ 5130 3980
Connection ~ 5130 4580
Text Notes 750  3650 0    50   ~ 0
Circuito de potencia
Text GLabel 6020 1470 2    50   Input ~ 0
RELAY_COM
Text GLabel 6080 1570 2    50   Input ~ 0
RELAY_NO
Text GLabel 3900 1450 0    50   Input ~ 0
RELAY_COM
$Comp
L custom_symbols:Modulo_Relé K1
U 1 1 5E40A870
P 4950 1260
F 0 "K1" H 4950 245 50  0000 C CNN
F 1 "Modulo_Relé" H 4950 336 50  0000 C CNN
F 2 "custom_footprints:Modulo_Relé_Arduino" H 4950 1260 50  0001 C CNN
F 3 "" H 4950 1260 50  0001 C CNN
	1    4950 1260
	1    0    0    -1  
$EndComp
Text GLabel 1820 2990 0    50   Input ~ 0
RELAY_COM
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5E6BE01F
P 4000 3980
F 0 "#FLG0104" H 4000 4055 50  0001 C CNN
F 1 "PWR_FLAG" H 4000 4153 50  0000 C CNN
F 2 "" H 4000 3980 50  0001 C CNN
F 3 "~" H 4000 3980 50  0001 C CNN
	1    4000 3980
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
Connection ~ 1560 1940
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
P 3230 5160
F 0 "J2" H 3310 5152 50  0000 L CNN
F 1 "POW_OUT" H 3310 5061 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 3230 5160 50  0001 C CNN
F 3 "~" H 3230 5160 50  0001 C CNN
	1    3230 5160
	1    0    0    -1  
$EndComp
Text GLabel 2830 5160 0    50   Input ~ 0
VCC
$Comp
L power:GND #PWR0101
U 1 1 5E721E2F
P 2830 5260
F 0 "#PWR0101" H 2830 5010 50  0001 C CNN
F 1 "GND" H 2835 5087 50  0000 C CNN
F 2 "" H 2830 5260 50  0001 C CNN
F 3 "" H 2830 5260 50  0001 C CNN
	1    2830 5260
	1    0    0    -1  
$EndComp
Wire Wire Line
	2830 5260 3030 5260
Text Notes 2620 4940 0    50   ~ 0
Salida Potencia
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5E72634C
P 2860 3980
F 0 "#FLG0103" H 2860 4055 50  0001 C CNN
F 1 "PWR_FLAG" H 2860 4153 50  0000 C CNN
F 2 "" H 2860 3980 50  0001 C CNN
F 3 "~" H 2860 3980 50  0001 C CNN
	1    2860 3980
	-1   0    0    -1  
$EndComp
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
P 1890 4130
F 0 "D1" V 1844 4209 50  0000 L CNN
F 1 "1N4007" V 1935 4209 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1890 3955 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1890 4130 50  0001 C CNN
	1    1890 4130
	0    1    1    0   
$EndComp
Wire Wire Line
	1890 4280 1890 4580
$Comp
L Transistor_FET:IRF4905 Q1
U 1 1 5E734FD2
P 2390 4080
F 0 "Q1" V 2733 4080 50  0000 C CNN
F 1 "IRF4905" V 2642 4080 50  0000 C CNN
F 2 "custom_footprints:TO-220-3_Vertical" H 2590 4005 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 2390 4080 50  0001 L CNN
	1    2390 4080
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E73773D
P 2390 4430
F 0 "R1" H 2460 4476 50  0000 L CNN
F 1 "100k" H 2460 4385 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 2320 4430 50  0001 C CNN
F 3 "~" H 2390 4430 50  0001 C CNN
	1    2390 4430
	1    0    0    -1  
$EndComp
Wire Wire Line
	5130 3980 5680 3980
Wire Wire Line
	1890 3980 2190 3980
Connection ~ 2390 4580
Wire Notes Line
	1750 3480 1750 4840
Wire Notes Line
	1750 4840 2680 4840
Wire Notes Line
	2680 4840 2680 3470
Wire Notes Line
	2680 3470 1750 3470
Wire Wire Line
	1890 4580 2390 4580
Text Notes 1880 3580 0    50   ~ 0
Choose only ONE
$Comp
L Device:C C1
U 1 1 5DDEF386
P 4730 4130
F 0 "C1" H 4845 4176 50  0000 L CNN
F 1 "1u" H 4845 4085 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.0mm_P5.00mm" H 4768 3980 50  0001 C CNN
F 3 "~" H 4730 4130 50  0001 C CNN
	1    4730 4130
	1    0    0    -1  
$EndComp
Connection ~ 4000 3980
Wire Wire Line
	4000 3980 4230 3980
Wire Wire Line
	2830 5160 3030 5160
Connection ~ 1890 3980
Wire Wire Line
	1890 4580 1130 4580
Connection ~ 1890 4580
Wire Wire Line
	5130 4580 5680 4580
Wire Wire Line
	2390 4580 4230 4580
Wire Wire Line
	2590 3980 2860 3980
Connection ~ 4230 4580
Connection ~ 2860 3980
Wire Wire Line
	2860 3980 3030 3980
Wire Wire Line
	1630 3980 1890 3980
NoConn ~ 5400 1460
NoConn ~ 5400 1710
NoConn ~ 5400 1960
NoConn ~ 4500 1960
NoConn ~ 4500 1710
NoConn ~ 4500 1460
Wire Wire Line
	5930 1570 6080 1570
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 5E615EF8
P 5730 1570
F 0 "J4" H 5690 1370 50  0000 L CNN
F 1 "RELAY_SW" H 5540 1280 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 5730 1570 50  0001 C CNN
F 3 "~" H 5730 1570 50  0001 C CNN
	1    5730 1570
	-1   0    0    1   
$EndComp
Wire Wire Line
	5930 1470 6020 1470
$Comp
L Connector:Conn_01x04_Female J3
U 1 1 5E61B787
P 4190 1550
F 0 "J3" H 4140 1840 50  0000 L CNN
F 1 "RELAY_CTRL" H 3960 1760 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 4190 1550 50  0001 C CNN
F 3 "~" H 4190 1550 50  0001 C CNN
	1    4190 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3820 2040 3820 1650
Wire Wire Line
	3820 1650 3990 1650
Wire Wire Line
	3900 1550 3990 1550
Wire Wire Line
	3900 1450 3990 1450
NoConn ~ 3990 1750
Text Notes 4200 1490 0    50   ~ 0
DC+
Text Notes 4200 1580 0    50   ~ 0
DC-
Text Notes 4200 1680 0    50   ~ 0
IN
Wire Wire Line
	1560 1940 1560 2340
$Comp
L Device:R_Small R3
U 1 1 5E72E382
P 1710 2340
F 0 "R3" H 1769 2386 50  0000 L CNN
F 1 "100k" H 1769 2295 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 1710 2340 50  0001 C CNN
F 3 "~" H 1710 2340 50  0001 C CNN
	1    1710 2340
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5E72E731
P 1710 2640
F 0 "#PWR02" H 1710 2390 50  0001 C CNN
F 1 "GND" H 1715 2467 50  0000 C CNN
F 2 "" H 1710 2640 50  0001 C CNN
F 3 "" H 1710 2640 50  0001 C CNN
	1    1710 2640
	-1   0    0    -1  
$EndComp
Connection ~ 1710 2440
$Comp
L Device:R_Small R4
U 1 1 5E72DC5E
P 1710 2540
F 0 "R4" H 1769 2586 50  0000 L CNN
F 1 "100k" H 1769 2495 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 1710 2540 50  0001 C CNN
F 3 "~" H 1710 2540 50  0001 C CNN
	1    1710 2540
	1    0    0    -1  
$EndComp
Wire Wire Line
	1710 2240 1710 1940
Connection ~ 1710 1940
Wire Wire Line
	1710 1940 1760 1940
$Comp
L Comparator:LM2903 U1
U 1 1 5E742499
P 4390 2920
F 0 "U1" H 4390 2553 50  0000 C CNN
F 1 "LM2903" H 4390 2644 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 4390 2920 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 4390 2920 50  0001 C CNN
	1    4390 2920
	1    0    0    1   
$EndComp
Wire Wire Line
	4690 2920 4690 2500
Wire Wire Line
	4090 2500 4090 2820
Wire Wire Line
	4090 2500 4690 2500
$Comp
L power:GND #PWR?
U 1 1 5E743EB5
P 4000 3020
F 0 "#PWR?" H 4000 2770 50  0001 C CNN
F 1 "GND" H 4005 2847 50  0000 C CNN
F 2 "" H 4000 3020 50  0001 C CNN
F 3 "" H 4000 3020 50  0001 C CNN
	1    4000 3020
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4090 3020 4000 3020
$EndSCHEMATC
