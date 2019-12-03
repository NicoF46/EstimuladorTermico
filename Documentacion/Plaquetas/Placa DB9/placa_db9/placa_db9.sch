EESchema Schematic File Version 4
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
$Comp
L Connector:DB9_Female_MountingHoles J2
U 1 1 5DE64D24
P 4300 3400
F 0 "J2" H 4480 3402 50  0000 L CNN
F 1 "DB9_Female_MountingHoles" H 4480 3311 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 4300 3400 50  0001 C CNN
F 3 " ~" H 4300 3400 50  0001 C CNN
	1    4300 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4000 3930 4000
Wire Wire Line
	4000 3700 3020 3700
Wire Wire Line
	3020 3700 3020 3960
Wire Wire Line
	4000 3000 3120 3000
Wire Wire Line
	3120 3000 3120 3960
Wire Wire Line
	4000 3200 3220 3200
Wire Wire Line
	3220 3200 3220 3960
Wire Wire Line
	4000 3400 3320 3400
Wire Wire Line
	3320 3400 3320 3960
Wire Wire Line
	4000 3600 3420 3600
Wire Wire Line
	3420 3600 3420 3960
Wire Wire Line
	4000 3800 3930 3800
Wire Wire Line
	3930 4000 3930 3800
Connection ~ 3930 3800
$Comp
L Connector_Generic:Conn_01x09 J1
U 1 1 5DE6694D
P 3420 4160
F 0 "J1" V 3545 4156 50  0000 C CNN
F 1 "Conn_01x09" V 3636 4156 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x09_P2.54mm_Vertical" H 3420 4160 50  0001 C CNN
F 3 "~" H 3420 4160 50  0001 C CNN
	1    3420 4160
	0    -1   1    0   
$EndComp
Wire Wire Line
	3520 3800 3520 3960
Wire Wire Line
	3520 3800 3930 3800
NoConn ~ 4000 3500
NoConn ~ 4000 3300
NoConn ~ 4000 3100
NoConn ~ 3620 3960
NoConn ~ 3720 3960
NoConn ~ 3820 3960
Text Label 3120 3000 0    50   ~ 0
term_pelt_1
Text Label 3220 3200 0    50   ~ 0
term_pelt_2
Text Label 3320 3400 0    50   ~ 0
term_disip_1
Text Label 3420 3600 0    50   ~ 0
term_disip_2
Text Label 3520 3700 0    50   ~ 0
fan_1
Text Label 3580 3800 0    50   ~ 0
fan_2
$EndSCHEMATC
