#include "funciones.h"
#include "ConfiguracionADC.h"
#include "power_board.h"

uint8_t ControladorPID( float ReferenciaControl,
                        float SalidaMedida,
                        float Kp,
                        float Ki,
                        float Kd,
                        float N,
                        float bias )
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

  power_board_mode_t modo = power_board_mode_get();

  if( modo == MODE_COLD )
  {
    SalidaMaxima = SALIDA_MAXIMA_MODO_FRIO;
    SalidaMinima = SALIDA_MINIMA_MODO_FRIO;
  }
  else if( modo == MODE_HOT )
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

  if( modo == MODE_COLD && Ik <= SalidaMinima )
    Ik_previo = SalidaMinima;
  // Anulo el termino integral si mi sistema satura;
  else if( SalidaMedida >= TEMPERATURA_MAXIMA && Salida == SalidaMaxima )
  {
    Ik_previo = 0;
  }
  else if( modo == MODE_HOT && Ik > SalidaMaxima )
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

  if( modo == MODE_COLD )
    Salida = Salida * ( -1 );
  return Salida;
}
