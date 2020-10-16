#ifndef KEEP_ALIVE_H
#define KEEP_ALIVE_H

#include <stdbool.h>

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void keep_alive_setup( const unsigned int delay );
void keep_alive_reset();
bool keep_alive_wait();

#endif