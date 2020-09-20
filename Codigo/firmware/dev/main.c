#include <stdio.h>

#include "status.h"
#include "error.h"
#include "temperature.h"
#include "usart.h"
#include "power_board.h"
#include "controller.h"
#include "app_utils.h"

#define TEST_DURATION 1000

int main( void )
{
  status_setup();
  error_setup();
  temperature_reader_setup();
  usart_init();
  power_board_setup();

  status_test_start();
  error_test_start();
  delay_ms(TEST_DURATION);
  status_test_end();
  error_test_end();

  error_clear_all();
  status_set( STANDBY );

  controller_loop();

  return ( 0 );
}