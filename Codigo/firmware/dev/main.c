#include <stdio.h>

#include "status.h"
#include "error.h"
#include "temperature.h"
#include "usart.h"
#include "power_board.h"
#include "controller.h"
#include "app_utils.h"
#include "keep_alive.h"
#include "water_cooler.h"

#define TEST_DURATION 250

int main( void )
{
  status_setup();
  error_setup();
  temperature_reader_setup();
  usart_init();
  power_board_setup();
  water_cooler_setup();

  status_test_start();
  error_test_start();
  delay_ms( TEST_DURATION );
  status_test_end();
  error_test_end();

  error_clear_all();
  status_set( STANDBY );
  keep_alive_reset();

  controller_loop();

  return ( 0 );
}