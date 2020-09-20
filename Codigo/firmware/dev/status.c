#include "status.h"
#include <avr/io.h>
#include <stdbool.h>

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
  Internal function Prototypes
------------------------------------------------------------------------------*/

static void _cold_led_on();
static void _cold_led_off();
static void _hot_led_on();
static void _hot_led_off();
static void _cold_mode();
static void _hot_mode();
static void _standby_mode();

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
 * Turns on every led for testing purpose.
 */
void status_test_start()
{
  _cold_led_on();
  _hot_led_on();
}

/**
 * Turns off every led for testing purpose.
 */
void status_test_end()
{
  _cold_led_off();
  _hot_led_off();
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
      _cold_mode();
      break;

    case HOT:
    case PWM_HOT:
    case HOT_REACHED:
      current_status = HOT;
      _hot_mode();
      break;

    case STANDBY:
      current_status = STANDBY;
      _standby_mode();
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

/* ----------------------------------------------------------------------------
  Internal function definition
------------------------------------------------------------------------------*/

static void _cold_led_on()
{
  LED_COLD_PORT |= ( 1 << LED_COLD_BIT );
}

static void _cold_led_off()
{
  LED_COLD_PORT &= ~( 1 << LED_COLD_BIT );
}

static void _hot_led_on()
{
  LED_HOT_PORT |= ( 1 << LED_HOT_BIT );
}

static void _hot_led_off()
{
  LED_HOT_PORT &= ~( 1 << LED_HOT_BIT );
}

static void _cold_mode()
{
  _hot_led_off();
  _cold_led_on();
}

static void _hot_mode()
{
  _cold_led_off();
  _hot_led_on();
}

static void _standby_mode()
{
  _cold_led_off();
  _hot_led_off();
}