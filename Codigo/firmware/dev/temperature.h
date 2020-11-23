#ifndef TEMPERATURE_H
#define TEMPERATURE_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void temperature_reader_setup();
float temperature_read();
float temperature_read_thermistor( const uint8_t thermistor_number );
size_t temperature_thermistor_quantity();
float temperature_thermistors_diff();
float temperature_reference_get();
void temperature_reference_set( const float temp );
bool temperature_thermistor_is_on_error( const uint8_t thermistor_number );
float temperature_starting_temperature_get();
float temperature_overshoot_get();

#endif
