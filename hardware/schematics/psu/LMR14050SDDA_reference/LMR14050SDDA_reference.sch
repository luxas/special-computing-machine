EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Special Computing Machine Power Distribution Test Board"
Date "2020-04-22"
Rev "1"
Comp "Verneri Hirvonen"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LMR14050:LMR14050SDDA U1
U 1 1 5E828ADF
P 4850 3550
F 0 "U1" H 4850 3500 50  0000 C CNN
F 1 "LMR14050SDDA" H 4850 3400 50  0000 C CNN
F 2 "Package_SO:Texas_HSOP-8-1EP_3.9x4.9mm_P1.27mm_ThermalVias" H 4850 3600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lmr14050.pdf" H 4850 3600 50  0001 C CNN
	1    4850 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4500 4800 4500
Wire Wire Line
	4800 4500 4800 4550
Connection ~ 4800 4500
$Comp
L power:GND #PWR03
U 1 1 5E829E09
P 4800 4550
F 0 "#PWR03" H 4800 4300 50  0001 C CNN
F 1 "GND" H 4805 4377 50  0000 C CNN
F 2 "" H 4800 4550 50  0001 C CNN
F 3 "" H 4800 4550 50  0001 C CNN
	1    4800 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3450 5650 3450
Wire Wire Line
	5650 3450 5650 3550
Wire Wire Line
	5400 3850 5650 3850
Wire Wire Line
	5650 3850 5650 3750
Connection ~ 5650 3850
$Comp
L Device:C_Small C3
U 1 1 5E82A26B
P 5650 3650
F 0 "C3" H 5558 3696 50  0000 R CNN
F 1 "100n" H 5558 3605 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5650 3650 50  0001 C CNN
F 3 "~" H 5650 3650 50  0001 C CNN
	1    5650 3650
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E82E518
P 6500 4050
F 0 "R2" H 6570 4096 50  0000 L CNN
F 1 "100k" H 6570 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6430 4050 50  0001 C CNN
F 3 "~" H 6500 4050 50  0001 C CNN
	1    6500 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E82EA6A
P 6500 4450
F 0 "R3" H 6570 4496 50  0000 L CNN
F 1 "17.8k" H 6570 4405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6430 4450 50  0001 C CNN
F 3 "~" H 6500 4450 50  0001 C CNN
	1    6500 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4600 6500 4650
$Comp
L power:GND #PWR05
U 1 1 5E8308B4
P 6500 4650
F 0 "#PWR05" H 6500 4400 50  0001 C CNN
F 1 "GND" H 6505 4477 50  0000 C CNN
F 2 "" H 6500 4650 50  0001 C CNN
F 3 "" H 6500 4650 50  0001 C CNN
	1    6500 4650
	1    0    0    -1  
$EndComp
Text Label 4200 3450 2    50   ~ 0
en_signal1
$Comp
L Device:C_Small C2
U 1 1 5E831916
P 5150 2850
F 0 "C2" H 5350 2900 50  0000 R CNN
F 1 "100n" H 5350 2800 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5150 2850 50  0001 C CNN
F 3 "~" H 5150 2850 50  0001 C CNN
	1    5150 2850
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E83327B
P 5150 3000
F 0 "#PWR04" H 5150 2750 50  0001 C CNN
F 1 "GND" H 5155 2827 50  0000 C CNN
F 2 "" H 5150 3000 50  0001 C CNN
F 3 "" H 5150 3000 50  0001 C CNN
	1    5150 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5E83476A
P 4100 4250
F 0 "C1" V 4000 4150 50  0000 C CNN
F 1 "22nF" V 4000 4350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4100 4250 50  0001 C CNN
F 3 "~" H 4100 4250 50  0001 C CNN
	1    4100 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 4250 4200 4250
$Comp
L power:GND #PWR02
U 1 1 5E834FBA
P 3900 4250
F 0 "#PWR02" H 3900 4000 50  0001 C CNN
F 1 "GND" V 3905 4122 50  0000 R CNN
F 2 "" H 3900 4250 50  0001 C CNN
F 3 "" H 3900 4250 50  0001 C CNN
	1    3900 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E8356AE
P 4100 3850
F 0 "R1" V 4000 3750 50  0000 C CNN
F 1 "84.5k" V 4000 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4030 3850 50  0001 C CNN
F 3 "~" H 4100 3850 50  0001 C CNN
	1    4100 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 3850 4250 3850
Wire Wire Line
	4000 4250 3900 4250
Wire Wire Line
	3950 3850 3900 3850
$Comp
L power:GND #PWR01
U 1 1 5E839D07
P 3900 3850
F 0 "#PWR01" H 3900 3600 50  0001 C CNN
F 1 "GND" V 3905 3722 50  0000 R CNN
F 2 "" H 3900 3850 50  0001 C CNN
F 3 "" H 3900 3850 50  0001 C CNN
	1    3900 3850
	0    1    1    0   
$EndComp
Text Label 8400 3850 0    50   ~ 0
V_out1
$Comp
L Device:C_Small C4
U 1 1 5E83A9D3
P 7200 4050
F 0 "C4" H 7108 4096 50  0000 R CNN
F 1 "47uF" H 7108 4005 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 7200 4050 50  0001 C CNN
F 3 "~" H 7200 4050 50  0001 C CNN
	1    7200 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7200 3950 7200 3850
