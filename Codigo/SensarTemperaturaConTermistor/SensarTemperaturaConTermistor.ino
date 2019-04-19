//Sensor de temperatura NTC 10K con puente Wheaston
#include <math.h>  
#define PinAdc1 A0
#define PinAdc2 A1
#define ReferenciaAdc 5 //5v
#define MaximoValorAdc 1023
#define R1 9750
#define R2 9770
#define CeroKelvin -273.15
#define T0Termistor 298.15 //kelvin
#define BetaTermistor 4050 //kelvin
#define R0Termistor 10000 //10k
void setup() {
  Serial.begin(9600);
  while (!Serial) {
  }      
  pinMode(LED_BUILTIN, OUTPUT);//Led de control del arduino uno     
}

void loop() {
  static float ValorLeidoAdc1=0;
  static float ValorLeidoAdc2=0;
  static float DiferenciaTension=0;
  static float ResistenciaTermistor=0;
  static float TemperaturaTermistor=0;
  delay(1500);
  ValorLeidoAdc1=analogRead(PinAdc1);
  ValorLeidoAdc2=analogRead(PinAdc2);
  DiferenciaTension=ValorLeidoAdc1-ValorLeidoAdc2;
  DiferenciaTension=DiferenciaTension*ReferenciaAdc/MaximoValorAdc;
  ResistenciaTermistor=R1*(ReferenciaAdc*R2-DiferenciaTension*(R1-R2));
  ResistenciaTermistor=ResistenciaTermistor/(ReferenciaAdc*R1-DiferenciaTension*(R1+R2));
  TemperaturaTermistor=(float(1)/T0Termistor+(float(1)/float(BetaTermistor))*log (ResistenciaTermistor/R0Termistor));
  TemperaturaTermistor=1/TemperaturaTermistor+CeroKelvin;
  
  Serial.print(ValorLeidoAdc1);
  Serial.print("\t");    // prints a tab
  Serial.print(ValorLeidoAdc2);
  Serial.print("\t");    // prints a tab
  Serial.print(DiferenciaTension);
  Serial.print("\t");    // prints a tab
  Serial.print(ResistenciaTermistor);
  Serial.print("\t");    // prints a tab
  Serial.print(TemperaturaTermistor);
  Serial.print("\n");    // prints a tab
  

}
