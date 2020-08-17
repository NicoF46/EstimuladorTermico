#include <stdio.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h>
#include <stdbool.h>
#include <avr/interrupt.h>
#include "funciones.h"

#include "status.h"
#include "error.h"
#include "frame.h"
#include "commands.gen.h"
#include "commands_frames.gen.h"


float Kp = 20;
float Ki = 0.04;
float Kd = 4;
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
    temp = temps[0];

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
  bool parity_error;
  uint8_t command = usart_receive( &parity_error );
  if( parity_error )
  {
    sei();
    return;
  }

    union command_ctx cmd_ctx;

  switch( command )
  {
    case( 'a' ):
      ValorPWM = usart_receive( &parity_error );
      if( parity_error )
        break;
      modo_frio();
      PWM_set_modo( ValorPWM, FRIO );
      status_set( COLD );
      break;

    case( 'b' ):
      ValorPWM = usart_receive( &parity_error );
      if( parity_error )
        break;
      modo_calor();
      PWM_set_modo( ValorPWM, CALOR );
      status_set( HOT );
      break;

    case( 'd' ):
    {
      if( !command_frame_cold_receive( &cmd_ctx ) )
        break;
      command_cold( &cmd_ctx );
      command_frame_cold_send( &cmd_ctx );

      TemperaturaReferencia = cmd_ctx.cold.input.temp;
      modo = FRIO;
      break;
    }
    case( 'e' ):
      if( !command_frame_hot_receive( &cmd_ctx ) )
        break;
      command_hot( &cmd_ctx );
      command_frame_hot_send( &cmd_ctx );

      TemperaturaReferencia = cmd_ctx.hot.input.temp;
      modo = CALOR;
      break;

    case( 's' ):
      h_bridge_off();
      status_set( STANDBY );
      modo = WAITING;
      break;

    case( 'x' ):
      h_bridge_off();
      error_t error = usart_receive( &parity_error );
      if( parity_error )
        break;
      error_set( error );
      error_sound_alarm();
      break;

    case( 'z' ):
      error_clear_all();
      break;

    case( 'i' ):
    {
      usart_transmit(status_get());
      usart_transmit(error_record_get());
      break;
    }

    case( 't' ):
    {
      int8_t termistor = usart_receive( &parity_error );
      if( parity_error && termistor != 0 && termistor != 1 )
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
