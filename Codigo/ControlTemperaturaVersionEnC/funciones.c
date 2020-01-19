#include "funciones.h"
#include "ConfiguracionADC.h"


/** Pongo en LOW las salidas que controlan el puente H
 *  PB2 PWM CALOR-PB1 PWM FRIO-PD6 PMOS CALOR-PD5 PMOS FRIO
 */
void h_bridge_off(){
  PORTD &= ~(1<<PD5);
  PORTD &= ~(1<<PD6);
  OCR1B=0;
  OCR1A=0;
}

void h_bridge_setup(){
  /*Configuro los pines PD5, PD6, PB1 y PB2 como salidas, estas corresponden puente H*/
  /*Configuro los leds de control como salidas PD*/
  DDRB |= ((1<<PB1)|(1<<PB2));
  DDRD |= ((1<<PD5)|(1<<PD6));
}

void leds_setup()
{
  DDRD |= (1<<PD2)|(1<<PD3)|(1<<PD4);
  PORTD &= ~(1<<PD2);
  PORTD &= ~(1<<PD3);
  PORTD &= ~(1<<PD4);
}

float SensarTemperaturaDivisor(){
  static uint16_t ValorLeidoAdc=0;
  static float ResistenciaTermistor=0;
  static float TemperaturaTermistor=0;

  /* Tension sensada*/
  ADMUX &=~(1<<MUX0);
  ADMUX &=~(1<<MUX1);
  ADMUX |= (1<<MUX2);
  ValorLeidoAdc=ReadADC();
  /* calculos divisor*/
  float Vpote = ValorLeidoAdc * 5.0 / 1024.0;
  return Vpote;

  ResistenciaTermistor= (5.0-Vpote)/(4.0*Vpote/100000.0);
  // calculos termistor
  TemperaturaTermistor=(UNOSOBRET0TERMISTOR+(UNOSOBREBETA0)*log(ResistenciaTermistor/R0TERMISTOR));
  TemperaturaTermistor=(1.0)/TemperaturaTermistor+CEROKELVIN;
  return TemperaturaTermistor;  
}

float SensarTemperaturaSuperficial(){
    static uint16_t ValorLeidoAdc=0;
    static float ResistenciaTermistor=0;
    static float TemperaturaTermistor=0;
    static float Vout=0;
    /* Tension sensada*/
    ADMUX &=~(1<<MUX0);
    ADMUX |= (1<<MUX1);
    ValorLeidoAdc=ReadADC();
    /* calculos divisor*/
    Vout=((float)(ValorLeidoAdc))*REFERENCIAADC/MAXIMOVALORADC;
    ResistenciaTermistor=TENSION_REFERENCIA_OPAMPS*RESISTENCIA_R3/Vout*(1+RESISTENCIA_R4/RESISTENCIA_R5)-RESISTENCIA_R3;
    ResistenciaTermistor=ResistenciaTermistor/CANTIDAD_TERMISTORES_SUPERFICIALES;
    // calculos termistor
    TemperaturaTermistor=(UNOSOBRET0TERMISTOR+(UNOSOBREBETA0)*log (ResistenciaTermistor/R0TERMISTOR));
    TemperaturaTermistor=((float)1)/TemperaturaTermistor+CEROKELVIN;
    return TemperaturaTermistor;
}

float SensarTemperaturaPuntual(){
    static uint16_t ValorLeidoAdc=0;
    static float ResistenciaTermistor=0;
    static float TemperaturaTermistor=0;
    static float Vout=0;
    /* Tension sensada*/
    ADMUX &=~(1<<MUX1);
    ADMUX |= (1<<MUX0);
    ValorLeidoAdc=ReadADC();
    /* calculos divisor*/
    Vout = ValorLeidoAdc * REFERENCIAADC / MAXIMOVALORADC;
    ResistenciaTermistor = TENSION_REFERENCIA_OPAMPS / Vout * ( RESISTENCIA_R7/(RESISTENCIA_R7+RESISTENCIA_R6) )*RESISTENCIA_R8*(1.0+RESISTENCIA_R10/RESISTENCIA_R9)-RESISTENCIA_R8;
    // calculos termistor
    TemperaturaTermistor = (UNOSOBRET0TERMISTOR+(UNOSOBREBETA0)*log(ResistenciaTermistor/R0TERMISTOR));
    TemperaturaTermistor = 1.0 / TemperaturaTermistor + CEROKELVIN;
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
    PORTD &= ~(1<<PD6);
    OCR1B = 0;
    _delay_ms(10);
    PORTD|=(1<<PD5);
}

