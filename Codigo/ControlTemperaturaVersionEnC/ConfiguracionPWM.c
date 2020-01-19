/*Configuro el pwm de frio y calor para operar en modo Fast PWM a 62,5kHz*/
#include <avr/io.h>
#include "ConfiguracionPWM.h"

void PWM_configuration_init(){

  DDRD |= ((1 << DDD5)|(1 << DDD6));
  DDRB |= (1 << DDB1)|(1 << DDB2);
  ICR1 = 0x00FF;
  OCR1A = 0;
  OCR1B = 0;
  TCCR1A |= (1 << COM1A1)|(1 << COM1B1);
  TCCR1A |= (1 << WGM11);
  TCCR1B |= (1 << WGM12)|(1 << WGM13);
  TCCR1B |= (1 << CS10);
}

void PWM_set_modo(uint8_t ValorPWM, modo_t modo){
  if(modo==FRIO)
    OCR1A=ValorPWM;
  else if(modo==CALOR)
    OCR1B=ValorPWM;
}
