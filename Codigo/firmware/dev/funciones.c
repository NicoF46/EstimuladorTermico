#include "funciones.h"
#include "ConfiguracionADC.h"

void h_bridge_off()
{
  PORTD &= ~( 1 << PD5 );
  PORTD &= ~( 1 << PD6 );
  DDRB &= ~( ( 1 << PB1 ) | ( 1 << PB2 ) );
  OCR1B = 0;
  OCR1A = 0;
}

void h_bridge_setup()
{
  DDRD |= ( ( 1 << PD5 ) | ( 1 << PD6 ) );
}

void leds_setup()
{
  DDRD |= ( 1 << PD7 );
  DDRC |= ( ( 1 << PC3 ) | ( 1 << PC2 ) );
  DDRB |= ( 1 << PB0 );
  PORTD &= ~( 1 << PD7 );
  PORTC &= ~( 1 << PC3 );
  PORTC &= ~( 1 << PC2 );
  PORTB &= ~( 1 << PB0 );
}

float read_temperature( uint8_t* alert_system_register )
{
  float temperature_thermistor_1 = 0;
  float temperature_thermistor_2 = 0;
  // float mean_temperature = 0;

  // temperature_thermistor_1 = calculate_temperature(THERMISTOR_1_ADC_CHANNEL);
  // temperature_thermistor_2 = calculate_temperature(THERMISTOR_2_ADC_CHANNEL);
  // mean_temperature = (temperature_thermistor_1+temperature_thermistor_2)/2.0;
  // if (fabs(temperature_thermistor_1-temperature_thermistor_2) > TEMPERATURE_DIFFERENCE_TOLERANCE)
  //   (*alert_system_register) = ERROR_TEMPERATURE_DIFFERENCE;
  /*usart_transmit('h');
  usart_buffer_transmit(&temperature_thermistor_1, sizeof(temperature_thermistor_1));
  usart_buffer_transmit(&temperature_thermistor_2, sizeof(temperature_thermistor_2));
  usart_buffer_transmit(&mean_temperature, sizeof(mean_temperature));*/
  return ( temperature_thermistor_1 + temperature_thermistor_2 ) / 2.0;
}

float calculate_temperature( uint8_t adc_channel )
{
  float v_out = 0;
  float thermistor_resistance = 0;
  float thermistor_temperature = 0;
  uint16_t adc_read_value = 0;

  adc_select_channel( adc_channel );
  adc_read_value = ReadADC();
  v_out = ( ( float )( adc_read_value ) ) * REFERENCIAADC / MAXIMOVALORADC;
  thermistor_resistance = ( REFERENCIAADC - v_out ) / ( v_out / R0TERMISTOR );
  thermistor_temperature =
    ( UNOSOBRET0TERMISTOR + ( UNOSOBREBETA0 )*log( thermistor_resistance / ( float )R0TERMISTOR ) );
  thermistor_temperature = ( ( float )1 ) / thermistor_temperature + CEROKELVIN;
  return thermistor_temperature;
}

modo_t definir_modo( float Tamb, float Tref )
{
  if( Tamb > Tref )
  {
    modo_frio();
    return FRIO;
  }
  modo_calor();
  return CALOR;
}

void modo_frio()
{
  /* MODO CALOR OFF */
  PORTD &= ~( 1 << PD6 );
  OCR1A = 0;
  DDRB &= ~( 1 << PB1 );
  _delay_ms( 10 );
  /* MODO FRIO ON */
  PORTD |= ( 1 << PD5 );
  DDRB |= ( 1 << PB2 );
}

void modo_calor()
{
  /* MODO FRIO OFF */
  PORTD &= ~( 1 << PD5 );
  OCR1B = 0;
  DDRB &= ~( 1 << PB2 );
  _delay_ms( 10 );
  /* MODO CALOR ON */
  PORTD |= ( 1 << PD6 );
  DDRB |= ( 1 << PB1 );
}

