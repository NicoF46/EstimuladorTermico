#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <stdint.h>
#include "power_board.h"

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void controller_loop();
uint8_t controller_pid( const float ref, const float input );
void controller_restart( power_board_mode_t new_mode );

#endif