Wire Wire Line
	7200 3850 7550 3850
$Comp
L power:GND #PWR06
U 1 1 5E83B230
P 7200 4200
F 0 "#PWR06" H 7200 3950 50  0001 C CNN
F 1 "GND" H 7205 4027 50  0000 C CNN
F 2 "" H 7200 4200 50  0001 C CNN
F 3 "" H 7200 4200 50  0001 C CNN
	1    7200 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4200 7200 4150
Wire Wire Line
	5650 3850 5850 3850
Wire Wire Line
	6500 3850 6500 3900
$Comp
L Device:L L1
U 1 1 5E82BEC0
P 6150 3850
F 0 "L1" V 6340 3850 50  0000 C CNN
F 1 "8.2uH" V 6249 3850 50  0000 C CNN
F 2 "Inductor_SMD:L_Wuerth_WE-PD-Typ-LS" H 6150 3850 50  0001 C CNN
F 3 "~" H 6150 3850 50  0001 C CNN
	1    6150 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 3850 6500 3850
Wire Wire Line
	6500 3850 6850 3850
Connection ~ 6500 3850
Connection ~ 7200 3850
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5E8445F7
P 2150 8650
F 0 "#FLG0101" H 2150 8725 50  0001 C CNN
F 1 "PWR_FLAG" H 2150 8823 50  0000 C CNN
F 2 "" H 2150 8650 50  0001 C CNN
F 3 "~" H 2150 8650 50  0001 C CNN
	1    2150 8650
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5E844769
P 6150 2600
F 0 "#FLG0102" H 6150 2675 50  0001 C CNN
F 1 "PWR_FLAG" H 6000 2750 50  0000 L CNN
F 2 "" H 6150 2600 50  0001 C CNN
F 3 "~" H 6150 2600 50  0001 C CNN
	1    6150 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E844B7C
P 2150 8700
F 0 "#PWR0101" H 2150 8450 50  0001 C CNN
F 1 "GND" H 2155 8527 50  0000 C CNN
F 2 "" H 2150 8700 50  0001 C CNN
F 3 "" H 2150 8700 50  0001 C CNN
	1    2150 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 8650 2150 8700
Wire Wire Line
	5850 3950 5850 3850
Connection ~ 5850 3850
Wire Wire Line
	5850 3850 6000 3850
$Comp
L power:GND #PWR07
U 1 1 5E85523D
P 5850 4400
F 0 "#PWR07" H 5850 4150 50  0001 C CNN
F 1 "GND" H 5855 4227 50  0000 C CNN
F 2 "" H 5850 4400 50  0001 C CNN
F 3 "" H 5850 4400 50  0001 C CNN
	1    5850 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4200 6500 4250
Text Label 6450 4250 2    50   ~ 0
V_FB1
Wire Wire Line
	6500 4250 6450 4250
Connection ~ 6500 4250
Wire Wire Line
	6500 4250 6500 4300
Text Label 5450 4250 0    50   ~ 0
V_FB1
Wire Wire Line
	5450 4250 5400 4250
Text Notes 2450 3100 0    50   ~ 0
External control for starting the regulator\n(and driven load)\n
$Comp
L Connector:USB_C_Receptacle_USB2.0 J1
U 1 1 5E9DA227
P 10100 3800
F 0 "J1" H 10207 4667 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 10207 4576 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 10250 3800 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 10250 3800 50  0001 C CNN
	1    10100 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4700 9800 4750
Wire Wire Line
	9800 4750 10100 4750
Wire Wire Line
	10100 4750 10100 4700
Connection ~ 9800 4750
Wire Wire Line
	9800 4750 9800 4800
$Comp
L power:GND #PWR08
U 1 1 5E9DC209
P 9800 4800
F 0 "#PWR08" H 9800 4550 50  0001 C CNN
F 1 "GND" H 9805 4627 50  0000 C CNN
F 2 "" H 9800 4800 50  0001 C CNN
F 3 "" H 9800 4800 50  0001 C CNN
	1    9800 4800
	1    0    0    -1  
$EndComp
Text Label 10750 3200 0    50   ~ 0
V_out1
Wire Wire Line
	10750 3200 10700 3200
NoConn ~ 10700 3700
NoConn ~ 10700 3800
NoConn ~ 10700 3900
NoConn ~ 10700 4000
NoConn ~ 10700 4300
NoConn ~ 10700 4400
NoConn ~ 10700 3500
NoConn ~ 10700 3400
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E9E1BE9
P 6850 3850
F 0 "#FLG01" H 6850 3925 50  0001 C CNN
F 1 "PWR_FLAG" H 6850 4023 50  0000 C CNN
F 2 "" H 6850 3850 50  0001 C CNN
F 3 "~" H 6850 3850 50  0001 C CNN
	1    6850 3850
	1    0    0    -1  
$EndComp
Connection ~ 6850 3850
Wire Wire Line
	6850 3850 7200 3850
Wire Wire Line
	5850 4400 5850 4350
Wire Wire Line
	5950 4300 5950 4350
Wire Wire Line
	5950 4350 5850 4350
