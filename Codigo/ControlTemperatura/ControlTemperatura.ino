//Sensor de temperatura NTC 10K con divisor resistivo
#include <math.h>

#define PinAdc1 A0
#define PinAdc2 A1
#define ReferenciaAdc 5 //5v
#define MaximoValorAdc 1023
#define R1 9750
#define R2 9770
#define CeroKelvin -273.15
#define T0Termistor 298.15 //kelvin
#define BetaTermistor 3982 //kelvin
#define R0Termistor 10000 //10k
#define PinPwm 6
#define SalidaMaxima 0
#define SalidaMinima -255
#define ResistenciaDivisorResistivo 10000
#define DelayValue 100


void setup() {
  Serial.begin(9600);
  while (!Serial) {
  }
  pinMode(LED_BUILTIN, OUTPUT);//Led de control del arduino uno
  pinMode(PinPwm, OUTPUT);
}

void loop() {
  static float TemperaturaTermistor=0;
  static uint8_t ValorPWM=0;

  static float Kp=7.559;
  static float Ki=0.127;
  static float Kd=1.959;
  static float TemperaturaReferencia=10;
  static float SignoRealimentacion=0;

  TemperaturaTermistor=SensarTemperatura();

  SignoRealimentacion = ControladorPID(TemperaturaReferencia,TemperaturaTermistor, Kp, Ki, Kd,20,0);
  ValorPWM=SignoRealimentacion*(-1);
  analogWrite(PinPwm,ValorPWM);
  // analogWrite(PinPwm,255);

  Serial.print('t');
  Serial.write((const char *)&TemperaturaTermistor, sizeof(float));

  Serial.print('p');
  Serial.write((const char *)&ValorPWM, sizeof(uint8_t));

  delay(DelayValue);
}

float SensarTemperatura(){
  static float ValorLeidoAdc2=0;
  static float ResistenciaTermistor=0;
  static float TemperaturaTermistor=0;
  static float I=0;
  static float VR=0;

  // Tension sensada
  ValorLeidoAdc2=analogRead(PinAdc2);

  // calculos divisor
  VR=float(ValorLeidoAdc2)*ReferenciaAdc/MaximoValorAdc;
  I=VR/ResistenciaDivisorResistivo;
  ResistenciaTermistor=(5-VR)/I;

  // calculos termistor
  TemperaturaTermistor=(float(1)/T0Termistor+(float(1)/float(BetaTermistor))*log (ResistenciaTermistor/R0Termistor));
  TemperaturaTermistor=1/TemperaturaTermistor+CeroKelvin;
  return TemperaturaTermistor;
}


uint8_t ControladorPID(float ReferenciaControl,float SalidaMedida, float Kp, float Ki, float Kd,float N,float bias){
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

  h= (float(DelayValue)*pow(10,-3));// Ts

  if (!N){
     N=1;
         }
  gamma=Kd/N;

  // factor proporcional
  Pk= Kp*(ReferenciaControl-SalidaMedida);

  // factor ingtegral
  Ik = Ik_previo+Ki*Kp*h*(ReferenciaPrevia-SalidaPrevia);

  // factor derivativo
  Dk =gamma/(gamma+h)*Dk_previo-Kp*Kd/(gamma+h)*(SalidaMedida-SalidaPrevia);

  // Emito la salida
  if(Kp!=0)
    Salida  = Ik + Dk + Pk +bias;
  if(ReferenciaControl==0){
    Salida=0;
    Ik=0;}
  // Actualizo las variables la proxima iteracion
  SalidaPrevia=SalidaMedida;
  ReferenciaPrevia=ReferenciaControl;
  Dk_previo=Dk;

  // Trunco la salida si se va de rango
  if (Salida>SalidaMaxima){
      Salida=SalidaMaxima;
      Ik_previo=0;}
  else if(Salida <= SalidaMinima){
      Salida=SalidaMinima;
      Ik_previo=0;}
  else {Ik_previo=Ik;}

  return Salida;}
