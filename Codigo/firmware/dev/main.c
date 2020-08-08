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
float temps[] = { 0, 0 };


int main( void )
{
  status_setup();
  status_set( STANDBY );
  error_setup();

  PWM_configuration_init();
  h_bridge_setup();
  h_bridge_off();
  usart_init();
  ADC_configuration_init();
  sei();

  float temp;

  while( true )
  {
    temps[0] = calculate_temperature( THERMISTOR_1_ADC_CHANNEL );
    temps[1] = calculate_temperature( THERMISTOR_2_ADC_CHANNEL );
    temp = ( temps[0] + temps[1] ) / 2.0;

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
  uint8_t command = usart_receive();

  switch( command )
  {
    case( 'a' ):
      ValorPWM = usart_receive();
      modo_frio();
      PWM_set_modo( ValorPWM, FRIO );
      status_set( COLD );
      break;

    case( 'b' ):
      ValorPWM = usart_receive();
      modo_calor();
      PWM_set_modo( ValorPWM, CALOR );
      status_set( HOT );
      break;

    case( 'd' ):
      TemperaturaReferencia = usart_receive();
      usart_buffer_transmit( &TemperaturaReferencia, sizeof( TemperaturaReferencia ) );
      modo_frio();
      status_set( COLD );
      modo = FRIO;
      break;

    case( 'e' ):
      TemperaturaReferencia = usart_receive();
      usart_buffer_transmit( &TemperaturaReferencia, sizeof( TemperaturaReferencia ) );
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
      error_t error = usart_receive();
      error_set( error );
      break;

    case( 'z' ):
      error_clear_all( );
      break;

    case( 'i' ):
    {
      uint8_t header[2] = {0, 0};
      status_fill_header( &header[0] );
      error_fill_header( &header[1] );
      usart_buffer_transmit( &header, sizeof( header ) );
      break;
    }

    case( 't' ):
    {
      int8_t termistor = usart_receive();
      if( termistor != 0 && termistor != 1 )
        break;

      usart_buffer_transmit( &temps[termistor], sizeof( temps[termistor] ) );
      break;
    }

    case( 'f' ):
      usart_buffer_transmit( &ValorPWM, sizeof( ValorPWM ) );
      break;

    case( 'g' ):
      usart_buffer_transmit( &TemperaturaReferencia, sizeof( TemperaturaReferencia ) );
      break;
  }
  sei();
}
