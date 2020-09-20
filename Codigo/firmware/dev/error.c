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
static void _error_led_on();
static void _no_error_led_off();
static void _no_error_led_on();
static void _error_mode();
static void _no_error_mode();
static void _buzzer_on();
static void _buzzer_off();

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
 * Turns on leds and buzzer for testing purpose.
 */
void error_test_start()
{
  _error_led_on();
  _no_error_led_on();
  _buzzer_on();
}

/**
 * Turns off leds and buzzer for testing purpose.
 */
void error_test_end()
{
  _error_led_off();
  _no_error_led_off();
  _buzzer_off();
}



/**
 * Sets the device's error flag.
 *
 * \param[in]  error  The error flag.
 */
void error_set( const error_t error )
{
  current_error |= ( 1 << error );
  _error_mode();
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
    _no_error_mode();
}


/**
 * Clears every error flag.
 */
void error_clear_all()
{
  current_error = 0;
  _no_error_mode();
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

  for( size_t n = 0; n < BUZZER_MELODY_REPETITION; n++ )
  {
    for( size_t i = 0; i < BUZZER_MELODY_SIZE && current_error != 0; i++ )
    {
      i%2 == 0 ? ( _buzzer_on() ) : ( _buzzer_off() );
      delay_ms( BUZZER_MELODY[i] );
    }
  }
  _buzzer_off();
}

/* ----------------------------------------------------------------------------
  Internal function definition
------------------------------------------------------------------------------*/

static void _error_led_off()
{
  LED_ERROR_PORT &= ~( 1 << LED_ERROR_BIT );
}

static void _error_led_on()
{
  LED_ERROR_PORT |= ( 1 << LED_ERROR_BIT );
}

static void _no_error_led_off()
{
  LED_NO_ERROR_PORT &= ~( 1 << LED_NO_ERROR_BIT );
}

static void _no_error_led_on()
{
  LED_NO_ERROR_PORT |= ( 1 << LED_NO_ERROR_BIT );
}

static void _error_mode()
{
  _no_error_led_off();
  _error_led_on();
}

static void _no_error_mode()
{
  _error_led_off();
  _no_error_led_on();
}

static void _buzzer_on()
{
  BUZZER_PORT |= ( 1 << BUZZER_BIT );
}

static void _buzzer_off()
{
  BUZZER_PORT &= ~( 1 << BUZZER_BIT );
}