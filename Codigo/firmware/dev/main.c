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
float TemperaturaReferencia = 25.0;
modo_t modo = WAITING;
float temps[] = {0, 0};


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

  float temp;

  while( true )
  {
    temps[0] = calculate_temperature( THERMISTOR_1_ADC_CHANNEL );
    temps[1] = calculate_temperature( THERMISTOR_2_ADC_CHANNEL );
    temp = (temps[0] + temps[1]) / 2.0;

   if( modo != WAITING )
   {
      ValorPWM = ControladorPID( TemperaturaReferencia, temp, Kp, Ki, Kd, 0, 0, modo );
      PWM_set_modo( ValorPWM, modo );
    }

    _delay_ms( DELAY_VALUE );
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
      usart_Buffer_transmit( &TemperaturaReferencia, sizeof( TemperaturaReferencia ) );
      modo_frio();
      status_set( COLD );
      modo = FRIO;
      break;

    case( 'e' ):
      TemperaturaReferencia = receive();
      usart_Buffer_transmit( &TemperaturaReferencia, sizeof( TemperaturaReferencia ) );
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

    case( 'i' ):
    {
      uint8_t header;
      status_fill_header( &header, 0 );
      usart_Buffer_transmit( &header, sizeof( header ) );
      break;
    }

    case( 't' ):
    {
      int8_t termistor = receive();
      if ( termistor != 0 && termistor != 1 )
        break;

      usart_Buffer_transmit( &temps[termistor], sizeof( temps[termistor] ) );
      break;
    }

    case( 'f'):
      usart_Buffer_transmit(&ValorPWM, sizeof(ValorPWM));
      break;

    case( 'g' ):
      usart_Buffer_transmit( &TemperaturaReferencia, sizeof( TemperaturaReferencia ) );
      break;

  }
  sei();
}
