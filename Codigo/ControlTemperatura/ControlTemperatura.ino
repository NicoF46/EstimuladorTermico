//Sensor de temperatura NTC 10K con divisor resistivo
#include <math.h>
#include "modo.h"
#define PINADC2 A1
#define REFERENCIAADC 5 //5v
#define MAXIMOVALORADC 1023
#define R1 9750
#define R2 9770
#define CEROKELVIN -273.15
#define T0TERMISTOR 298.15 //kelvin
#define BETATERMISTOR 3982 //kelvin
#define R0TERMISTOR 10000 //10k
#define CANTIDAD_COMBINACIONES_PWM_DIFFTEMP 5
#define TOLERANCIA_DELAY 0.5
#define TAU 0.63
#define SALIDAMAXIMAMODOCALOR 255
#define SALIDAMINIMAMODOCALOR 0
#define SALIDAMAXIMAMODOFRIO 0
#define SALIDAMINIMAMODOFRIO -255

#define RESISTENCIADIVISORRESISTIVO 10000
#define DELAYVALUE 100
#define TEMPERATURA_MAXIMA 49.0
#define TEMPERATURA_MINIMA -10.0

#define PINPWM_FRIO 6
#define PIN_PMOS_FRIO 8

#define PINPWM_CALOR 5
#define PIN_PMOS_CALOR 7

volatile int TemperaturaReferencia = 255;


void setup() {
  Serial.begin(9600);
  while (!Serial) {
  }
  pinMode(LED_BUILTIN, OUTPUT);//Led de control del arduino uno
  pinMode(PINPWM_FRIO, OUTPUT);
  pinMode(PINPWM_CALOR, OUTPUT);
  pinMode(PIN_PMOS_CALOR, OUTPUT);
  pinMode(PIN_PMOS_FRIO, OUTPUT);
  apagar();
}

void apagar(){
  digitalWrite(PINPWM_FRIO, LOW);
  digitalWrite(PINPWM_CALOR, LOW);
  digitalWrite(PIN_PMOS_CALOR, LOW);
  digitalWrite(PIN_PMOS_FRIO, LOW);
  TemperaturaReferencia = 255;
}



void loop() {
  
  static float TemperaturaTermistor=0;
  static modo_t modo = CALIBRACION;
  static uint8_t ValorPWM=0;
  
  static float Kp = 7.8*1.1;
  static float Ki = 0.127;
  static float Kd = 1.959;
  static float bias = 0;
  static float N=10;
  
  static float Realimentacion=0;
  static float TemperaturaAmbiente=SensarTemperatura();
  static int pin_pwm = 0;

  CalibracionPID(5,&Kp, &Ki,& Kd,&N,& bias);

  TemperaturaTermistor = SensarTemperatura();
  Serial.print('t');
  Serial.write((const char *)&TemperaturaTermistor , sizeof(float));


  delay(DELAYVALUE);


  if (TemperaturaReferencia != 255){
    modo = definir_modo(TemperaturaAmbiente, TemperaturaReferencia);

    TemperaturaTermistor = SensarTemperatura(); 
    Realimentacion = ControladorPID(TemperaturaReferencia,TemperaturaTermistor, Kp, Ki, Kd,0,0,modo);
    if(modo == FRIO){
      ValorPWM=Realimentacion*(-1);
      pin_pwm = PINPWM_FRIO;
    }
    else if (modo == CALOR){
      ValorPWM=Realimentacion;
      pin_pwm = PINPWM_CALOR;
    }
         
    analogWrite(pin_pwm,ValorPWM);

    Serial.print('p');
    Serial.write((const char *)&ValorPWM, sizeof(uint8_t));
  }
  
}



void serialEvent(){
  while (Serial.available() > 0){
    
    char modo = Serial.read();
    switch(modo){
      case('r'):
        TemperaturaReferencia = Serial.read();
        break;
      case('s'):
        apagar();
        break;
    }
  }
  
  Serial.print('x');
  Serial.write((const char *)&TemperaturaReferencia, sizeof(int));
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
    digitalWrite(PIN_PMOS_CALOR, LOW);
    digitalWrite(PINPWM_CALOR, LOW);
    
    digitalWrite(PIN_PMOS_FRIO, HIGH);
}



void modo_calor(){
  digitalWrite(PIN_PMOS_FRIO, LOW);
  digitalWrite(PINPWM_FRIO, LOW);
  
  digitalWrite(PIN_PMOS_CALOR, HIGH);
}



float TemperaturaTriangular(float temp_min, float temp_max){
  static modo_t modo = FRIO;
  
  if (modo == FRIO){
    if(SensarTemperatura() <= temp_min){
      modo = CALOR;
      return temp_max;
    }
    return temp_min;
  }
  
  if (modo == CALOR){
    if(SensarTemperatura() >= temp_max){
      modo = FRIO;
      return temp_min;
    }
    return temp_max;
  }
}



