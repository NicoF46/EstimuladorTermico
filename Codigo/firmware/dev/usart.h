#include <avr/io.h>
#include <stdbool.h>

void usart_init();
void usart_transmit( uint8_t );
void usart_buffer_transmit( void*, int size );
int8_t usart_receive( bool* parity_error );
