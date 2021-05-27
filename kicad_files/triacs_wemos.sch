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
L Relay_SolidState:MOC3021M U1
U 1 1 5F073785
P 3600 2300
F 0 "U1" H 3600 2625 50  0000 C CNN
F 1 "MOC3021M" H 3600 2534 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm_LongPads" H 3400 2100 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3020M.pdf" H 3600 2300 50  0001 L CNN
	1    3600 2300
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:MOC3021M U2
U 1 1 5F074A26
P 3600 3150
F 0 "U2" H 3600 3475 50  0000 C CNN
F 1 "MOC3021M" H 3600 3384 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm_LongPads" H 3400 2950 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3020M.pdf" H 3600 3150 50  0001 L CNN
	1    3600 3150
	1    0    0    -1  
$EndComp
$Comp
L Triac_Thyristor:BT136-600 Q1
U 1 1 5F0769BB
P 4650 2300
F 0 "Q1" H 4778 2346 50  0000 L CNN
F 1 "BT136-600" H 4778 2255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4850 2225 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 4650 2300 50  0001 L CNN
	1    4650 2300
	1    0    0    -1  
$EndComp
$Comp
L Triac_Thyristor:BT136-600 Q2
U 1 1 5F078AA7
P 4650 3150
F 0 "Q2" H 4778 3196 50  0000 L CNN
F 1 "BT136-600" H 4778 3105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4850 3075 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 4650 3150 50  0001 L CNN
	1    4650 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F07A9F3
P 2850 2200
F 0 "R1" V 2643 2200 50  0000 C CNN
F 1 "R" V 2734 2200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2780 2200 50  0001 C CNN
F 3 "~" H 2850 2200 50  0001 C CNN
	1    2850 2200
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5F07BEEF
P 2850 3050
F 0 "R2" V 2643 3050 50  0000 C CNN
F 1 "R" V 2734 3050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2780 3050 50  0001 C CNN
F 3 "~" H 2850 3050 50  0001 C CNN
	1    2850 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5F07C687
P 4200 3000
F 0 "R4" V 3993 3000 50  0000 C CNN
F 1 "R" V 4084 3000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4130 3000 50  0001 C CNN
F 3 "~" H 4200 3000 50  0001 C CNN
	1    4200 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5F07DDA1
P 4200 2150
F 0 "R3" V 3993 2150 50  0000 C CNN
F 1 "R" V 4084 2150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4130 2150 50  0001 C CNN
F 3 "~" H 4200 2150 50  0001 C CNN
	1    4200 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 2150 3900 2150
Wire Wire Line
	3900 2150 3900 2200
Wire Wire Line
	4350 2150 4650 2150
Wire Wire Line
	4350 3000 4650 3000
Wire Wire Line
	4050 3000 3900 3000
Wire Wire Line
	3900 3000 3900 3050
Wire Wire Line
	3900 3250 4500 3250
Wire Wire Line
	3900 2400 4500 2400
Wire Wire Line
	3000 2200 3300 2200
Wire Wire Line
	3300 3050 3000 3050
$Comp
L power:GND #PWR0101
U 1 1 5F080275
P 3150 3400
F 0 "#PWR0101" H 3150 3150 50  0001 C CNN
F 1 "GND" H 3155 3227 50  0000 C CNN
F 2 "" H 3150 3400 50  0001 C CNN
F 3 "" H 3150 3400 50  0001 C CNN
	1    3150 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2400 3150 2400
Wire Wire Line
	3150 2400 3150 3250
Wire Wire Line
	3300 3250 3150 3250
Connection ~ 3150 3250
Wire Wire Line
	3150 3250 3150 3400
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5F08164C
P 2250 2300
F 0 "J1" H 2142 2585 50  0000 C CNN
F 1 "Wemos" H 2142 2494 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2250 2300 50  0001 C CNN
F 3 "~" H 2250 2300 50  0001 C CNN
	1    2250 2300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2700 2200 2450 2200
Wire Wire Line
	2450 2300 2700 2300
Wire Wire Line
	2700 2300 2700 3050
$Comp
L power:GND #PWR0102
U 1 1 5F084F1D
P 2450 2550
F 0 "#PWR0102" H 2450 2300 50  0001 C CNN
F 1 "GND" H 2455 2377 50  0000 C CNN
F 2 "" H 2450 2550 50  0001 C CNN
F 3 "" H 2450 2550 50  0001 C CNN
	1    2450 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2400 2450 2550
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5F0767EF
P 4000 1700
F 0 "J2" H 3918 1917 50  0000 C CNN
F 1 "Alim_alterna" H 3918 1826 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4000 1700 50  0001 C CNN
F 3 "~" H 4000 1700 50  0001 C CNN
	1    4000 1700
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5F077E0B
P 5650 2250
F 0 "J3" H 5730 2242 50  0000 L CNN
F 1 "Luz 1" H 5730 2151 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 5650 2250 50  0001 C CNN
F 3 "~" H 5650 2250 50  0001 C CNN
	1    5650 2250
	1    0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 5F07AF0D
P 5600 3100
F 0 "J4" H 5680 3092 50  0000 L CNN
F 1 "Luz 2" H 5680 3001 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 5600 3100 50  0001 C CNN
F 3 "~" H 5600 3100 50  0001 C CNN
	1    5600 3100
	1    0    0    1   
$EndComp
Wire Wire Line
	4200 1700 4900 1700
Wire Wire Line
	4900 1700 4900 2450
Wire Wire Line
	4900 2450 4650 2450
Wire Wire Line
	4650 3300 4900 3300
Wire Wire Line
	4900 3300 4900 2450
Connection ~ 4900 2450
Wire Wire Line
	4200 1600 5250 1600
Wire Wire Line
	5250 1600 5250 2250
Wire Wire Line
	5400 3100 5250 3100
Wire Wire Line
	5250 3100 5250 2250
Connection ~ 4650 2150
Connection ~ 4650 3000
Wire Wire Line
	4650 2150 5450 2150
Wire Wire Line
	5450 2250 5250 2250
Connection ~ 5250 2250
Wire Wire Line
	4650 3000 5400 3000
$EndSCHEMATC
