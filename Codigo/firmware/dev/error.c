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
#define BUZZER_MELODY_REPETITION 10
const static unsigned int BUZZER_MELODY[BUZZER_MELODY_SIZE] = { 200, 100, 200, 100, 200, 300, 200,
                                                                100, 200, 500, 200, 100, 200, 100,
                                                                200, 300, 200, 100, 200, 2500 };

static uint8_t current_error = 0;

/* ----------------------------------------------------------------------------
  Internal function Prototypes
------------------------------------------------------------------------------*/

static void _error_led_off();

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
  _error_led_off();
}


/**
 * Sets the device's error flag.
 *
 * \param[in]  error  The error flag.
 */
void error_set( const error_t error )
{
  current_error |= ( 1 << error );
  LED_NO_ERROR_PORT &= ~( 1 << LED_NO_ERROR_BIT );
  LED_ERROR_PORT |= ( 1 << LED_ERROR_BIT );
}


/**
 * Clears the `error` bit flag.
 *
 * \param[in]  error  The error flag.
 */
void error_clear( const error_t error )
{
  current_error &= ~( 1 << error );
  if( current_error == 0 )
    _error_led_off();
}


/**
 * Clears every error flag.
 */
void error_clear_all()
{
  current_error = 0;
  _error_led_off();
}


/**
 * Tells if the device's is on error.
 *
 * \return     \c false if there is no error, \c true otherwise.
 */
bool error_is_on_error()
{
  return current_error != 0;
}


/**
 * Returns the record with the error flags.
 *
 * \return  The errors record.
 */
uint8_t error_record_get()
{
  return current_error;
}


/**
 * Makes the device plays an alarm melody indefinitely. It can only be stoped using
 * an interruption that changes the current error value.
 */
void error_sound_alarm()
{
  sei();
  bool sound_on = true;

  for( size_t n = 0; n < BUZZER_MELODY_REPETITION; n++ )
  {
    for( size_t i = 0; i < BUZZER_MELODY_SIZE && current_error != 0; i++ )
    {
      sound_on ? ( BUZZER_PORT |= ( 1 << BUZZER_BIT ) ) : ( BUZZER_PORT &= ~( 1 << BUZZER_BIT ) );
      delay_ms( BUZZER_MELODY[i] );

      sound_on = !sound_on;
    }
  }
  BUZZER_PORT &= ~( 1 << BUZZER_BIT );
}

/* ----------------------------------------------------------------------------
  Internal function definition
------------------------------------------------------------------------------*/

static void _error_led_off()
{
  LED_ERROR_PORT &= ~( 1 << LED_ERROR_BIT );
  LED_NO_ERROR_PORT |= ( 1 << LED_NO_ERROR_BIT );
}