Connection ~ 5850 4350
Wire Wire Line
	5850 4350 5850 4300
$Comp
L Device:D_Schottky_AAK D1
U 1 1 5EA1C0C8
P 5850 4100
F 0 "D1" V 5829 4244 50  0000 L CNN
F 1 "D" V 5920 4244 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-277A" H 5850 4100 50  0001 C CNN
F 3 "~" H 5850 4100 50  0001 C CNN
	1    5850 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 2700 5150 2700
Wire Wire Line
	5150 2750 5150 2700
Wire Wire Line
	5150 2700 5500 2700
Connection ~ 5150 2700
Wire Wire Line
	6150 2600 6150 2700
Connection ~ 6150 2700
Wire Wire Line
	6150 2700 6300 2700
Wire Wire Line
	5150 3000 5150 2950
$Comp
L Device:C_Small C5
U 1 1 5EA4C449
P 5500 2850
F 0 "C5" H 5400 2900 50  0000 R CNN
F 1 "4.7uF" H 5400 2800 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5500 2850 50  0001 C CNN
F 3 "~" H 5500 2850 50  0001 C CNN
	1    5500 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5500 2750 5500 2700
Connection ~ 5500 2700
Wire Wire Line
	5500 2700 5900 2700
Wire Wire Line
	5500 2950 5500 3000
$Comp
L power:GND #PWR09
U 1 1 5EA4E0FB
P 5500 3000
F 0 "#PWR09" H 5500 2750 50  0001 C CNN
F 1 "GND" H 5505 2827 50  0000 C CNN
F 2 "" H 5500 3000 50  0001 C CNN
F 3 "" H 5500 3000 50  0001 C CNN
	1    5500 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5EA5FEAD
P 5900 2850
F 0 "C6" H 5800 2900 50  0000 R CNN
F 1 "4.7uF" H 5800 2800 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5900 2850 50  0001 C CNN
F 3 "~" H 5900 2850 50  0001 C CNN
	1    5900 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5900 2750 5900 2700
Connection ~ 5900 2700
Wire Wire Line
	5900 2700 6150 2700
$Comp
L power:GND #PWR010
U 1 1 5EA6124B
P 5900 3000
F 0 "#PWR010" H 5900 2750 50  0001 C CNN
F 1 "GND" H 5905 2827 50  0000 C CNN
F 2 "" H 5900 3000 50  0001 C CNN
F 3 "" H 5900 3000 50  0001 C CNN
	1    5900 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3000 5900 2950
$Comp
L Device:C_Small C7
U 1 1 5EA639FC
P 7550 4050
F 0 "C7" H 7458 4096 50  0000 R CNN
F 1 "47uF" H 7458 4005 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 7550 4050 50  0001 C CNN
F 3 "~" H 7550 4050 50  0001 C CNN
	1    7550 4050
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5EA63F4F
P 7900 4050
F 0 "C8" H 7808 4096 50  0000 R CNN
F 1 "47uF" H 7808 4005 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 7900 4050 50  0001 C CNN
F 3 "~" H 7900 4050 50  0001 C CNN
	1    7900 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7900 3950 7900 3850
Connection ~ 7900 3850
Wire Wire Line
	7550 3950 7550 3850
Connection ~ 7550 3850
Wire Wire Line
	7550 3850 7900 3850
$Comp
L power:GND #PWR011
U 1 1 5EA65F43
P 7550 4200
F 0 "#PWR011" H 7550 3950 50  0001 C CNN
F 1 "GND" H 7555 4027 50  0000 C CNN
F 2 "" H 7550 4200 50  0001 C CNN
F 3 "" H 7550 4200 50  0001 C CNN
	1    7550 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4200 7550 4150
$Comp
L power:GND #PWR012
U 1 1 5EA6797A
P 7900 4200
F 0 "#PWR012" H 7900 3950 50  0001 C CNN
F 1 "GND" H 7905 4027 50  0000 C CNN
F 2 "" H 7900 4200 50  0001 C CNN
F 3 "" H 7900 4200 50  0001 C CNN
	1    7900 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4200 7900 4150
Wire Wire Line
	2950 3450 4300 3450
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5EA8949D
P 2750 3450
F 0 "J2" H 2858 3631 50  0000 C CNN
F 1 "Conn_EN" H 2858 3540 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2750 3450 50  0001 C CNN
F 3 "~" H 2750 3450 50  0001 C CNN
	1    2750 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3550 3000 3550
$Comp
L power:GND #PWR013
U 1 1 5EA8C8FE
P 3000 3550
F 0 "#PWR013" H 3000 3300 50  0001 C CNN
F 1 "GND" H 3005 3377 50  0000 C CNN
F 2 "" H 3000 3550 50  0001 C CNN
F 3 "" H 3000 3550 50  0001 C CNN
	1    3000 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3850 8400 3850
$Comp
L Mechanical:MountingHole H1
U 1 1 5EA91EA8
P 2200 1250
F 0 "H1" H 2300 1296 50  0000 L CNN
F 1 "MH" H 2300 1205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2200 1250 50  0001 C CNN
F 3 "~" H 2200 1250 50  0001 C CNN
	1    2200 1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5EA92527
