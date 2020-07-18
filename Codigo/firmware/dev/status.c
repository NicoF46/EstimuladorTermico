#include "status.h"
#include "app_utils.h"
#include <stdbool.h>
#include <avr/io.h>
#include <stddef.h>
  
/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

#define LED_NO_ERROR_BIT PB0
#define LED_NO_ERROR_PORT PORTB
#define LED_NO_ERROR_DIRECTION DDRB

#define LED_ERROR_BIT PD7
#define LED_ERROR_PORT PORTD
#define LED_ERROR_DIRECTION DDRD

#define LED_COLD_BIT PC3
#define LED_COLD_PORT PORTC
#define LED_COLD_DIRECTION DDRC

#define LED_HOT_BIT PC2
#define LED_HOT_PORT PORTC
#define LED_HOT_DIRECTION DDRC

#define BUZZER_BIT PB4
#define BUZZER_PORT PORTB
#define BUZZER_DIRECTION DDRB
#define BUZZER_MELODY_SIZE 20
#define BUZZER_MELODY {200, 100, 200, 100, 200, 300, 200, 100, 200, 500,\
                       200, 100, 200, 100, 200, 300, 200, 100, 200, 2500}


static status_t actual_status = NO_ERROR;

/* ----------------------------------------------------------------------------
  Internal function Prototypes
------------------------------------------------------------------------------*/

static void _alarm_sound();

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

void status_setup()
{
	LED_NO_ERROR_DIRECTION |= ( 1 << LED_NO_ERROR_BIT );
  LED_ERROR_DIRECTION |= ( 1 << LED_ERROR_BIT );
  LED_COLD_DIRECTION |= ( 1 << LED_COLD_BIT );
  LED_HOT_DIRECTION |= ( 1 << LED_HOT_BIT );
  BUZZER_DIRECTION |= ( 1 << BUZZER_BIT);
  
  LED_NO_ERROR_PORT |= ( 1 << LED_NO_ERROR_BIT );
}


void status_set(status_t status){

  switch( status )
  {    
    case ERROR:
      actual_status = ERROR;
      LED_NO_ERROR_PORT &= ~( 1 << LED_NO_ERROR_BIT );
      LED_ERROR_PORT |= ( 1 << LED_ERROR_BIT );
      _alarm_sound();
      break;

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
      actual_status = NO_ERROR;
      LED_COLD_PORT &= ~( 1 << LED_COLD_BIT );
      LED_HOT_PORT &= ~( 1 << LED_HOT_BIT );
  }
	
}


status_t status_get()
{
	return actual_status;
}

/* ----------------------------------------------------------------------------
  Internal function definition
------------------------------------------------------------------------------*/

static void _alarm_sound()
{
  bool sound_on = true;
  const unsigned int melody[] = BUZZER_MELODY;

  while( true )
  {
    for( size_t i = 0; i < BUZZER_MELODY_SIZE; i++ )
    {
      sound_on ? (BUZZER_PORT |= ( 1 << BUZZER_BIT)) : (BUZZER_PORT &= ~( 1 << BUZZER_BIT));
      delay_ms(melody[i]);

      sound_on = !sound_on;
    }
  }
}