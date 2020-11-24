#ifndef APP_UTILS_H
#define APP_UTILS_H

#define ABS( n ) ( ( n ) < 0 ? -( n ) : ( n ) )

/* ----------------------------------------------------------------------------
  Function prototypes
------------------------------------------------------------------------------*/

void delay_ms( unsigned int delay );
void app_utils_setup();
unsigned int fan_rpm_get();
void tachometer_check();


#endif