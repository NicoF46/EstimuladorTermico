#include "ConfiguracionADC.h"
#include <math.h>
void ADC_configuration_init()
{
  /*Configuro el ADC1 PC1 con AVCC de referencia*/
  ADMUX |= ( ( 1 << REFS0 ) | ( 1 << MUX1 ) );
  ADCSRA |= ( ( 1 << ADEN ) | ( 1 << ADPS2 ) | ( 1 << ADPS1 ) | ( 1 << ADPS0 ) );
}

uint16_t ReadADC()
{
  ADCSRA |= ( 1 << ADSC );
  while( ( ADCSRA & _BV( ADSC ) ) )
    ;
  return ADC;
}

void adc_select_channel( uint8_t channel_number )
{
  ADMUX &= ( ( 1 << REFS1 ) | ( 1 << REFS0 ) | ( 1 << ADLAR ) );
  ADMUX |= channel_number;
}
