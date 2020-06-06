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
static modo_t modo = CALIBRACION;
static float TemperaturaReferencia = 255;
char buffer_serial[25];
uint8_t alert_system_register = 0;

int main(void)
{
  static float temperature_measure=255;

  leds_setup();
  PWM_configuration_init();
  h_bridge_setup();
  h_bridge_off();
  usart_configuration_init();
  ADC_configuration_init();
  buzzer_configuration_init();
  normal_operation_led_on();
  sei();

  while( true ){

    temperature_measure = read_temperature();
    usart_transmit('t');
    usart_Buffer_transmit(&temperature_measure, sizeof(temperature_measure));

     if ( power_on ){
       ValorPWM = ControladorPID(TemperaturaReferencia,temperature_measure, Kp, Ki, Kd, 0, 0, modo);
       PWM_set_modo(ValorPWM, modo);
     }

    _delay_ms(DELAY_VALUE);

    if(alert_system_register != STATUS_OK){
      send_failure_signals();
      desactivate_equipment();
    }


 }

  return(0);
}


ISR(USART_RX_vect){

  uint8_t command = receive();

  switch(command){
     case('r'):
       TemperaturaReferencia = receive();
       modo = definir_modo(25,TemperaturaReferencia);
       power_on = true;
       break;

    case('a'):
        ValorPWM = receive();
        modo_frio();
        PWM_set_modo(ValorPWM, FRIO);
        power_on = false;
        break;

    case('b'):
        ValorPWM = receive();
        modo_calor();
        PWM_set_modo(ValorPWM, CALOR);
        power_on = false;
        break;

    case('s'):
      h_bridge_off();
      power_on = false;
      break;

    case('c'):
      TemperaturaCalibracion = receive();
      CalibracionPID(TemperaturaCalibracion, &Kp, &Ki, &Kd, &N_FILTRO, &bias);
      power_on = false;
      break;
  }
  sei();
}
