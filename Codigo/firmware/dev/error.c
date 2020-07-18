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
#define BUZZER_MELODY {200, 100, 200, 100, 200, 300, 200, 100, 200, 500,\
                       200, 100, 200, 100, 200, 300, 200, 100, 200, 2500}

static error_t actual_error = NO_ERROR;

/* ----------------------------------------------------------------------------
  Internal function Prototypes
------------------------------------------------------------------------------*/

static void _alarm_sound();

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

void error_setup()
{
  LED_NO_ERROR_DIRECTION |= ( 1 << LED_NO_ERROR_BIT );
  LED_ERROR_DIRECTION |= ( 1 << LED_ERROR_BIT );
  BUZZER_DIRECTION |= ( 1 << BUZZER_BIT);
}


void error_set(error_t error){

  switch( error )
  {    
    case NO_ERROR:
      actual_error = NO_ERROR;
      LED_ERROR_PORT &= ~( 1 << LED_ERROR_BIT );
      LED_NO_ERROR_PORT |= ( 1 << LED_NO_ERROR_BIT );
      break;
    case ERROR:
      actual_error = ERROR;
      LED_NO_ERROR_PORT &= ~( 1 << LED_NO_ERROR_BIT );
      LED_ERROR_PORT |= ( 1 << LED_ERROR_BIT );
      _alarm_sound();
      break;
  }
}


error_t error_get()
{
	return actual_error;
}

/* ----------------------------------------------------------------------------
  Internal function definition
------------------------------------------------------------------------------*/

static void _alarm_sound()
{
  bool sound_on = true;
  const unsigned int melody[] = BUZZER_MELODY;

  while( actual_error == ERROR )
  {
    for( size_t i = 0; i < BUZZER_MELODY_SIZE; i++ )
    {
      sound_on ? (BUZZER_PORT |= ( 1 << BUZZER_BIT)) : (BUZZER_PORT &= ~( 1 << BUZZER_BIT));
      delay_ms(melody[i]);

      sound_on = !sound_on;
    }
  }
}