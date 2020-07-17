#ifndef STATUS_H
#define STATUS_H

/*-----------------------------------------------------------------------------
  Library data types
-----------------------------------------------------------------------------*/

typedef enum{NO_ERROR, ERROR, COLD, HOT}status_t;

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void status_setup();
void status_set(status_t status);
status_t status_get();

#endif