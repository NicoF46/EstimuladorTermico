#include "funciones.h"
#include "ConfiguracionADC.h"

void h_bridge_off(){
  PORTD &= ~(1<<PD5);
  PORTD &= ~(1<<PD6);
  DDRB &= ~((1<<PB1)|(1<<PB2));
  OCR1B=0;
  OCR1A=0;
}

void h_bridge_setup(){
  DDRD |= ((1<<PD5)|(1<<PD6));
}

void leds_setup()
{
  DDRD |= (1<<PD7);
  DDRC |= ((1<<PC3)|(1<<PC2));
  DDRB |= (1<<PB0);
  PORTD &= ~(1<<PD7);
  PORTC &= ~(1<<PC3);
  PORTC &= ~(1<<PC2);
  PORTB &= ~(1<<PB0);
}

float read_temperature(uint8_t* alert_system_register){
    float temperature_thermistor_1 = 0;
    float temperature_thermistor_2 = 0;

    temperature_thermistor_1 = calculate_temperature(THERMISTOR_1_ADC_CHANNEL);
    temperature_thermistor_2 = calculate_temperature(THERMISTOR_2_ADC_CHANNEL);
    if (fabs(temperature_thermistor_1-temperature_thermistor_2) > TEMPERATURE_DIFFERENCE_TOLERANCE)
      (*alert_system_register) = ERROR_TEMPERATURE_DIFFERENCE;
    return (temperature_thermistor_1+temperature_thermistor_2)/2.0;
}

float calculate_temperature(uint8_t adc_channel){
  float v_out = 0;
  float thermistor_resistance = 0;
  float thermistor_temperature = 0;
  uint16_t adc_read_value = 0;

  adc_select_channel(adc_channel);
  adc_read_value=ReadADC();
  v_out = ((float)(adc_read_value))*REFERENCIAADC/MAXIMOVALORADC;
  thermistor_resistance = (REFERENCIAADC-v_out)/(v_out/R0TERMISTOR);
  thermistor_temperature = (UNOSOBRET0TERMISTOR+(UNOSOBREBETA0)*log (thermistor_resistance/(float)R0TERMISTOR));
  thermistor_temperature = ((float)1)/thermistor_temperature+CEROKELVIN;
  return thermistor_temperature;
}

modo_t definir_modo(float Tamb, float Tref){
  if (Tamb > Tref){
    return FRIO;
  }
  return CALOR;
}

void set_modo(modo_t modo){
  if (modo == FRIO)
    modo_frio();
  else if (modo == CALOR)
    modo_calor();
}

void modo_frio(){
    PORTD &= ~(1<<PD6);
    OCR1A = 0;
    DDRB &= ~(1<<PB1);
    _delay_ms(10);
    PORTD |= (1<<PD5);
    DDRB |= (1<<PB2);
}

void modo_calor(){
  PORTD&=~(1<<PD5);
  OCR1B=0;
  DDRB &= ~(1<<PB2);
  _delay_ms(10);
  PORTD |= (1<<PD6);
  DDRB |= (1<<PB1);
}

uint8_t ControladorPID(float ReferenciaControl,float SalidaMedida, float Kp, float Ki, float Kd,float N,float bias,modo_t modo){
  // Creo que las variables que necesito almacenar la proxima iteracion
  static float SalidaPrevia=0;
  static float ReferenciaPrevia=0;
  static float Ik_previo=0;
  static float Dk_previo=0;
  float Pk=0;
  float Ik=0;
  float Dk=0;
  float Salida;
  float gamma;
  float  h;
  float SalidaMaxima=0;
  float SalidaMinima=0;

  if(modo==FRIO){
    SalidaMaxima=SALIDA_MAXIMA_MODO_FRIO;
    SalidaMinima=SALIDA_MINIMA_MODO_FRIO;
  }
  else if (modo==CALOR){
    SalidaMaxima=SALIDA_MAXIMA_MODO_CALOR;
    SalidaMinima=SALIDA_MINIMA_MODO_CALOR;
  }

  h= ((DELAY_VALUE)*pow(10,-3));

  if (!N){
     N=1;
  }
  gamma=Kd/N;

  Pk= Kp*(ReferenciaControl-SalidaMedida);
  Ik = Ik_previo+Ki*Kp*h*(ReferenciaPrevia-SalidaPrevia);
  Dk =gamma/(gamma+h)*Dk_previo-Kp*Kd/(gamma+h)*(SalidaMedida-SalidaPrevia);

  // Emito la salida
  Salida  = Ik + Dk + Pk +bias;

  // Actualizo las variables la proxima iteracion
  SalidaPrevia=SalidaMedida;
  ReferenciaPrevia=ReferenciaControl;
  Dk_previo=Dk;

  // Trunco la salida si se va de rango
  if (Salida>SalidaMaxima)
    Salida=SalidaMaxima;
  
  else if(Salida <= SalidaMinima)
    Salida=SalidaMinima;

  if(Salida<= SalidaMinima && Ik<=SalidaMinima)
    Ik_previo=SalidaMinima;

  else if (Salida>= SalidaMaxima && Ik > SalidaMaxima)
    Ik_previo = SalidaMaxima;
  
  else 
    Ik_previo=Ik;
  

  if (modo == FRIO)
    Salida = Salida*(-1);

  usart_transmit('g');
  usart_Buffer_transmit(&Pk, sizeof((Pk)));
  usart_Buffer_transmit(&Ik, sizeof((Ik)));
  usart_Buffer_transmit(&Dk, sizeof((Dk)));
  return Salida;
}

