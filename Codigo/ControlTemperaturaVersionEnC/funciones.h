#include <stdio.h>
#include <avr/io.h>
#include  <math.h>
#include "ConfiguracionPWM.h"
#include "ConfiguracionSerial.h"
#include "ConfiguracionADC.h"
#include <stdlib.h>
#include <time.h>
#include <util/delay.h>

#define REFERENCIAADC 5.0 //5v
#define MAXIMOVALORADC 1023
#define R1 9750
#define R2 9770
#define CEROKELVIN -273.15
#define T0TERMISTOR 298.15 //kelvin
#define UNOSOBRET0TERMISTOR 0.003354016435
#define UNOSOBREBETA0 0.0002958579882
#define BETATERMISTOR 3982 //kelvin
#define R0TERMISTOR 10000 //10k
#define SALIDA_MAXIMA_MODO_CALOR 128
#define SALIDA_MINIMA_MODO_CALOR 0
#define SALIDA_MAXIMA_MODO_FRIO 255
#define SALIDA_MINIMA_MODO_FRIO 0
#define TEMPERATURA_MAXIMA 49.0
#define TEMPERATURA_MINIMA -10.0
#define DELAYVALUE 100.00
#define CANTIDAD_COMBINACIONES_PWM_DIFFTEMP 4
#define TOLERANCIA_DELAY 0.05
#define TAU 0.63
#define TENSION_REFERENCIA_OPAMPS 2.495
#define RESISTENCIA_R3 39000.0
#define RESISTENCIA_R4 39000.0
#define RESISTENCIA_R5 27000.0
#define CANTIDAD_TERMISTORES_SUPERFICIALES 4.0
#define RESISTENCIA_R6 3300.0
#define RESISTENCIA_R7 1500.0
#define RESISTENCIA_R8 39000.0
#define RESISTENCIA_R9 10000.0
#define RESISTENCIA_R10 41000.0

void h_bridge_off();
void h_bridge_setup();
void leds_setup();
float SensarTemperaturaSuperficial();
float SensarTemperaturaPuntual();
modo_t definir_modo(float, int );
void modo_frio();
void modo_calor();
uint8_t ControladorPID(float ,float , float , float , float ,float ,float ,modo_t );
void CalibracionPID(float,float*,float*,float*,float*,float*);
float BuscarPWMRequerido(float[][2],int,float);
void ApagarLedsIndicacion();
float SensarTemperaturaDivisor();