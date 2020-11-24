#include "water_cooler.h"

#include <avr/io.h>

/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

static unsigned int revolutions = 0;
static unsigned int time_ms = 0;
static unsigned int rpm = 1700;
static bool current_state = true;

#define WC_PUMP_BIT PC1
#define WC_FAN_BIT PC0
#define WC_PORT PORTC
#define WC_DIRECTION DDRC
#define WC_PORT_PIN PINC
#define FAN_RPM 1700

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/


/**
 * Initializes the fan tachometer pin as input.
 */
void water_cooler_setup()
{
  WC_DIRECTION &= ~( 1 << WC_FAN_BIT );
}

/**
 * Returns the last fan rpm lecture.
 *
 * \return the fan rpm
 */
unsigned int water_cooler_fan_rpm_get()
{
  return rpm;
}


/**
 *  Checks if the fan's tachometer pin state changes. 
 *  After 1 second calculates the current fan rpm.
 */
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


/**
 *  Checks if the fan rpm are lower than the half of its standard value.
 *
 * \return true if the fan is on error, false otherwise.
 */
bool water_cooler_is_on_error()
{
  return rpm < FAN_RPM/2;
}