uint8_t ControladorPID( float ReferenciaControl,
                        float SalidaMedida,
                        float Kp,
                        float Ki,
                        float Kd,
                        float N,
                        float bias,
                        modo_t modo )
{
  // Creo que las variables que necesito almacenar la proxima iteracion
  static float SalidaPrevia = 0;
  static float ReferenciaPrevia = 0;
  static float Ik_previo = 0;
  static float Dk_previo = 0;
  float Pk = 0;
  float Ik = 0;
  float Dk = 0;
  float Salida = 0;
  float gamma;
  float h;
  float SalidaMaxima = 0;
  float SalidaMinima = 0;

  if( modo == FRIO )
  {
    SalidaMaxima = SALIDA_MAXIMA_MODO_FRIO;
    SalidaMinima = SALIDA_MINIMA_MODO_FRIO;
  }
  else if( modo == CALOR )
  {
    SalidaMaxima = SALIDA_MAXIMA_MODO_CALOR;
    SalidaMinima = SALIDA_MINIMA_MODO_CALOR;
  }

  h = ( ( DELAY_VALUE )*pow( 10, -3 ) );

  if( !N )
  {
    N = 1;
  }
  gamma = Kd / N;

  Pk = Kp * ( ReferenciaControl - SalidaMedida );
  Ik = Ik_previo + Ki * Kp * h * ( ReferenciaPrevia - SalidaPrevia );
  Dk =
    gamma / ( gamma + h ) * Dk_previo - Kp * Kd / ( gamma + h ) * ( SalidaMedida - SalidaPrevia );

  // Emito la salida
  if( Kp != 0 )
    Salida = Ik + Dk + Pk + bias;

  // Actualizo las variables la proxima iteracion
  SalidaPrevia = SalidaMedida;
  ReferenciaPrevia = ReferenciaControl;
  Dk_previo = Dk;

  // Trunco la salida si se va de rango
  if( Salida > SalidaMaxima )
  {
    Salida = SalidaMaxima;
  }
  else if( Salida <= SalidaMinima )
  {
    Salida = SalidaMinima;
  }

  if( modo == FRIO && Ik <= SalidaMinima )
    Ik_previo = SalidaMinima;
  // Anulo el termino integral si mi sistema satura;
  else if( SalidaMedida >= TEMPERATURA_MAXIMA && Salida == SalidaMaxima )
  {
    Ik_previo = 0;
  }
  else if( modo == CALOR && Ik > SalidaMaxima )
  {
    Ik_previo = SalidaMaxima;
  }
  else if( SalidaMedida <= TEMPERATURA_MINIMA && Salida == SalidaMinima )
  {
    Ik_previo = 0;
  }
  else
  {
    Ik_previo = Ik;
  }

  if( modo == FRIO )
    Salida = Salida * ( -1 );
  return Salida;
}

void CalibracionPID( float ReferenciaControl,
                     float* Kp,
                     float* Ki,
                     float* Kd,
                     float* N,
                     float* bias,
                     uint8_t* alert_system_register )
{
  modo_t modo;
  float TemperaturaInicial = read_temperature( alert_system_register );
  float time_value = 0.0;
  uint8_t step_value = 0;
  float input_step_value = 0;
  float temperature_measure = 255;
  int step_time = 2000;
  int sampling_measure = 100;
  int i = 0;
  h_bridge_off();
  modo = definir_modo( TemperaturaInicial, ReferenciaControl );
  PWM_set_modo( 0, modo );
  input_step_value = 0;
  step_time = 4000;
  while( step_time > 0 )
  {
    temperature_measure = read_temperature( alert_system_register );
    usart_transmit( 'c' );
    usart_buffer_transmit( &time_value, sizeof( time_value ) );
    usart_buffer_transmit( &input_step_value, sizeof( input_step_value ) );
    usart_buffer_transmit( &temperature_measure, sizeof( temperature_measure ) );
    _delay_ms( sampling_measure );
    step_time = step_time - 1;
    time_value = time_value + sampling_measure / 1000.00;
  }
  for( i = 0; i < 2; i++ )
  {
    step_time = 4000;
    modo = definir_modo( TemperaturaInicial, ReferenciaControl );
    if( modo == FRIO )
    {
      step_value = SALIDA_MAXIMA_MODO_FRIO;
      modo_frio();
    }
    else
    {
      step_value = SALIDA_MAXIMA_MODO_CALOR;
      modo_calor();
    }
    PWM_set_modo( fabs( step_value ), modo );
    input_step_value = step_value;
    while( step_time > 0 )
    {
      temperature_measure = read_temperature( alert_system_register );
      usart_transmit( 'c' );
      usart_buffer_transmit( &time_value, sizeof( time_value ) );
      usart_buffer_transmit( &input_step_value, sizeof( input_step_value ) );
      usart_buffer_transmit( &temperature_measure, sizeof( temperature_measure ) );
      _delay_ms( sampling_measure );
      step_time = step_time - 1;
      time_value = time_value + sampling_measure / 1000.00;
    }
    h_bridge_off();
    PWM_set_modo( 0, modo );
    input_step_value = 0;
    step_time = 2000;
    while( step_time > 0 )
    {
      temperature_measure = read_temperature( alert_system_register );
      usart_transmit( 'c' );
      usart_buffer_transmit( &time_value, sizeof( time_value ) );
      usart_buffer_transmit( &input_step_value, sizeof( input_step_value ) );
      usart_buffer_transmit( &temperature_measure, sizeof( temperature_measure ) );
      _delay_ms( sampling_measure );
      step_time = step_time - 1;
      time_value = time_value + sampling_measure / 1000.00;
    }
  }
}
