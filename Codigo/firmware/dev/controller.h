#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <stdint.h>
#include "status.h"

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void controller_loop();
uint8_t controller_pid( const float ref, const float input );
void controller_restart( float current_pwm, status_t new_status );

#endif