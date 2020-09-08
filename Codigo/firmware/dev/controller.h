#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <stdint.h>

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void controller_loop();
uint8_t controller_pid( const float ref, const float input );
void controller_pid_values_get( float *Pk_out, float *Dk_out, float *Ik_out );

#endif