P 2550 1250
F 0 "H3" H 2650 1296 50  0000 L CNN
F 1 "MH" H 2650 1205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2550 1250 50  0001 C CNN
F 3 "~" H 2550 1250 50  0001 C CNN
	1    2550 1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5EA929B1
P 2200 1500
F 0 "H2" H 2300 1546 50  0000 L CNN
F 1 "MH" H 2300 1455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2200 1500 50  0001 C CNN
F 3 "~" H 2200 1500 50  0001 C CNN
	1    2200 1500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5EA92DD5
P 2550 1500
F 0 "H4" H 2650 1546 50  0000 L CNN
F 1 "MH" H 2650 1455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2550 1500 50  0001 C CNN
F 3 "~" H 2550 1500 50  0001 C CNN
	1    2550 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J3
U 1 1 5E9EF03C
P 2250 10050
F 0 "J3" H 2300 10367 50  0000 C CNN
F 1 "ground holes" H 2300 10276 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 2250 10050 50  0001 C CNN
F 3 "~" H 2250 10050 50  0001 C CNN
	1    2250 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 9950 2050 10050
Connection ~ 2050 10050
Wire Wire Line
	2050 10050 2050 10150
Connection ~ 2050 10150
Wire Wire Line
	2050 10150 2050 10250
Connection ~ 2050 10250
Wire Wire Line
	2050 10250 2050 10300
Wire Wire Line
	2550 9950 2550 10050
Connection ~ 2550 10050
Wire Wire Line
	2550 10050 2550 10150
Connection ~ 2550 10150
Wire Wire Line
	2550 10150 2550 10250
Connection ~ 2550 10250
Wire Wire Line
	2550 10250 2550 10300
$Comp
L power:GND #PWR015
U 1 1 5E9F2175
P 2550 10300
F 0 "#PWR015" H 2550 10050 50  0001 C CNN
F 1 "GND" H 2555 10127 50  0000 C CNN
F 2 "" H 2550 10300 50  0001 C CNN
F 3 "" H 2550 10300 50  0001 C CNN
	1    2550 10300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5E9F23D5
P 2050 10300
F 0 "#PWR014" H 2050 10050 50  0001 C CNN
F 1 "GND" H 2055 10127 50  0000 C CNN
F 2 "" H 2050 10300 50  0001 C CNN
F 3 "" H 2050 10300 50  0001 C CNN
	1    2050 10300
	1    0    0    -1  
$EndComp
Text Notes 1700 9650 0    50   ~ 0
Holes to solder pin headers\nor wires to help with testing
Text Notes 3350 9650 0    50   ~ 0
Alternative connections for V_in
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 5E9F53B8
P 3450 10100
F 0 "J4" H 3342 9775 50  0000 C CNN
F 1 "V_in alt" H 3342 9866 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 3450 10100 50  0001 C CNN
F 3 "~" H 3450 10100 50  0001 C CNN
	1    3450 10100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 10000 3800 10000
Wire Wire Line
	3650 10100 3800 10100
$Comp
L power:GND #PWR016
U 1 1 5E9F9941
P 3800 10100
F 0 "#PWR016" H 3800 9850 50  0001 C CNN
F 1 "GND" H 3805 9927 50  0000 C CNN
F 2 "" H 3800 10100 50  0001 C CNN
F 3 "" H 3800 10100 50  0001 C CNN
	1    3800 10100
	1    0    0    -1  
$EndComp
Text Label 3800 10000 0    50   ~ 0
V_in
Text Notes 4750 9650 0    50   ~ 0
Alternative connecitions for V_out
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 5EA02216
P 4900 10100
F 0 "J5" H 4792 9775 50  0000 C CNN
F 1 "V_out alt" H 4792 9866 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4900 10100 50  0001 C CNN
F 3 "~" H 4900 10100 50  0001 C CNN
	1    4900 10100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5EA0270E
P 5300 10100
F 0 "#PWR017" H 5300 9850 50  0001 C CNN
F 1 "GND" H 5305 9927 50  0000 C CNN
F 2 "" H 5300 10100 50  0001 C CNN
F 3 "" H 5300 10100 50  0001 C CNN
	1    5300 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 10100 5300 10100
Wire Wire Line
	5100 10000 5300 10000
Text Label 5300 10000 0    50   ~ 0
V_out1
$Comp
L Connector:Barrel_Jack_Switch J6
U 1 1 5E9F25DB
P 6550 10050
F 0 "J6" H 6607 10367 50  0000 C CNN
F 1 "DC_in" H 6607 10276 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 6600 10010 50  0001 C CNN
F 3 "~" H 6600 10010 50  0001 C CNN
	1    6550 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 9950 7050 9950
Text Notes 12100 8850 0    50   ~ 0
TODO:\n- Fuse?\n- Power switch
Text Label 7050 9950 0    50   ~ 0
V_in
Wire Wire Line
	6850 10150 6900 10150
$Comp
L power:GND #PWR018
U 1 1 5E9F7002
P 7050 10150
F 0 "#PWR018" H 7050 9900 50  0001 C CNN
F 1 "GND" H 7055 9977 50  0000 C CNN
F 2 "" H 7050 10150 50  0001 C CNN
F 3 "" H 7050 10150 50  0001 C CNN
	1    7050 10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 10050 6900 10050