void modo_calor(){
  PORTD&=~(1<<PD5);
  OCR1A=0;
  _delay_ms(10);
  PORTD|=(1<<PD6);
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
   /*Para la calibracion genero un escalon correspondiente a la temperatura deseada
   Para esto necesito relacionar la corriente en el peltier con la diferencia de temperatura que necesito*/
   float TablaPWMvsDiffTemperatura[CANTIDAD_COMBINACIONES_PWM_DIFFTEMP][2]={{-255,-20},
                    {255,50}
                  };
  modo_t modo;
  float TemperaturaInicial=SensarTemperaturaPuntual();
  float TiempoDelay=0;
  float TiempoTotalTau=0;
  float DiferenciaTemperatura=(-1)*(TemperaturaInicial-ReferenciaControl);
  float ContadorCicloDelayMs=0;
  float ContadorCicloExpMs=0;


  /*En base al diferencial busco en la tabla el pwm que necesito*/
  float ValorPWM=BuscarPWMRequerido(TablaPWMvsDiffTemperatura,CANTIDAD_COMBINACIONES_PWM_DIFFTEMP,DiferenciaTemperatura);
  /*Genero un escalon en el controlador segun el modo*/
  modo=definir_modo(TemperaturaInicial,ReferenciaControl);
  PWM_set_modo(fabs(ValorPWM),modo);
  /*Marco el tiempo de inicio*/
  while(fabs((TemperaturaInicial-SensarTemperaturaPuntual())/TemperaturaInicial)<TOLERANCIA_DELAY){
    _delay_ms(10);
    ContadorCicloDelayMs++;}
    int temp=0;
    if(modo==FRIO){
      while((temp=SensarTemperaturaPuntual())>(TemperaturaInicial+TAU*(ReferenciaControl-TemperaturaInicial))){
        _delay_ms(10);
        ContadorCicloExpMs++;
        }}
    else{
      while(SensarTemperaturaPuntual()<(TemperaturaInicial+TAU*(ReferenciaControl-TemperaturaInicial))){
        _delay_ms(10);
        ContadorCicloExpMs++;}}

  TiempoDelay=ContadorCicloDelayMs*10;
  TiempoTotalTau=ContadorCicloExpMs*10;
  h_bridge_off();
  (*Kp)=1.2*TiempoTotalTau/TiempoDelay;
  (*Ki)=0.5/(TiempoTotalTau*0.001);
  (*Kp)=0.5*TiempoTotalTau*0.001;
  }

float BuscarPWMRequerido(float TablaPWMvsDiffTemperatura[][2],int CantidadCombinaciones,float DiferenciaTemperatura){
  int i=0;
  float DistanciaMinima=100;
  float PWMRequerido=0;
  for (i=0;i<CantidadCombinaciones;i++){
    if(fabs(DiferenciaTemperatura-TablaPWMvsDiffTemperatura[i][1])<DistanciaMinima){
      DistanciaMinima=fabs(DiferenciaTemperatura-TablaPWMvsDiffTemperatura[i][1]);
      PWMRequerido=TablaPWMvsDiffTemperatura[i][0];
      }
  }
  return PWMRequerido;
  }

void ApagarLedsIndicacion(){
  PORTD &= ~((1<<PD2)|(1<<PD3)|(1<<PD4));
}
