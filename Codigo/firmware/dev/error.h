#ifndef ERROR_H
#define ERROR_H

#include <stdint.h>
#include <stddef.h>

/*-----------------------------------------------------------------------------
  Library data types
-----------------------------------------------------------------------------*/

typedef enum
{
  NO_ERROR,
  ERROR
} error_t;

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void error_setup();
void error_set( error_t status );
error_t error_get();
void error_fill_header( uint8_t *header, size_t index );

#endif