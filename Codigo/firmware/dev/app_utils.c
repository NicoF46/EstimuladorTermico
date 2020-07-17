#include "app_utils.h"
#include <util/delay.h>

void delay_ms(unsigned int delay)
{
  while ( delay-- )
    _delay_ms(1);
}