Wire Wire Line
	6900 10050 6900 10150
Connection ~ 6900 10150
Wire Wire Line
	6900 10150 7050 10150
$Comp
L Connector:Conn_01x02_Female J9
U 1 1 5E9FF313
P 4900 10650
F 0 "J9" H 4792 10325 50  0000 C CNN
F 1 "V_out alt" H 4792 10416 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4900 10650 50  0001 C CNN
F 3 "~" H 4900 10650 50  0001 C CNN
	1    4900 10650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5E9FF319
P 5300 10650
F 0 "#PWR025" H 5300 10400 50  0001 C CNN
F 1 "GND" H 5305 10477 50  0000 C CNN
F 2 "" H 5300 10650 50  0001 C CNN
F 3 "" H 5300 10650 50  0001 C CNN
	1    5300 10650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 10650 5300 10650
Wire Wire Line
	5100 10550 5300 10550
Text Label 5300 10550 0    50   ~ 0
V_out2
$Comp
L Connector:Conn_01x02_Female J8
U 1 1 5EA02114
P 3450 10650
F 0 "J8" H 3342 10325 50  0000 C CNN
F 1 "V_in alt" H 3342 10416 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 3450 10650 50  0001 C CNN
F 3 "~" H 3450 10650 50  0001 C CNN
	1    3450 10650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 10550 3800 10550
Wire Wire Line
	3650 10650 3800 10650
$Comp
L power:GND #PWR020
U 1 1 5EA0211C
P 3800 10650
F 0 "#PWR020" H 3800 10400 50  0001 C CNN
F 1 "GND" H 3805 10477 50  0000 C CNN
F 2 "" H 3800 10650 50  0001 C CNN
F 3 "" H 3800 10650 50  0001 C CNN
	1    3800 10650
	1    0    0    -1  
$EndComp
Text Label 3800 10550 0    50   ~ 0
V_in
Wire Wire Line
	4850 3200 4850 2700
$Comp
L LMR14050:LMR14050SDDA U2
U 1 1 5EA6E4DB
P 4850 6200
F 0 "U2" H 4850 6150 50  0000 C CNN
F 1 "LMR14050SDDA" H 4850 6050 50  0000 C CNN
F 2 "Package_SO:Texas_HSOP-8-1EP_3.9x4.9mm_P1.27mm_ThermalVias" H 4850 6250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lmr14050.pdf" H 4850 6250 50  0001 C CNN
	1    4850 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 7150 4800 7150
Wire Wire Line
	4800 7150 4800 7200
Connection ~ 4800 7150
$Comp
L power:GND #PWR023
U 1 1 5EA6E4E4
P 4800 7200
F 0 "#PWR023" H 4800 6950 50  0001 C CNN
F 1 "GND" H 4805 7027 50  0000 C CNN
F 2 "" H 4800 7200 50  0001 C CNN
F 3 "" H 4800 7200 50  0001 C CNN
	1    4800 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6100 5650 6100
Wire Wire Line
	5650 6100 5650 6200
Wire Wire Line
	5400 6500 5650 6500
Wire Wire Line
	5650 6500 5650 6400
Connection ~ 5650 6500
$Comp
L Device:C_Small C12
U 1 1 5EA6E4EF
P 5650 6300
F 0 "C12" H 5558 6346 50  0000 R CNN
F 1 "100n" H 5558 6255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5650 6300 50  0001 C CNN
F 3 "~" H 5650 6300 50  0001 C CNN
	1    5650 6300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5EA6E4F5
P 6500 6700
F 0 "R5" H 6570 6746 50  0000 L CNN
F 1 "100k" H 6570 6655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6430 6700 50  0001 C CNN
F 3 "~" H 6500 6700 50  0001 C CNN
	1    6500 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5EA6E4FB
P 6500 7100
F 0 "R6" H 6570 7146 50  0000 L CNN
F 1 "17.8k" H 6570 7055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6430 7100 50  0001 C CNN
F 3 "~" H 6500 7100 50  0001 C CNN
	1    6500 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 7250 6500 7300
$Comp
L power:GND #PWR029
U 1 1 5EA6E502
P 6500 7300
F 0 "#PWR029" H 6500 7050 50  0001 C CNN
F 1 "GND" H 6505 7127 50  0000 C CNN
F 2 "" H 6500 7300 50  0001 C CNN
F 3 "" H 6500 7300 50  0001 C CNN
	1    6500 7300
	1    0    0    -1  
$EndComp
Text Label 4200 6100 2    50   ~ 0
en_signal2
$Comp
L Device:C_Small C10
U 1 1 5EA6E509
P 5150 5500
F 0 "C10" H 5350 5550 50  0000 R CNN
F 1 "100n" H 5350 5450 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5150 5500 50  0001 C CNN
F 3 "~" H 5150 5500 50  0001 C CNN
	1    5150 5500
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5EA6E50F
P 5150 5650
F 0 "#PWR024" H 5150 5400 50  0001 C CNN
F 1 "GND" H 5155 5477 50  0000 C CNN
F 2 "" H 5150 5650 50  0001 C CNN
F 3 "" H 5150 5650 50  0001 C CNN
	1    5150 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5EA6E515
