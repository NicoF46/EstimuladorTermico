#include <stdio.h>

#include "status.h"
#include "error.h"
#include "temperature.h"
#include "usart.h"
#include "power_board.h"
#include "controller.h"

int main( void )
{
  status_setup();
  error_setup();
  temperature_reader_setup();
  usart_init();
  power_board_setup();

  controller_loop();

  return ( 0 );
}