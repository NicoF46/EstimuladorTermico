#include <stdio.h>
#include <stdint.h>
#include <avr/io.h>
#include <math.h>
#include <stdbool.h>
#include <avr/interrupt.h>
#include "funciones.h"

// #include "serial_interruption.gen.h"

#include "status.h"
#include "error.h"
#include "commands.gen.h"
#include "commands_frames.gen.h"
#include "temperature.h"

float Kp = 20;
float Ki = 0.04;
float Kd = 2;
float bias = 0;
float N_FILTRO = 10;
static uint8_t ValorPWM = 0;
uint8_t alert_system_register = 0;
modo_t modo = WAITING;


int main( void )
{
  status_setup();
  error_setup();
  temperature_reader_setup();

  PWM_configuration_init();
  h_bridge_setup();
  h_bridge_off();
  usart_init();
  sei();

  float temp;

  while( true )
  {
    temp = temperature_read();

    if( modo != WAITING )
    {
      ValorPWM = ControladorPID( temperature_reference_get(), temp, Kp, Ki, Kd, 0, 0, modo );
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
      if( !command_frame_pwm_cold_receive( &cmd_ctx ) )
        break;
      command_pwm_cold( &cmd_ctx );
      command_frame_pwm_cold_send( &cmd_ctx );
      break;

    case( 'b' ):
      if( !command_frame_pwm_hot_receive( &cmd_ctx ) )
        break;
      command_pwm_hot( &cmd_ctx );
      command_frame_pwm_hot_send( &cmd_ctx );
      break;

    case( 'd' ):
    {
      if( !command_frame_cold_receive( &cmd_ctx ) )
        break;
      command_cold( &cmd_ctx );
      command_frame_cold_send( &cmd_ctx );

      modo = FRIO;
      break;
    }
    case( 'e' ):
      if( !command_frame_hot_receive( &cmd_ctx ) )
        break;
      command_hot( &cmd_ctx );
      command_frame_hot_send( &cmd_ctx );

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
      uint8_t termistor = usart_receive( &parity_error );
      if( parity_error && termistor < 0 && termistor > 2 )
        break;
      float temp = temperature_read_thermistor( termistor );
      if ( termistor == 2 )
        temp = temperature_read();
      usart_buffer_transmit( &temp, sizeof( temp ) );
      break;
    }

    case( 'f' ):
      usart_buffer_transmit( &ValorPWM, sizeof( ValorPWM ) );
      break;

    case( 'g' ):
    {
      float ref = temperature_reference_get();
      usart_buffer_transmit( &ref, sizeof( ref ) );
      break;
    }
  }
  sei();
}
