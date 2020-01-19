#include <stdio.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h>
#include <stdbool.h>
#include <avr/interrupt.h>
#include "funciones.h"

float Kp = 7.8*1.1;
float Ki = 0.127;
float Kd = 1.959;
float bias = 0;
float N_FILTRO = 10;
static float TemperaturaCalibracion = 25;
static uint8_t ValorPWM = 0;
static bool power_on = false;

int main(void)
{
  static float TemperaturaTermistor=255;

  leds_setup();

  h_bridge_setup();
  h_bridge_off();
  PWM_configuration_init();
  usart_configuration_init();
  ADC_configuration_init();
  
  sei();

  while( true ){

    // TemperaturaTermistor = SensarTemperaturaSuperficial();
    TemperaturaTermistor = SensarTemperaturaDivisor();      
    usart_transmit('t');
    usart_Buffer_transmit(&TemperaturaTermistor, sizeof(TemperaturaTermistor));

    // if ( power_on ){

    //   // ValorPWM = ControladorPID(TemperaturaReferencia,TemperaturaTermistor, Kp, Ki, Kd, 0, 0, modo);
    //   PWM_set_modo(ValorPWM, modo);
    //   usart_transmit('p');
    //   usart_transmit(ValorPWM);
    // }

    _delay_ms(DELAYVALUE);
 }

  return(0);
}


ISR(USART_RX_vect){

  uint8_t modo = receive();

  switch(modo){
    // case('r'):
    //   TemperaturaReferencia = receive();
    //   break;

    case('a'):
        ValorPWM = receive();
        modo_frio();
        PWM_set_modo(ValorPWM, FRIO);
        power_on = true;
        break;

    case('b'):
        ValorPWM = receive();
        modo_calor();
        PWM_set_modo(ValorPWM, CALOR);
        power_on = true;
        break;

    case('s'):
      h_bridge_off();
      power_on = false;
      break;

    case('c'):
      TemperaturaCalibracion = receive();
      CalibracionPID(TemperaturaCalibracion, &Kp, &Ki, &Kd, &N_FILTRO, &bias);
      break;
  }
  sei();
}
