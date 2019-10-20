#include <stdio.h>
#include <avr/io.h>
#include  <math.h>
#include "ConfiguracionPWM.h"
#include "ConfiguracionSerial.h"
#include "ConfiguracionADC.h"
#include <stdlib.h>
#include <time.h>
#include <util/delay.h>

#define REFERENCIAADC 5.00 //5v
#define MAXIMOVALORADC 1023
#define R1 9750
#define R2 9770
#define CEROKELVIN -273.15
#define T0TERMISTOR 298.15 //kelvin
#define BETATERMISTOR 3982 //kelvin
#define R0TERMISTOR 10000 //10k
#define RESISTENCIADIVISORRESISTIVO 10000
#define SALIDAMAXIMAMODOCALOR 255
#define SALIDAMINIMAMODOCALOR 0
#define SALIDAMAXIMAMODOFRIO 0
#define SALIDAMINIMAMODOFRIO -255
#define TEMPERATURA_MAXIMA 49.0
#define TEMPERATURA_MINIMA -10.0
#define DELAYVALUE 100.00
#define CANTIDAD_COMBINACIONES_PWM_DIFFTEMP 5
#define TOLERANCIA_DELAY 0.5
#define TAU 0.63

void apagarPuenteH();
void apagar(volatile int*);
void Pin_SetUp();
float SensarTemperatura();
modo_t definir_modo(float, int );
void modo_frio();
void modo_calor();
uint8_t ControladorPID(float ,float , float , float , float ,float ,float ,modo_t );
void CalibracionPID(float,float*,float*,float*,float*,float*);
float BuscarPWMRequerido(float[][2],int,float);
