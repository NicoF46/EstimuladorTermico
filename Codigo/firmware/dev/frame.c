#include "frame.h"
#include "status.h"
#include "error.h"
#include "usart.h"
#include "commands.gen.h"

#include <avr/io.h>
#include <string.h>

#define HEADER_SIZE 2


void frame_send( void *data, size_t data_size )
{
}

void frame_receive()
{
  bool parity_error;
  uint8_t command = usart_receive( &parity_error );
  if( !parity_error )
    return;

  union command_ctx ctx;
  switch( command )
  {
    case( 'd' ):
      ctx.cold.input.temp = usart_receive( &parity_error );
      if( parity_error )
        break;
      command_cold( &ctx );
      frame_send( NULL, 0 );
      break;

    case( 'e' ):
      ctx.hot.input.temp = usart_receive( &parity_error );
      if( parity_error )
        break;
      command_hot( &ctx );
      frame_send( NULL, 0 );
      break;
    }

}