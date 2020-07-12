#include <stdio.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h>
#include <stdbool.h>
#include <avr/interrupt.h>
#include "funciones.h"

float Kp = 42.09506265030314;
float Ki = 0.021557975007171537;
float Kd = 4.4487479401778325;
float bias = 0;
float N_FILTRO = 10;
static uint8_t ValorPWM = 0;
uint8_t alert_system_register = 0;
int TemperaturaReferencia = 25;
modo_t modo = STANDBY;

/*
 * A2 = hot
 * A3 = cold
 * D7 = ERROR
 * D8 = ON
 * 
 * D12 = buzzer
 */

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

  float temperature_measure=255;
  float temp = 25;

  while( true ){

    usart_transmit('t');
    temperature_measure = calculate_temperature(THERMISTOR_1_ADC_CHANNEL);
    usart_Buffer_transmit(&temperature_measure, sizeof(temperature_measure));
    temp = temperature_measure;
    temperature_measure = calculate_temperature(THERMISTOR_2_ADC_CHANNEL);
    usart_Buffer_transmit(&temperature_measure, sizeof(temperature_measure));
    temp += temperature_measure;
    temp /= 2;

    _delay_ms(DELAY_VALUE);

     if ( modo != STANDBY ){
      ValorPWM = ControladorPID(TemperaturaReferencia,temp, Kp, Ki, Kd, 0, 0, modo);
      PWM_set_modo(ValorPWM, modo);
     }

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
      break;

    case('b'):
      ValorPWM = receive();
      modo_calor();
      PWM_set_modo(ValorPWM, CALOR);
      break;

    case('d'):
      TemperaturaReferencia = receive();
      modo_frio();
      modo = FRIO;
      break;

    case('e'):
      TemperaturaReferencia = receive();
      modo_calor();
      modo = CALOR;
      break;    

    case('s'):
      h_bridge_off();
      modo = STANDBY;
      break;

    // case('c'):
    //   TemperaturaCalibracion = receive();
    //   CalibracionPID(TemperaturaCalibracion, &Kp, &Ki, &Kd, &N_FILTRO, &bias, &alert_system_register);
    //   break;

    // case('d'):
    //   TemperaturaCalibracion = receive();
    //   CalibracionPID(TemperaturaCalibracion, &Kp, &Ki, &Kd, &N_FILTRO, &bias, &alert_system_register);
    //   break;


    // case('r'):
    //   TemperaturaReferencia = receive();
    //   if (TemperaturaReferencia >= TEMPERATURA_MINIMA && TemperaturaReferencia <= TEMPERATURA_MAXIMA ){
    //     modo = definir_modo(25,TemperaturaReferencia);
    //     power_on = true;}
    //   break;

    // case('x'):
    //   if (temperature_measure == 255)
    //     temperature_measure = read_temperature(&alert_system_register);
    //   usart_transmit('x');
    //   usart_Buffer_transmit(&temperature_measure, sizeof(temperature_measure));
    //   break;
  }
  sei();
}
