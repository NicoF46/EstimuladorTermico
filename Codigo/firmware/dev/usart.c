#include "usart.h"

#include <stdlib.h>
#include <string.h>

/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

#define FOSC 16000000  // Clock Speed
#define BAUD 9600
#define UBRR_REGISTER FOSC / 16 / BAUD - 1

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

void usart_init()
{
  unsigned int ubrr = UBRR_REGISTER;
  UBRR0H = ( unsigned char )( ubrr >> 8 );
  UBRR0L = ( unsigned char )ubrr;

  /* setting 8 data bit and 1 stop bit */
  UCSR0C = ( 3 << UCSZ00 ) | ( 1 << UPM01 );

  /* enables receiving and sending with interruptions */
  UCSR0B = ( ( 1 << RXEN0 ) | ( 1 << TXEN0 ) | ( 1 << RXCIE0 ) );
}

void usart_transmit( uint8_t dato )
{
  while( !( UCSR0A & ( 1 << UDRE0 ) ) )
  {
  }
  UDR0 = dato;
}

void usart_buffer_transmit( const void* dato, const int size )
{
  int i = 0;
  uint8_t Buffer[size];
  memcpy( Buffer, dato, size );
  for( i = 0; i < size; i++ )
    usart_transmit( Buffer[i] );
}


uint8_t usart_receive( bool* parity_error )
{
  while( !( UCSR0A & ( 1 << RXC0 ) ) )
  {
  }

  *parity_error = UCSR0A & ( 1 << UPE0 );
  return UDR0;
}


void usart_flush( void )
{
  uint8_t* dummy = malloc( sizeof( *dummy ) );
  while( !( UCSR0A & ( 1 << RXC0 ) ) )
  {
    *dummy = UDR0;
  }
  free( dummy );
}
