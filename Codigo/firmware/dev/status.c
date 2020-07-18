#include "status.h"
#include <avr/io.h>
  
/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

#define LED_COLD_BIT PC3
#define LED_COLD_PORT PORTC
#define LED_COLD_DIRECTION DDRC

#define LED_HOT_BIT PC2
#define LED_HOT_PORT PORTC
#define LED_HOT_DIRECTION DDRC

static status_t actual_status = STANDBY;

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

void status_setup()
{
  LED_COLD_DIRECTION |= ( 1 << LED_COLD_BIT );
  LED_HOT_DIRECTION |= ( 1 << LED_HOT_BIT );
}


void status_set(status_t status){

  switch( status )
  {    
    case COLD:
      actual_status = COLD;
      LED_HOT_PORT &= ~( 1 << LED_HOT_BIT );
      LED_COLD_PORT |= ( 1 << LED_COLD_BIT );
      break;
    
    case HOT:
      actual_status = HOT;
      LED_COLD_PORT &= ~( 1 << LED_COLD_BIT );
      LED_HOT_PORT |= ( 1 << LED_HOT_BIT );
      break;

    case STANDBY:
      actual_status = STANDBY;
      LED_COLD_PORT &= ~( 1 << LED_COLD_BIT );
      LED_HOT_PORT &= ~( 1 << LED_HOT_BIT );
  }
	
}


status_t status_get()
{
	return actual_status;
}
