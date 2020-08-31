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

static status_t current_status = STANDBY;

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

/**
 * Sets the register's bit to output mode used by the hot and cold indicators LEDs.
 */
void status_setup()
{
  LED_COLD_DIRECTION |= ( 1 << LED_COLD_BIT );
  LED_HOT_DIRECTION |= ( 1 << LED_HOT_BIT );
}


/**
 * Sets the devices current status.
 *
 * \param[in]  status  The new device's status.
 */
void status_set( const status_t status )
{
  switch( status )
  {
    case COLD:
    case PWM_COLD:
    case COLD_REACHED:
      current_status = COLD;
      LED_HOT_PORT &= ~( 1 << LED_HOT_BIT );
      LED_COLD_PORT |= ( 1 << LED_COLD_BIT );
      break;

    case HOT:
    case PWM_HOT:
    case HOT_REACHED:
      current_status = HOT;
      LED_COLD_PORT &= ~( 1 << LED_COLD_BIT );
      LED_HOT_PORT |= ( 1 << LED_HOT_BIT );
      break;

    case STANDBY:
      current_status = STANDBY;
      LED_COLD_PORT &= ~( 1 << LED_COLD_BIT );
      LED_HOT_PORT &= ~( 1 << LED_HOT_BIT );
      break;
  }

  current_status = status;
}


/**
 * Returns the current device's status.
 *
 * \return     The current device's status.
 */
status_t status_get()
{
  return current_status;
}


/**
 * Fills the `index` header's byte with the device's current status.
 *
 * \param[out] header  The header to be sended.
 * \param[in]  index   The index in the header where the status is saved.
 */
void status_fill_header( uint8_t *header )
{
  *header = current_status;
}