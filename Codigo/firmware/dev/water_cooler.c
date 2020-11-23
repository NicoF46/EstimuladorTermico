#include "water_cooler.h"

#include <avr/io.h>

static unsigned int revolutions = 0;
static unsigned int time_ms = 0;
static unsigned int rpm = 1700;
static bool current_state = true;

#define WC_PUMP_BIT PC1
#define WC_FAN_BIT PC0
#define WC_PORT PORTC
#define WC_DIRECTION DDRC
#define WC_PORT_PIN PINC

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

void water_cooler_setup()
{
  WC_DIRECTION &= ~( 1 << WC_FAN_BIT );
}

unsigned int water_cooler_fan_rpm_get()
{
  return rpm;
}



void water_cooler_tachometer_check() 
{
  bool new_state = (WC_PORT_PIN & (1 << WC_FAN_BIT)) != 0;
  if (new_state != current_state )
  {
    current_state = new_state;
    revolutions++;
  }
  time_ms++;
  if (time_ms > 1000){
    rpm = revolutions/4 * 60;
    revolutions = 0;
    time_ms = 0;
  }
}

bool water_cooler_is_on_error()
{
  return rpm < 1700/2;
}