float SensarTemperatura(){
  static float ValorLeidoAdc2=0;
  static float ResistenciaTermistor=0;
  static float TemperaturaTermistor=0;
  static float I=0;
  static float VR=0;

  // Tension sensada
  ValorLeidoAdc2=analogRead(PINADC2);

  // calculos divisor
  VR=float(ValorLeidoAdc2)*REFERENCIAADC/MAXIMOVALORADC;
  I=VR/RESISTENCIADIVISORRESISTIVO;
  ResistenciaTermistor=(5-VR)/I;

  // calculos termistor
  TemperaturaTermistor=(float(1)/T0TERMISTOR+(float(1)/float(BETATERMISTOR))*log (ResistenciaTermistor/R0TERMISTOR));
  TemperaturaTermistor=1/TemperaturaTermistor+CEROKELVIN;
  return TemperaturaTermistor;
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
    SalidaMaxima=SALIDAMAXIMAMODOFRIO;
    SalidaMinima=SALIDAMINIMAMODOFRIO;
  }
  else if (modo==CALOR){ 
    SalidaMaxima=SALIDAMAXIMAMODOCALOR;
    SalidaMinima=SALIDAMINIMAMODOCALOR;
  }               
    
  h= (float(DELAYVALUE)*pow(10,-3));// Ts

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


 void CalibracionPID(float ReferenciaControl,float* Kp,float* Ki,float* Kd,float* N,float* bias){
   /*Para la calibracion genero un escalon correspondiente a la temperatura deseada
   Para esto necesito relacionar la corriente en el peltier con la diferencia de temperatura que necesito*/
   float TablaPWMvsDiffTemperatura[CANTIDAD_COMBINACIONES_PWM_DIFFTEMP][2]={{-255,-7.5},
                    {-220, -4},
                    {-175,3},
                    {-152,5},
                    {255,50}
                  };
  modo_t modo;
  int pin_pwm = 0;
  float TemperaturaInicial=SensarTemperatura();
  float TiempoDelay=0;
  float TiempoTotalTau=0;
  float DiferenciaTemperatura=TemperaturaInicial-ReferenciaControl;
  float ContadorCicloDelayMs=0;
  float ContadorCicloExpMs=0;
  /*En base al diferencial busco en la tabla el pwm que necesito*/
  float ValorPWM=BuscarPWMRequerido(TablaPWMvsDiffTemperatura,CANTIDAD_COMBINACIONES_PWM_DIFFTEMP,DiferenciaTemperatura);
  /*Genero un escalon en el controlador segun el modo*/
  modo=definir_modo(TemperaturaInicial,ReferenciaControl);

  if(modo == FRIO){
      pin_pwm = PINPWM_FRIO;
    }
  else if (modo == CALOR){
      pin_pwm = PINPWM_CALOR;
    }      
    analogWrite(pin_pwm,ValorPWM);

  
  /*Marco el tiempo de inicio*/
  while(fabs(TemperaturaInicial-SensarTemperatura())<TOLERANCIA_DELAY){
    _delay_ms(10);
    ContadorCicloDelayMs++;}
    int temp=0;
    if(modo==FRIO){
      while((temp=SensarTemperatura())>(TemperaturaInicial+TAU*(ReferenciaControl-TemperaturaInicial))){
        _delay_ms(10);
        ContadorCicloExpMs++;
        }}
    else{
      while(SensarTemperatura()<(TemperaturaInicial+TAU*(ReferenciaControl-TemperaturaInicial))){
        _delay_ms(10);
        ContadorCicloExpMs++;}}

  TiempoDelay=ContadorCicloDelayMs*10;
  TiempoTotalTau=ContadorCicloExpMs*10;
  digitalWrite(PINPWM_FRIO, LOW);
  digitalWrite(PINPWM_CALOR, LOW);
  digitalWrite(PIN_PMOS_CALOR, LOW);
  digitalWrite(PIN_PMOS_FRIO, LOW);
  (*Kp)=1.2*TiempoTotalTau/TiempoDelay;
  (*Ki)=0.5/TiempoTotalTau;
  (*Kp)=0.5*TiempoTotalTau;
 }

float BuscarPWMRequerido(float TablaPWMvsDiffTemperatura[][2],int CantidadCombinaciones,float DiferenciaTemperatura){
  int i=0;
  float DistanciaMinima=DiferenciaTemperatura;
  float PWMRequerido=0;
  for (i=0;i<CantidadCombinaciones;i++){
    if(fabs(DiferenciaTemperatura-TablaPWMvsDiffTemperatura[i][1])<DistanciaMinima){
      DistanciaMinima=fabs(DiferenciaTemperatura-TablaPWMvsDiffTemperatura[i][1]);
      PWMRequerido=TablaPWMvsDiffTemperatura[i][0];}
  }
  return PWMRequerido;
  }



  
