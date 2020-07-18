#include "error.h"
#include "app_utils.h"
#include <stdbool.h>
#include <avr/io.h>
#include <stddef.h>
#include <avr/interrupt.h>

/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

#define LED_NO_ERROR_BIT PB0
#define LED_NO_ERROR_PORT PORTB
#define LED_NO_ERROR_DIRECTION DDRB

#define LED_ERROR_BIT PD7
#define LED_ERROR_PORT PORTD
#define LED_ERROR_DIRECTION DDRD

#define BUZZER_BIT PB4
#define BUZZER_PORT PORTB
#define BUZZER_DIRECTION DDRB

#define BUZZER_MELODY_SIZE 20
const static unsigned int BUZZER_MELODY[BUZZER_MELODY_SIZE] = 
  {
    200, 100, 200, 100, 200, 300, 200, 100, 200, 500, 
    200, 100, 200, 100, 200, 300, 200, 100, 200, 2500
  };

static error_t current_error = NO_ERROR;

/* ----------------------------------------------------------------------------
  Internal function Prototypes
------------------------------------------------------------------------------*/

static void _alarm_sound();

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

/**
 * Sets the register's bit to output used by the error indicators LEDs and buzzer.
 */
void error_setup()
{
  LED_NO_ERROR_DIRECTION |= ( 1 << LED_NO_ERROR_BIT );
  LED_ERROR_DIRECTION |= ( 1 << LED_ERROR_BIT );
  BUZZER_DIRECTION |= ( 1 << BUZZER_BIT );
}

/**
 * Sets the device's current error.
 *
 * \param[in]  error  The new device's error.
 */
void error_set( error_t error )
{
  switch( error )
  {
    case NO_ERROR:
      current_error = NO_ERROR;
      LED_ERROR_PORT &= ~( 1 << LED_ERROR_BIT );
      LED_NO_ERROR_PORT |= ( 1 << LED_NO_ERROR_BIT );
      break;
    case ERROR:
      current_error = ERROR;
      LED_NO_ERROR_PORT &= ~( 1 << LED_NO_ERROR_BIT );
      LED_ERROR_PORT |= ( 1 << LED_ERROR_BIT );
      _alarm_sound();
      break;
  }
}

/**
 * Returns the current device error.
 *
 * \return The current error.
 */
error_t error_get()
{
  return current_error;
}

/* ----------------------------------------------------------------------------
  Internal function definition
------------------------------------------------------------------------------*/

/**
 * Makes the device plays an alarm melody indefinitely. It can only be stoped using
 * an interruption that changes the current error value.
 */
static void _alarm_sound()
{
  bool sound_on = true;

  while( current_error == ERROR )
  {
    for( size_t i = 0; i < BUZZER_MELODY_SIZE; i++ )
    {
      sound_on ? ( BUZZER_PORT |= ( 1 << BUZZER_BIT ) ) : ( BUZZER_PORT &= ~( 1 << BUZZER_BIT ) );
      delay_ms( BUZZER_MELODY[i] );

      sound_on = !sound_on;
    }
  }
}