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
void error_test_start();
void error_test_end();
void error_set( const error_t error );
void error_clear( const error_t error );
void error_clear_all();
bool error_is_on_error();
uint8_t error_record_get();
void error_sound_alarm();
void error_sound_alarm_restart();
void error_check();
void error_wait();

#endif