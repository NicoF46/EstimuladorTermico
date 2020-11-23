#include "app_utils.h"
#include "water_cooler.h"

#include <util/delay.h>

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

/**
 * Waits until the input time, in miliseconds, elapses.
 *
 * \param[in]  delay  The time to wait, in miliseconds.
 */
void delay_ms( unsigned int delay )
{
  while( delay-- )
  {
    _delay_ms( 1 );
    water_cooler_tachometer_check();
  }
}
