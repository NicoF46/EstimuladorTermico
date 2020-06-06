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

float read_temperature(){
    float temperature_thermistor_1 = 0;
    float temperature_thermistor_2 = 0;

    temperature_thermistor_1 = calculate_temperature(THERMISTOR_1_ADC_CHANNEL);
    temperature_thermistor_2 = calculate_temperature(THERMISTOR_2_ADC_CHANNEL);
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
    modo_frio();
    return FRIO;
  }
  modo_calor();
  return CALOR;
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
  float Salida=0;
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

  h= DELAY_VALUE*pow(10,-3);// Ts

  if (!N){
     N=1;
  }
  gamma=Kd/N;

  Pk= Kp*(ReferenciaControl-SalidaMedida);
  Ik = Ik_previo+Ki*Kp*h*(ReferenciaPrevia-SalidaPrevia);
  Dk =gamma/(gamma+h)*Dk_previo-Kp*Kd/(gamma+h)*(SalidaMedida-SalidaPrevia);

  // Emito la salida
  if(Kp!=0)
    Salida  = Ik + Dk + Pk +bias;

  if(modo==FRIO)
    Salida=Salida*(-1);
  // Actualizo las variables la proxima iteracion
  SalidaPrevia=SalidaMedida;
  ReferenciaPrevia=ReferenciaControl;
  Dk_previo=Dk;

  // Trunco la salida si se va de rango
  if (Salida>SalidaMaxima){
      Salida=SalidaMaxima;
  }
  else if(Salida < SalidaMinima){
      Salida=SalidaMinima;
  }

  if(Salida==SalidaMaxima && Ik>=SalidaMaxima)
    Ik_previo=SalidaMaxima;
  else if (Salida==SalidaMinima && Ik<=SalidaMinima)
    Ik_previo=SalidaMinima;
  else {
    Ik_previo=Ik;
  }

  return Salida;
 }

 void CalibracionPID(float ReferenciaControl,float* Kp,float* Ki,float* Kd,float* N,float* bias){
  modo_t modo;
  float TemperaturaInicial = read_temperature();
  float temperature_now = 255;
  float temperature_before = 0;
  float TiempoDelay = 0;
  float TiempoTotalTau = 0;
  uint8_t ValorEscalon = 0;
  unsigned int iterator = 0;
  float temperature_record[TEMPERATURE_RECORD_SIZE];
  unsigned int delay_counter = 0;

  modo = definir_modo(TemperaturaInicial,ReferenciaControl);
  if (modo == FRIO){
    ValorEscalon = SALIDA_MAXIMA_MODO_FRIO;
    modo_frio();
}
  else{
    ValorEscalon = SALIDA_MAXIMA_MODO_CALOR;
    modo_calor();}
  PWM_set_modo(fabs(ValorEscalon),modo);

  while((fabs((temperature_now=read_temperature())-temperature_before)>STEADY_STATE_TOLERANCE) || (fabs(temperature_now-TemperaturaInicial))<TEMPERATURE_DELAY_TOLERANCE || iterator<100){
    temperature_record[iterator] = temperature_now;
    if((fabs(temperature_now-TemperaturaInicial)/TemperaturaInicial)>TOLERANCIA_DELAY && delay_counter==0)
        delay_counter = iterator;
    iterator = iterator + 1;
    temperature_before = temperature_now;
    _delay_ms(500);
    usart_transmit('t');
    usart_Buffer_transmit(&temperature_now, sizeof(temperature_now));
  }

  TiempoDelay=delay_counter*0.5;
  TiempoTotalTau=(iterator+1)*0.5/5;
  h_bridge_off();
  (*Kp)=1.2*TiempoTotalTau/TiempoDelay*(ValorEscalon*12/255)/(fabs(TemperaturaInicial-temperature_now));
  (*Ki)=2*TiempoDelay*0.001;
  (*Kd)=0.5*TiempoDelay*0.001;

  usart_transmit('c');
  usart_Buffer_transmit(Kp, sizeof(*Kp));
  usart_Buffer_transmit(Ki, sizeof(*Ki));
  usart_Buffer_transmit(Kd, sizeof(*Kd));
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

void desactivate_equipment(){
  /*funcion para desactivar el equipo ante una falla*/
}
