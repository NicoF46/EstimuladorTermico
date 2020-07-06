#include <stdio.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h>
#include <stdbool.h>
#include <avr/interrupt.h>
#include "funciones.h"

float Kp = 42.09506265030314;
float Ki = 0.04;
float Kd = 2.8;
float bias = 0;
float N_FILTRO = 10;
static float TemperaturaCalibracion = 25;
static uint8_t ValorPWM = 0;
static bool power_on = false;
static modo_t modo = CALIBRACION;
static float TemperaturaReferencia = 255;
uint8_t alert_system_register = 0;
float temperature_measure=255;

int main(void)
{
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

    temperature_measure = read_temperature(&alert_system_register);
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

    case('c'):
      TemperaturaCalibracion = receive();
      CalibracionPID(TemperaturaCalibracion, &Kp, &Ki, &Kd, &N_FILTRO, &bias, &alert_system_register);
      power_on = false;
      break;

    case('d'):
      TemperaturaCalibracion = receive();
      CalibracionPID(TemperaturaCalibracion, &Kp, &Ki, &Kd, &N_FILTRO, &bias, &alert_system_register);
      power_on = false;
      break;

    case('s'):
      h_bridge_off();
      power_on = false;
      break;

    case('r'):
      TemperaturaReferencia = receive();
      if (TemperaturaReferencia >= TEMPERATURA_MINIMA && TemperaturaReferencia <= TEMPERATURA_MAXIMA ){
        modo = definir_modo(25,TemperaturaReferencia);
        set_modo(modo);
        power_on = true;}
      break;

    case('x'):
      if (temperature_measure == 255)
        temperature_measure = read_temperature(&alert_system_register);
      usart_transmit('x');
      usart_Buffer_transmit(&temperature_measure, sizeof(temperature_measure));
      break;
  }
  sei();
}
