#include "power_board.h"
#include "app_utils.h"

#include <avr/io.h>

/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

typedef void ( *mode_set )( void );
static void _standby_mode_set();
static void _cold_mode_set();
static void _hot_mode_set();
static mode_set mode_set_functions[3] = { &_standby_mode_set, &_cold_mode_set, &_hot_mode_set };
static power_board_mode_t current_mode = MODE_OFF;

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

/**
 * Configures the registers needed to use the power board.
 */
void power_board_setup()
{
  DDRD |= ( ( 1 << PD5 ) | ( 1 << PD6 ) );

  // PWM SETUP
  DDRD |= ( ( 1 << DDD5 ) | ( 1 << DDD6 ) );
  ICR1 = 0x00FF;
  OCR1A = 0;
  OCR1B = 0;
  TCCR1A |= ( 1 << COM1A1 ) | ( 1 << COM1B1 );
  TCCR1A |= ( 1 << WGM11 );
  TCCR1B |= ( 1 << WGM12 ) | ( 1 << WGM13 );
  TCCR1B |= ( 1 << CS10 );

  return mode_set_functions[current_mode]();
}

/**
 * Sets an operation mode for the controll board.
 * Modes:
 *  - MODE_OFF: Turns off the power board.
 *  - MODE_COLD: Configures the power board to use the cold mode.
 *  - MODE_HOT: Configures the power board to use the hot mode.
 *
 * \param[in]  mode  The mode
 */
void power_board_mode_set( const power_board_mode_t mode )
{
  current_mode = mode;
  return mode_set_functions[mode]();
}

/**
 * Returns the current mode used by the power board.
 *
 * \return     The power board mode.
 */
power_board_mode_t power_board_mode_get()
{
  return current_mode;
}


/**
 * Sets the pwm used by the power board.
 *
 * \param[in]  pwm   The pwm
 */
void power_board_pwm_set( const uint8_t pwm )
{
  if( current_mode == MODE_COLD )
    OCR1B = pwm;
  else if( current_mode == MODE_HOT )
    OCR1A = pwm;
}


/**
 * Gets the pwm used by the power board.
 *
 * \param[in]  pwm   The pwm
 */
uint8_t power_board_pwm_get( )
{
  if( current_mode == MODE_COLD )
    return OCR1B;
  else if( current_mode == MODE_HOT )
    return OCR1A;
  return 0;
}


/* ----------------------------------------------------------------------------
  Internal function definition
------------------------------------------------------------------------------*/

/**
 * Turns off the power board.
 */
static void _standby_mode_set()
{
  PORTD &= ~( 1 << PD5 );
  PORTD &= ~( 1 << PD6 );
  DDRB &= ~( ( 1 << PB1 ) | ( 1 << PB2 ) );
  OCR1B = 0;
  OCR1A = 0;
}

/**
 * Sets the cold mode.
 */
static void _cold_mode_set()
{
  /* HOT MODE OFF */
  PORTD &= ~( 1 << PD6 );
  OCR1A = 0;
  DDRB &= ~( 1 << PB1 );
  delay_ms( 10 );
  /* COLD MODE ON */
  PORTD |= ( 1 << PD5 );
  DDRB |= ( 1 << PB2 );
}

/**
 * Sets the hot mode.
 */
static void _hot_mode_set()
{
  /* COLD MODE OFF */
  PORTD &= ~( 1 << PD5 );
  OCR1B = 0;
  DDRB &= ~( 1 << PB2 );
  delay_ms( 10 );
  /* HOT MODE ON */
  PORTD |= ( 1 << PD6 );
  DDRB |= ( 1 << PB1 );
}