P 4100 6900
F 0 "C9" V 4000 6800 50  0000 C CNN
F 1 "22nF" V 4000 7000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4100 6900 50  0001 C CNN
F 3 "~" H 4100 6900 50  0001 C CNN
	1    4100 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 6900 4200 6900
$Comp
L power:GND #PWR022
U 1 1 5EA6E51C
P 3900 6900
F 0 "#PWR022" H 3900 6650 50  0001 C CNN
F 1 "GND" V 3905 6772 50  0000 R CNN
F 2 "" H 3900 6900 50  0001 C CNN
F 3 "" H 3900 6900 50  0001 C CNN
	1    3900 6900
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5EA6E522
P 4100 6500
F 0 "R4" V 4000 6400 50  0000 C CNN
F 1 "84.5k" V 4000 6600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4030 6500 50  0001 C CNN
F 3 "~" H 4100 6500 50  0001 C CNN
	1    4100 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 6500 4250 6500
Wire Wire Line
	4000 6900 3900 6900
Wire Wire Line
	3950 6500 3900 6500
$Comp
L power:GND #PWR021
U 1 1 5EA6E52B
P 3900 6500
F 0 "#PWR021" H 3900 6250 50  0001 C CNN
F 1 "GND" V 3905 6372 50  0000 R CNN
F 2 "" H 3900 6500 50  0001 C CNN
F 3 "" H 3900 6500 50  0001 C CNN
	1    3900 6500
	0    1    1    0   
$EndComp
Text Label 8400 6500 0    50   ~ 0
V_out2
$Comp
L Device:C_Small C14
U 1 1 5EA6E532
P 7200 6700
F 0 "C14" H 7108 6746 50  0000 R CNN
F 1 "47uF" H 7108 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 7200 6700 50  0001 C CNN
F 3 "~" H 7200 6700 50  0001 C CNN
	1    7200 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7200 6600 7200 6500
Wire Wire Line
	7200 6500 7550 6500
$Comp
L power:GND #PWR030
U 1 1 5EA6E53A
P 7200 6850
F 0 "#PWR030" H 7200 6600 50  0001 C CNN
F 1 "GND" H 7205 6677 50  0000 C CNN
F 2 "" H 7200 6850 50  0001 C CNN
F 3 "" H 7200 6850 50  0001 C CNN
	1    7200 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 6850 7200 6800
Wire Wire Line
	5650 6500 5850 6500
Wire Wire Line
	6500 6500 6500 6550
$Comp
L Device:L L2
U 1 1 5EA6E543
P 6150 6500
F 0 "L2" V 6340 6500 50  0000 C CNN
F 1 "8.2uH" V 6249 6500 50  0000 C CNN
F 2 "Inductor_SMD:L_Wuerth_WE-PD-Typ-LS" H 6150 6500 50  0001 C CNN
F 3 "~" H 6150 6500 50  0001 C CNN
	1    6150 6500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 6500 6500 6500
Connection ~ 6500 6500
Connection ~ 7200 6500
Wire Wire Line
	5850 6600 5850 6500
Connection ~ 5850 6500
Wire Wire Line
	5850 6500 6000 6500
$Comp
L power:GND #PWR027
U 1 1 5EA6E557
P 5850 7050
F 0 "#PWR027" H 5850 6800 50  0001 C CNN
F 1 "GND" H 5855 6877 50  0000 C CNN
F 2 "" H 5850 7050 50  0001 C CNN
F 3 "" H 5850 7050 50  0001 C CNN
	1    5850 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6850 6500 6900
Text Label 6450 6900 2    50   ~ 0
V_FB2
Wire Wire Line
	6500 6900 6450 6900
Connection ~ 6500 6900
Wire Wire Line
	6500 6900 6500 6950
Text Label 5450 6900 0    50   ~ 0
V_FB2
Wire Wire Line
	5450 6900 5400 6900
Text Notes 2450 5750 0    50   ~ 0
External control for starting the regulator\n(and driven load)\n
Wire Wire Line
	5850 7050 5850 7000
Wire Wire Line
	5950 6950 5950 7000
Wire Wire Line
	5950 7000 5850 7000
Connection ~ 5850 7000
Wire Wire Line
	5850 7000 5850 6950
$Comp
L Device:D_Schottky_AAK D2
U 1 1 5EA6E572
P 5850 6750
F 0 "D2" V 5829 6894 50  0000 L CNN
F 1 "D" V 5920 6894 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-277A" H 5850 6750 50  0001 C CNN
F 3 "~" H 5850 6750 50  0001 C CNN
	1    5850 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 5350 5150 5350
Wire Wire Line
	5150 5400 5150 5350
Wire Wire Line
	5150 5350 5500 5350
Connection ~ 5150 5350
Wire Wire Line
	5150 5650 5150 5600
$Comp
L Device:C_Small C11
U 1 1 5EA6E580
P 5500 5500
F 0 "C11" H 5400 5550 50  0000 R CNN
F 1 "4.7uF" H 5400 5450 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5500 5500 50  0001 C CNN
F 3 "~" H 5500 5500 50  0001 C CNN
	1    5500 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5500 5400 5500 5350
