#include "app_utils.h"
#include <util/delay.h>

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

void delay_ms(unsigned int delay)
{
  while ( delay-- )
    _delay_ms(1);
}