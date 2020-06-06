#include<stdint.h>
#include <avr/io.h>

void ADC_configuration_init();
uint16_t ReadADC();
void adc_select_channel(uint8_t);
