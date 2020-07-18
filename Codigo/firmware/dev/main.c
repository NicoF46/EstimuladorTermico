#include <stdio.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h>
#include <stdbool.h>
#include <avr/interrupt.h>
#include "funciones.h"

#include "status.h"
#include "error.h"

float Kp = 42.09506265030314;
float Ki = 0.021557975007171537;
float Kd = 4.4487479401778325;
float bias = 0;
float N_FILTRO = 10;
static uint8_t ValorPWM = 0;
uint8_t alert_system_register = 0;
int TemperaturaReferencia = 25;
modo_t modo = WAITING;

int main( void )
{
  status_setup();
  status_set( STANDBY );
  error_setup();
  error_set( NO_ERROR );

  PWM_configuration_init();
  h_bridge_setup();
  h_bridge_off();
  usart_configuration_init();
  ADC_configuration_init();
  sei();

  float temperature_measure = 255;
  float temp = 25;

  while( true )
  {
    usart_transmit( 't' );
    temperature_measure = calculate_temperature( THERMISTOR_1_ADC_CHANNEL );
    usart_Buffer_transmit( &temperature_measure, sizeof( temperature_measure ) );
    temp = temperature_measure;
    temperature_measure = calculate_temperature( THERMISTOR_2_ADC_CHANNEL );
    usart_Buffer_transmit( &temperature_measure, sizeof( temperature_measure ) );
    temp += temperature_measure;
    temp /= 2;

    _delay_ms( DELAY_VALUE );

    if( modo != WAITING )
    {
      ValorPWM = ControladorPID( TemperaturaReferencia, temp, Kp, Ki, Kd, 0, 0, modo );
      PWM_set_modo( ValorPWM, modo );
    }
  }

  return ( 0 );
}


ISR( USART_RX_vect )
{
  uint8_t command = receive();

  switch( command )
  {
    case( 'a' ):
      ValorPWM = receive();
      modo_frio();
      PWM_set_modo( ValorPWM, FRIO );
      status_set( COLD );
      break;

    case( 'b' ):
      ValorPWM = receive();
      modo_calor();
      PWM_set_modo( ValorPWM, CALOR );
      status_set( HOT );
      break;

    case( 'd' ):
      TemperaturaReferencia = receive();
      modo_frio();
      status_set( COLD );
      modo = FRIO;
      break;

    case( 'e' ):
      TemperaturaReferencia = receive();
      modo_calor();
      status_set( HOT );
      modo = CALOR;
      break;

    case( 's' ):
      h_bridge_off();
      status_set( STANDBY );
      modo = WAITING;
      break;

    case( 'x' ):
      h_bridge_off();
      sei();
      error_set( ERROR );
      break;

    case( 'z' ):
      error_set( NO_ERROR );
      break;

      // case('c'):
      //   TemperaturaCalibracion = receive();
      //   CalibracionPID(TemperaturaCalibracion, &Kp, &Ki, &Kd, &N_FILTRO, &bias,
      //   &alert_system_register); break;

      // case('d'):
      //   TemperaturaCalibracion = receive();
      //   CalibracionPID(TemperaturaCalibracion, &Kp, &Ki, &Kd, &N_FILTRO, &bias,
      //   &alert_system_register); break;


      // case('r'):
      //   TemperaturaReferencia = receive();
      //   if (TemperaturaReferencia >= TEMPERATURA_MINIMA && TemperaturaReferencia <=
      //   TEMPERATURA_MAXIMA ){
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
