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
  COLD_REACHED,
  HOT_REACHED
} status_t;

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void status_setup();
void status_set( status_t status );
status_t status_get();
void status_fill_header( uint8_t *header );

#endif