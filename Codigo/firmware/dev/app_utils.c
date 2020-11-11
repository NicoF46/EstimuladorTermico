#include "app_utils.h"
#include <util/delay.h>

// static unsigned int revolutions = 0;
// static unsigned int time_ms = 0;
// static unsigned int rpm = 3600;
// static bool current_state = true; // check pin output

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

/**
 * Waits until the input time, in miliseconds, elapses.
 *
 * \param[in]  delay  The time to wait, in miliseconds.
 */
void delay_ms( unsigned int delay )
{
  while( delay-- )
  {
    _delay_ms( 1 );
    // tachometer_check();
  }
}




// void tachometer_check() 
// {
//   static bool new_state = true; //read pinout
//   if (new_state != current_state )
//   {
//     current_state = new_state;
//     revolutions++;
//   }
//   time_ms++;
//   if (time_ms > 1000){
//     rpm = revolutions/4 * 60;
//     revolutions = 0;
//     time_ms = 0;
//   }
// }


//   WC_DIRECTION &= ~( 1 << WC_FAN_BIT );
//   WC_PORT |= ( 1 << WC_FAN_BIT );
//   bool new_state = (WC_PORT_PIN & (1 << WC_FAN_BIT)) != 0;


// #define WC_PUMP_BIT PC0
// #define WC_FAN_BIT PC1
// #define WC_PORT PORTC
// #define WC_DIRECTION DDRC
// #define WC_PORT_PIN PINC