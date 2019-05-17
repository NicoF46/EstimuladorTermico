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
#define PINPWM 6
#define SALIDAMAXIMAMODOCALOR 255
#define SALIDAMINIMAMODOCALOR 0
#define SALIDAMAXIMAMODOFRIO 0
#define SALIDAMINIMAMODOFRIO -255
#define RESISTENCIADIVISORRESISTIVO 10000
#define DELAYVALUE 100
#define TEMPERATURA_MAXIMA 49.0
#define TEMPERATURA_MINIMA -10.0





void setup() {
  Serial.begin(9600);
  while (!Serial) {
  }
  pinMode(LED_BUILTIN, OUTPUT);//Led de control del arduino uno
  pinMode(PINPWM, OUTPUT);
}

void loop() {
  static float TemperaturaTermistor=0;
  static uint8_t ValorPWM=0;
  static modo_t Modo=CALIBRACION;
  static float Kp=7.8;
  static float Ki=0.127*0.6;
  static float Kd=1.959;
  static float TemperaturaReferencia=45;
  static float Realimentacion=0;
  static float TemperaturaAmbiente=25;
  TemperaturaTermistor=SensarTemperatura();
//  TemperaturaTermistor=24;
  if(TemperaturaReferencia<=TemperaturaAmbiente)
    Modo=FRIO;
  else if (TemperaturaReferencia>TemperaturaAmbiente)
    Modo=CALOR;
  Realimentacion = ControladorPID(TemperaturaReferencia,TemperaturaTermistor, Kp, Ki, Kd,0,0,Modo);
  if(Modo==FRIO)
    ValorPWM=Realimentacion*(-1);
  else if (Modo==CALOR)
    ValorPWM=Realimentacion;
  analogWrite(PINPWM,ValorPWM);

  Serial.print('t');
  Serial.write((const char *)&TemperaturaTermistor, sizeof(float));

  Serial.print('p');
  Serial.write((const char *)&ValorPWM, sizeof(uint8_t));



//DEBUG MODO
//    Serial.print(TemperaturaTermistor);
//    Serial.print('\t');
//    Serial.print(TemperaturaReferencia);
//    Serial.print('\t');
//    if(Modo==FRIO)
//      Serial.print("FRIO");
//    if(Modo==CALOR)
//      Serial.print("CALOR");
//    Serial.print('\t');
//    Serial.print(ValorPWM);
//    Serial.print('\n');

  delay(DELAYVALUE);
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
  else if(modo==CALOR){ 
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
  if(SalidaMedida>=TEMPERATURA_MAXIMA && Salida==SalidaMaxima){
    Ik_previo=0;
   }
  else if (SalidaMedida<=TEMPERATURA_MINIMA && Salida==SalidaMinima){
    Ik_previo=0;
   }
  else {Ik_previo=Ik;}

  return Salida;}
  
  
  int funciongenerica(modo_t modo){
    return 0;
  }