void CalibracionPID(float control_reference,float* Kp,float* Ki,float* Kd,float* N,float* bias,uint8_t* alert_system_register ){
  modo_t modo;
  float initial_temperature = read_temperature(alert_system_register);
  float time_value = 0.0;
  uint8_t step_value = 0;
  float temperature_measure = 255;
  int step_time = 0;
  int sampling_measure = 100;
  float delay_time = 0;
  float temperature_difference = 0;
  float tau_time = 0;
  float final_temperature = 0;
  float ziegler_rules[3][3] = {{1.1, 2, 0.5}, {0.53, 4, 0.8},{0.32, 4, 0.8} };;

  h_bridge_off();
  modo = definir_modo(initial_temperature,control_reference);
  step_value = select_step_value(modo);
  step_time = 0;
  set_modo(modo);
  PWM_set_modo(step_value,modo);
    while(step_time <= CALIBRATION_STEP_TIME){
      temperature_measure = read_temperature(alert_system_register);
      send_temperature(temperature_measure);
      if ((fabs(temperature_measure-initial_temperature)>TOLERANCIA_DELAY)&& delay_time==0)
        delay_time = time_value;
      _delay_ms(sampling_measure);
      step_time = step_time + 1;
      time_value = time_value + sampling_measure/1000.00 ;
    }
  h_bridge_off();
  final_temperature = temperature_measure;
  temperature_difference = final_temperature-initial_temperature;
  while(fabs(temperature_measure-initial_temperature)>CALIBRATION_RETURN_TOLERANCE){
      send_temperature(temperature_measure);
      _delay_ms(sampling_measure);
      temperature_measure = read_temperature(alert_system_register);
  }
  set_modo(modo);
  PWM_set_modo(step_value,modo);
  step_time = 0;
  time_value = 0;
  while(step_time <= CALIBRATION_STEP_TIME && tau_time == 0){
    temperature_measure = read_temperature(alert_system_register);
    send_temperature(temperature_measure);
    if (fabs(temperature_measure-(initial_temperature+temperature_difference*TAU))<TAU_TEMPERATURE_TOLERANCE)
      tau_time = time_value + sampling_measure/1000.00;
    _delay_ms(sampling_measure);
    step_time = step_time + 1;
    time_value = time_value + sampling_measure/1000.00;
  }
  h_bridge_off();
  (*Kp) = ziegler_rules[ZIEGLER_RULE-1][0]*tau_time/(fabs((temperature_difference)/step_value))/delay_time*fabs((initial_temperature-control_reference)/temperature_difference);
  (*Ki) = 1 /(ziegler_rules[ZIEGLER_RULE-1][1] * delay_time)/2;
  (*Kd) = ziegler_rules[ZIEGLER_RULE-1][2]* delay_time;
  h_bridge_off();
  usart_transmit('h');
  usart_Buffer_transmit(&tau_time, sizeof(tau_time));
  usart_Buffer_transmit(&temperature_difference, sizeof(temperature_difference));
  usart_Buffer_transmit(&delay_time, sizeof(delay_time));
  usart_Buffer_transmit(Kp, sizeof((*Kp)));
  usart_Buffer_transmit(Ki, sizeof((*Ki)));
  usart_Buffer_transmit(Kd, sizeof((*Kd)));

 }

 uint8_t select_step_value(modo_t modo){
   if (modo == FRIO)
     return SALIDA_MINIMA_MODO_FRIO*(-1);
   else
     return SALIDA_MAXIMA_MODO_CALOR;
 }

void ApagarLedsIndicacion(){
  PORTD &= ~((1<<PD7)|(1<<PB0)|(1<<PC3)|(1<<PC2));
}

void buzzer_configuration_init(){
  DDRB |= (1 << PB3);
}

void emergency_buzzer_signal_on(){
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(100);
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(100);
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(300);
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(100);
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(500);
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(100);
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(100);
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(300);
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(100);
  PORTB |= (1 << PB3);
  _delay_ms(200);
  PORTB &= ~(1 << PB3);
  _delay_ms(2500);
}


void normal_operation_led_on(){
  PORTC |= (1<<PC2);
}

void normal_operation_led_off(){
  PORTC &= ~(1 << PC3);
}

void emergency_led_on(){
  PORTC |= (1<<PC2);
}

void emergency_led_off(){
  PORTC &= ~(1 << PC3);
}

void send_failure_signals(){
  int i=0;
  normal_operation_led_off();
  emergency_led_on();
  for (i=0;i<BUZZER_SIGNAL_CYCLES;i++){
    emergency_buzzer_signal_on();
  }
}
void send_temperature(float temperature_measure){
  usart_transmit('t');
  usart_Buffer_transmit(&temperature_measure, sizeof(temperature_measure));
}
void desactivate_equipment(){
  /*funcion para desactivar el equipo ante una falla*/
  while( 1 ){};
}
