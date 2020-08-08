#ifndef ERROR_H
#define ERROR_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

/*-----------------------------------------------------------------------------
  Library data types
-----------------------------------------------------------------------------*/

typedef enum
{
  error_thermistor_1,
  error_thermistor_2,
  error_deviation,
  error_calibrate,
  error_fan,
  error_max_temperature,
  error_min_temperature
} error_t;

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void error_setup();
void error_set( error_t error );
void error_clear( error_t error );
void error_clear_all( );
bool error_is_on_error( );
void error_fill_header( uint8_t *header );
void error_sound_alarm();

#endif