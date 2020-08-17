#include "frame.h"
#include "status.h"
#include "error.h"
#include "usart.h"

#include <avr/io.h>
#include <string.h>

#define HEADER_SIZE 2

void frame_send( void *data, size_t data_size )
{
  size_t frame_size =  HEADER_SIZE + data_size;
  uint8_t frame[frame_size];

  status_fill_header( &frame[0] );
  error_fill_header( &frame[1] );
  if ( data )
    memcpy( &frame[ HEADER_SIZE + 1], data, data_size);
  
  usart_buffer_transmit( &frame, frame_size );
}


// Recibe el codigo del comando a ejecutar y en base a eso obtiene los datos y ejecuta el comando.
void frame_receive()
{
  return;
}