Connection ~ 5500 5350
Wire Wire Line
	5500 5350 5900 5350
Wire Wire Line
	5500 5600 5500 5650
$Comp
L power:GND #PWR026
U 1 1 5EA6E58A
P 5500 5650
F 0 "#PWR026" H 5500 5400 50  0001 C CNN
F 1 "GND" H 5505 5477 50  0000 C CNN
F 2 "" H 5500 5650 50  0001 C CNN
F 3 "" H 5500 5650 50  0001 C CNN
	1    5500 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5EA6E590
P 5900 5500
F 0 "C13" H 5800 5550 50  0000 R CNN
F 1 "4.7uF" H 5800 5450 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5900 5500 50  0001 C CNN
F 3 "~" H 5900 5500 50  0001 C CNN
	1    5900 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5900 5400 5900 5350
Connection ~ 5900 5350
$Comp
L power:GND #PWR028
U 1 1 5EA6E599
P 5900 5650
F 0 "#PWR028" H 5900 5400 50  0001 C CNN
F 1 "GND" H 5905 5477 50  0000 C CNN
F 2 "" H 5900 5650 50  0001 C CNN
F 3 "" H 5900 5650 50  0001 C CNN
	1    5900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5650 5900 5600
$Comp
L Device:C_Small C15
U 1 1 5EA6E5A0
P 7550 6700
F 0 "C15" H 7458 6746 50  0000 R CNN
F 1 "47uF" H 7458 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 7550 6700 50  0001 C CNN
F 3 "~" H 7550 6700 50  0001 C CNN
	1    7550 6700
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 5EA6E5A6
P 7900 6700
F 0 "C16" H 7808 6746 50  0000 R CNN
F 1 "47uF" H 7808 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 7900 6700 50  0001 C CNN
F 3 "~" H 7900 6700 50  0001 C CNN
	1    7900 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7900 6600 7900 6500
Connection ~ 7900 6500
Wire Wire Line
	7550 6600 7550 6500
Connection ~ 7550 6500
Wire Wire Line
	7550 6500 7900 6500
$Comp
L power:GND #PWR031
U 1 1 5EA6E5B1
P 7550 6850
F 0 "#PWR031" H 7550 6600 50  0001 C CNN
F 1 "GND" H 7555 6677 50  0000 C CNN
F 2 "" H 7550 6850 50  0001 C CNN
F 3 "" H 7550 6850 50  0001 C CNN
	1    7550 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 6850 7550 6800
$Comp
L power:GND #PWR032
U 1 1 5EA6E5B8
P 7900 6850
F 0 "#PWR032" H 7900 6600 50  0001 C CNN
F 1 "GND" H 7905 6677 50  0000 C CNN
F 2 "" H 7900 6850 50  0001 C CNN
F 3 "" H 7900 6850 50  0001 C CNN
	1    7900 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 6850 7900 6800
Wire Wire Line
	2950 6100 4300 6100
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5EA6E5C0
P 2750 6100
F 0 "J7" H 2858 6281 50  0000 C CNN
F 1 "Conn_EN" H 2858 6190 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2750 6100 50  0001 C CNN
F 3 "~" H 2750 6100 50  0001 C CNN
	1    2750 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 6200 3000 6200
$Comp
L power:GND #PWR019
U 1 1 5EA6E5C7
P 3000 6200
F 0 "#PWR019" H 3000 5950 50  0001 C CNN
F 1 "GND" H 3005 6027 50  0000 C CNN
F 2 "" H 3000 6200 50  0001 C CNN
F 3 "" H 3000 6200 50  0001 C CNN
	1    3000 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 6500 8400 6500
Wire Wire Line
	4850 5850 4850 5350
Wire Wire Line
	5900 5350 6300 5350
$Comp
L Connector:USB_C_Receptacle_USB2.0 J10
U 1 1 5EA7B416
P 10100 6450
F 0 "J10" H 10207 7317 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 10207 7226 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 10250 6450 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 10250 6450 50  0001 C CNN
	1    10100 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 7350 9800 7400
Wire Wire Line
	9800 7400 10100 7400
Wire Wire Line
	10100 7400 10100 7350
Connection ~ 9800 7400
Wire Wire Line
	9800 7400 9800 7450
$Comp
L power:GND #PWR033
U 1 1 5EA7B421
P 9800 7450
F 0 "#PWR033" H 9800 7200 50  0001 C CNN
F 1 "GND" H 9805 7277 50  0000 C CNN
F 2 "" H 9800 7450 50  0001 C CNN
F 3 "" H 9800 7450 50  0001 C CNN
	1    9800 7450
	1    0    0    -1  
$EndComp
Text Label 10750 5850 0    50   ~ 0
V_out2
Wire Wire Line
	10750 5850 10700 5850
NoConn ~ 10700 6350
NoConn ~ 10700 6450
NoConn ~ 10700 6550
NoConn ~ 10700 6650
NoConn ~ 10700 6950
NoConn ~ 10700 7050
NoConn ~ 10700 6150
NoConn ~ 10700 6050
Wire Wire Line
	6850 6500 7200 6500
Wire Wire Line
	6500 6500 6850 6500
