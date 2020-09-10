#ifndef POWER_BOARD_H
#define POWER_BOARD_H

#include <stdint.h>

/*-----------------------------------------------------------------------------
  Library data types
-----------------------------------------------------------------------------*/

typedef enum
{
  MODE_OFF,
  MODE_COLD,
  MODE_HOT
} power_board_mode_t;

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void power_board_setup();
void power_board_mode_set( const power_board_mode_t mode );
power_board_mode_t power_board_mode_get();
void power_board_pwm_set( const uint8_t pwm );

#endif