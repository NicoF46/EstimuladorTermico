#include "error.h"
#include "app_utils.h"
#include "temperature.h"
#include "status.h"
#include "water_cooler.h"
#include <stdbool.h>
#include <avr/io.h>
#include <stddef.h>
#include <avr/interrupt.h>

/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

#define LED_NO_ERROR_BIT PC3
#define LED_NO_ERROR_PORT PORTC
#define LED_NO_ERROR_DIRECTION DDRC

#define LED_ERROR_BIT PC2
#define LED_ERROR_PORT PORTC
#define LED_ERROR_DIRECTION DDRC

#define BUZZER_BIT PB3
#define BUZZER_PORT PORTB
#define BUZZER_DIRECTION DDRB

#define MAX_TEMPERATURE 40
#define MIN_TEMPERATURE 10
#define MAX_THERMISTORS_DEVIATION 7
#define MAX_OVERSHOOT 3

#define BUZZER_MELODY_REPETION 10
#define BUZZER_MELODY_SIZE 20
const static unsigned int BUZZER_MELODY[BUZZER_MELODY_SIZE] = { 200, 100, 200, 100, 200, 300, 200,
                                                                100, 200, 500, 200, 100, 200, 100,
                                                                200, 300, 200, 100, 200, 2500 };
static uint8_t melody_index = 0;
static uint8_t melody_repetitions = 0;
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
  if( melody_repetitions >= BUZZER_MELODY_REPETION )
    return;
  melody_index % 2 == 0 ? ( _buzzer_on() ) : ( _buzzer_off() );
  delay_ms( BUZZER_MELODY[melody_index++] );
  if( melody_index >= BUZZER_MELODY_SIZE )
  {
    melody_index = 0;
    melody_repetitions++;
  }
}

/**
 * Sets to 0 the sound alarm counters.
 */
void error_sound_alarm_restart()
{
  melody_index = 0;
  melody_repetitions = 0;
}

/**
 *  Checks if device's components are not working.
 *
 */
void error_check()
{
  temperature_thermistor_is_on_error( 0 ) ? error_set( error_thermistor_1 )
                                          : error_clear( error_thermistor_1 );

  temperature_thermistor_is_on_error( 1 ) ? error_set( error_thermistor_2 )
                                          : error_clear( error_thermistor_2 );

  temperature_read() > MAX_TEMPERATURE ? error_set( error_max_temperature )
                                       : error_clear( error_max_temperature );

  temperature_read() < MIN_TEMPERATURE ? error_set( error_min_temperature )
                                       : error_clear( error_min_temperature );

  temperature_thermistors_diff() > MAX_THERMISTORS_DEVIATION ? error_set( error_deviation )
                                                             : error_clear( error_deviation );

  water_cooler_is_on_error() && status_get() != STANDBY ? error_set(error_fan) 
                                                        : error_clear(error_fan);

  if ( temperature_overshoot_get(status_get()) - MAX_OVERSHOOT > 0 )
    error_set( error_calibrate );
}


/**
 * Waits until the error byte is equal to zero. If there is any error the error led
 * and alarm will be on.
 */
void error_wait()
{
  error_sound_alarm_restart();
  while( error_is_on_error() )
  {
    error_sound_alarm();
    error_check();
  }
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
  _buzzer_off();
}

static void _buzzer_on()
{
  BUZZER_PORT |= ( 1 << BUZZER_BIT );
}

static void _buzzer_off()
{
  BUZZER_PORT &= ~( 1 << BUZZER_BIT );
}