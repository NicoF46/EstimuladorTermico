#include "funciones.h"
#include "ConfiguracionADC.h"

void apagar(int* TemperaturaReferencia){
/*Pongo en LOW las salidas que controlan el puente H*/
/*PD5 PWM CALOR-PD6 PWM FRIO-PD7 PMOS CALOR-PB0 PMOS FRIO*/
PORTB &= ~(1<<PB0);
PORTD &= ~(1<<PD7);
OCR0B=0;
OCR0A=0;
(*TemperaturaReferencia) = 255;
}

void Pin_SetUp(){
  /*Configuro los pines PD5, PD6, PD7 y PB0 como salidas*/
  DDRB|=(1<<PB0);
  DDRD|=((1<<PD5)|(1<<PD6)|(1<<PD7));
}

float SensarTemperatura(){
    static uint16_t ValorLeidoAdc=0;
    static float ResistenciaTermistor=0;
    static float TemperaturaTermistor=0;
    static float I=0;
    static float VR=0;
    /* Tension sensada*/
    ValorLeidoAdc=ReadADC();
    /* calculos divisor*/
    VR=((float)(ValorLeidoAdc))*REFERENCIAADC/MAXIMOVALORADC;
    I=VR/RESISTENCIADIVISORRESISTIVO;
    ResistenciaTermistor=(5-VR)/I;
    // calculos termistor
    TemperaturaTermistor=((float)(1)/T0TERMISTOR+((float)(1)/(float)(BETATERMISTOR))*log (ResistenciaTermistor/R0TERMISTOR));
    TemperaturaTermistor=((float)1)/TemperaturaTermistor+CEROKELVIN;
    return TemperaturaTermistor;
}


modo_t definir_modo(float Tamb, int Tref){
  if (Tamb > Tref){
    modo_frio();
    return FRIO;
  }
  modo_calor();
  return CALOR;
}

void modo_frio(){
    PORTD&=~(1<<PD7);
    OCR0B=0;
    PORTB|=(1<<PB0);
}

void modo_calor(){
  PORTB&=~(1<<PB0);
  OCR0A=0;
  PORTD|=(1<<PD7);
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
    SalidaMaxima=SALIDAMAXIMAMODOFRIO;
    SalidaMinima=SALIDAMINIMAMODOFRIO;
  }
  else if (modo==CALOR){
    SalidaMaxima=SALIDAMAXIMAMODOCALOR;
    SalidaMinima=SALIDAMINIMAMODOCALOR;
  }

  h= DELAYVALUE*pow(10,-3);// Ts

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

  // Actualizo las variables la proxima iteracion
  SalidaPrevia=SalidaMedida;
  ReferenciaPrevia=ReferenciaControl;
  Dk_previo=Dk;

  // Trunco la salida si se va de rango
  if (Salida>SalidaMaxima){
      Salida=SalidaMaxima;
  }
  else if(Salida <= SalidaMinima){
      Salida=SalidaMinima;
  }

  if(modo==FRIO && Ik<=SalidaMinima)
    Ik_previo=SalidaMinima;
  // Anulo el termino integral si mi sistema satura;
  else if(SalidaMedida>=TEMPERATURA_MAXIMA && Salida==SalidaMaxima){
    Ik_previo=0;
  }
  else if (modo == CALOR && Ik > SalidaMaxima){
    Ik_previo = SalidaMaxima;
  }
  else if (SalidaMedida<=TEMPERATURA_MINIMA && Salida==SalidaMinima){
    Ik_previo=0;
  }
  else {
    Ik_previo=Ik;
  }

  return Salida;
 }