Connection ~ 6850 6500
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5EA6E565
P 6850 6500
F 0 "#FLG02" H 6850 6575 50  0001 C CNN
F 1 "PWR_FLAG" H 6850 6673 50  0000 C CNN
F 2 "" H 6850 6500 50  0001 C CNN
F 3 "~" H 6850 6500 50  0001 C CNN
	1    6850 6500
	1    0    0    -1  
$EndComp
Text Label 7800 1700 2    50   ~ 0
V_out1
Wire Wire Line
	7800 1700 7800 1750
$Comp
L Device:LED D3
U 1 1 5EB10820
P 7800 1900
F 0 "D3" V 7839 1783 50  0000 R CNN
F 1 "LED" V 7748 1783 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 7800 1900 50  0001 C CNN
F 3 "~" H 7800 1900 50  0001 C CNN
	1    7800 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 2050 7800 2100
$Comp
L Device:R R7
U 1 1 5EB1645C
P 7800 2250
F 0 "R7" H 7870 2296 50  0000 L CNN
F 1 "3.3k" H 7870 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7730 2250 50  0001 C CNN
F 3 "~" H 7800 2250 50  0001 C CNN
	1    7800 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR034
U 1 1 5EB0FF45
P 7800 2450
F 0 "#PWR034" H 7800 2200 50  0001 C CNN
F 1 "GND" H 7805 2277 50  0000 C CNN
F 2 "" H 7800 2450 50  0001 C CNN
F 3 "" H 7800 2450 50  0001 C CNN
	1    7800 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2400 7800 2450
Text Label 8400 1700 2    50   ~ 0
V_out2
Wire Wire Line
	8400 1700 8400 1750
$Comp
L Device:LED D4
U 1 1 5EB1F7C7
P 8400 1900
F 0 "D4" V 8439 1783 50  0000 R CNN
F 1 "LED" V 8348 1783 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 8400 1900 50  0001 C CNN
F 3 "~" H 8400 1900 50  0001 C CNN
	1    8400 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8400 2050 8400 2100
$Comp
L Device:R R8
U 1 1 5EB1F7CE
P 8400 2250
F 0 "R8" H 8470 2296 50  0000 L CNN
F 1 "3.3k" H 8470 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8330 2250 50  0001 C CNN
F 3 "~" H 8400 2250 50  0001 C CNN
	1    8400 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5EB1F7D4
P 8400 2450
F 0 "#PWR035" H 8400 2200 50  0001 C CNN
F 1 "GND" H 8405 2277 50  0000 C CNN
F 2 "" H 8400 2450 50  0001 C CNN
F 3 "" H 8400 2450 50  0001 C CNN
	1    8400 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2400 8400 2450
Text Notes 7550 1550 0    50   ~ 0
Indicator LEDs
Text Notes 3250 8100 0    50   ~ 0
Reverse polarity protection
Text Label 3400 8500 2    50   ~ 0
V_in
Wire Wire Line
	3850 8500 3400 8500
Text Label 4650 8500 0    50   ~ 0
V_in_protected
Text Label 6300 5350 0    50   ~ 0
V_in_protected
Text Label 6300 2700 0    50   ~ 0
V_in_protected
Wire Wire Line
	4250 8500 4400 8500
$Comp
L power:GND #PWR036
U 1 1 5EA18C8C
P 4050 9150
F 0 "#PWR036" H 4050 8900 50  0001 C CNN
F 1 "GND" H 4055 8977 50  0000 C CNN
F 2 "" H 4050 9150 50  0001 C CNN
F 3 "" H 4050 9150 50  0001 C CNN
	1    4050 9150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRLML9301 Q1
U 1 1 5EA26248
P 4050 8600
F 0 "Q1" V 4392 8600 50  0000 C CNN
F 1 "IRLML6344TRPBF" V 4301 8600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4250 8525 50  0001 L CIN
F 3 "https://www.infineon.com/dgdl/irlml6344pbf.pdf?fileId=5546d462533600a4015356689c44262c" H 4050 8600 50  0001 L CNN
	1    4050 8600
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener_Small D5
U 1 1 5EA2A726
P 4400 8650
F 0 "D5" V 4354 8718 50  0000 L CNN
F 1 "10V" V 4445 8718 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323" V 4400 8650 50  0001 C CNN
F 3 "https://www.digikey.fi/product-detail/fi/on-semiconductor/MM3Z10VST1G/MM3Z10VST1GOSCT-ND/687054" V 4400 8650 50  0001 C CNN
	1    4400 8650
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 8550 4400 8500
Connection ~ 4400 8500
Wire Wire Line
	4400 8500 4650 8500
Wire Wire Line
	4400 8750 4400 8850
Wire Wire Line
	4400 8850 4050 8850
Wire Wire Line
	4050 8850 4050 8800
Wire Wire Line
	4050 8850 4050 8900
Connection ~ 4050 8850
$Comp
L Device:R_Small R9
U 1 1 5EA4E280
P 4050 9000
F 0 "R9" H 4109 9046 50  0000 L CNN
F 1 "100K" H 4109 8955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4050 9000 50  0001 C CNN
F 3 "~" H 4050 9000 50  0001 C CNN
	1    4050 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 9150 4050 9100
$EndSCHEMATC
