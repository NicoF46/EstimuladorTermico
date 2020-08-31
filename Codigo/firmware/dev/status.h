#ifndef STATUS_H
#define STATUS_H

#include <stdint.h>
#include <stddef.h>

/*-----------------------------------------------------------------------------
  Library data types
-----------------------------------------------------------------------------*/

typedef enum
{
  STANDBY,
  COLD,
  HOT,
  PWM_COLD,
  PWM_HOT,
  COLD_REACHED,
  HOT_REACHED
} status_t;

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void status_setup();
void status_set( const status_t status );
status_t status_get();

#endif