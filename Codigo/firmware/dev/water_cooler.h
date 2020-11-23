#ifndef WATER_COOLER_H
#define WATER_COOLER_H

#include <stdbool.h>

void water_cooler_setup();
unsigned int water_cooler_fan_rpm_get();
void water_cooler_tachometer_check();
bool water_cooler_is_on_error();

#endif