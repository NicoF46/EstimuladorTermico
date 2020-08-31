#include "temperature.h"

#include <avr/io.h>
#include <math.h>
#include <stdint.h>

/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

#define THERMISTORS_QUANTITY 2
const static uint8_t THERMISTORS_CHANNELS[THERMISTORS_QUANTITY] = {6, 7};

#define VCC 5.0  // 5v
#define MAX_ADC 1023
#define ZERO_KELVIN -273.15
#define THERMISTOR_BETA 3435  // kelvin
#define THERMISTOR_R0 10000   // 10k
#define THERMISTOR_T0 298.15  // kelvin

static float t_reference;

/* ----------------------------------------------------------------------------
  Internal function Prototypes
------------------------------------------------------------------------------*/

uint16_t _adc_read(uint8_t channel);
float _calculate_temperature( uint16_t adc_read );
float _temperature_get( uint8_t channel);

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

/** 
 * Initializes the ADC used to measure the temperature.
 */
void temperature_reader_setup()
{
  /* Configures the ADC1 PC1 with AVCC as reference */
  ADMUX |= ( ( 1 << REFS0 ) | ( 1 << MUX1 ) );
  ADCSRA |= ( ( 1 << ADEN ) | ( 1 << ADPS2 ) | ( 1 << ADPS1 ) | ( 1 << ADPS0 ) );

  t_reference = temperature_read();
}

/**
 * Returns average temperature. 
 *
 * \return The average temperature.
 */
float temperature_read()
{
  float temp = 0;
  for( size_t i = 0; i < THERMISTORS_QUANTITY; i++)
  {
    temp += temperature_read_thermistor( i );
  }
  return temp/THERMISTORS_QUANTITY;
}

/**
 * Reads a specific thermistor and return its temperature. 
 *
 * \param[in]  thermistor_number  The thermistor number to be read.
 *
 * \return     the thermistor temperature.
 */
float temperature_read_thermistor( uint8_t thermistor_number )
{
  return _calculate_temperature(_adc_read(THERMISTORS_CHANNELS[thermistor_number]));
}

/**
 * Returns the thermistor quantity.
 *
 * \return     the thermistor quantity.
 */
size_t temperature_thermistor_quantity()
{
  return THERMISTORS_QUANTITY;
}


float temperature_reference_get()
{
  return t_reference;
}


void temperature_reference_set(const float temp)
{
  t_reference = temp;
}

/* ----------------------------------------------------------------------------
  Internal function definition
------------------------------------------------------------------------------*/

uint16_t _adc_read(uint8_t channel)
{
  // selects the channel to be read
  ADMUX &= ( ( 1 << REFS1 ) | ( 1 << REFS0 ) | ( 1 << ADLAR ) );
  ADMUX |= channel;

  // reads the channel
  ADCSRA |= ( 1 << ADSC );
  while( ( ADCSRA & _BV( ADSC ) ) )
    ;
  return ADC;
}

float _calculate_temperature( uint16_t adc_read )
{
  float v_out = ( ( float )( adc_read ) ) * VCC / MAX_ADC;
  float thermistor_resistance = ( VCC - v_out ) / ( v_out / THERMISTOR_R0 );
  float thermistor_temperature =
    ( (1.0/THERMISTOR_T0) + ( 1.0/THERMISTOR_BETA )*log( thermistor_resistance / ( float )THERMISTOR_R0 ) );
  thermistor_temperature =  1.0 / thermistor_temperature + ZERO_KELVIN;
  return thermistor_temperature;
}



