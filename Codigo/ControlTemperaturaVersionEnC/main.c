#include <stdio.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h>
#include "funciones.h"
#include <avr/interrupt.h>

volatile int TemperaturaReferencia = 255;
float Kp = 7.8*1.1;
float Ki = 0.127;
float Kd = 1.959;
float bias = 0;
float N_FILTRO = 10;
static float TemperaturaCalibracion=25;

int main(void)
{
    static float TemperaturaTermistor=255;
    static float TemperaturaAmbiente=0;
    static modo_t modo = CALIBRACION;
    static uint8_t ValorPWM=0;
    Pin_SetUp();
    apagar(&TemperaturaReferencia);
    PWM_configuration_init();
    usart_configuration_init();
    ADC_configuration_init();
    sei();

    TemperaturaAmbiente=SensarTemperaturaPuntual();
    while(1){

      TemperaturaTermistor = SensarTemperaturaPuntual();
      usart_transmit('t');
      usart_Buffer_transmit(&TemperaturaTermistor,sizeof(TemperaturaTermistor));

      _delay_ms(DELAYVALUE);
      if (TemperaturaReferencia != 255){
        modo = definir_modo(TemperaturaAmbiente, TemperaturaReferencia);
        ValorPWM = ControladorPID(TemperaturaReferencia,TemperaturaTermistor, Kp, Ki, Kd,0,0,modo);
        PWM_set_modo(ValorPWM,modo);
        usart_transmit('p');
        usart_transmit(ValorPWM);

      }
   }

    return(0);
}



ISR(USART_RX_vect){
  uint8_t modo = receive();
  switch(modo){
      case('r'):
        TemperaturaReferencia = receive();
        break;
      case('s'):
        apagar(&TemperaturaReferencia);
        break;
      case('c'):
        TemperaturaCalibracion = receive();
        CalibracionPID(TemperaturaCalibracion,&Kp, &Ki,& Kd,&N_FILTRO,& bias);
        break;

    }
}
