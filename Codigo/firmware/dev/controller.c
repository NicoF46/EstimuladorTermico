#include "controller.h"
#include "power_board.h"
#include "app_utils.h"
#include "status.h"
#include "temperature.h"

#include <math.h>
#include <stdint.h>
#include <avr/interrupt.h>
#include <stdbool.h>

/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

#define DELAY 300
#define PWM_HOT_MAX 128
#define PWM_HOT_MIN 0
#define PWM_COLD_MAX 0
#define PWM_COLD_MIN -255

static float Kp = 20;
static float Ki = 0.04;
static float Kd = 2;
static float n = 1;
static float bias = 0;
static float Pk = 0;
static float Dk = 0;
static float Ik = 0;
static float previous_ref = 0;
static float previous_input = 0;

/* ----------------------------------------------------------------------------
  Internal function Prototypes
------------------------------------------------------------------------------*/

static float _pid( const float ref, const float input );

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

void controller_loop()
{
  sei();
  float temp;

  while( true )
  {
    if( status_get() == COLD || status_get() == HOT )
    {
      temp = temperature_read();
      uint8_t pwm = controller_pid( temperature_reference_get(), temp );
      power_board_pwm_set( pwm );
    }

    delay_ms( DELAY );
  }
}


/**
 * Performs the PID calculus and truncates the output if it is out of range.
 * The output is truncated between the following constants:
 *  - PWM_HOT_MAX
 *  - PWM_HOT_MIN
 *  - PWM_COLD_MAX
 *  - PWM_COLD_MIN
 *
 * This constants depends on the current mode that is used. The Ik parameter
 * is also truncated on this cases.
 *
 * \param[in]  ref    The reference
 * \param[in]  input  The input
 *
 * \return     The PWM nedded to fix the current error.
 */
uint8_t controller_pid( const float ref, const float input )
{
  float output = 0;
  float max_output = 0;
  float min_output = 0;

  power_board_mode_t mode = power_board_mode_get();

  if( mode == MODE_COLD )
  {
    max_output = PWM_COLD_MAX;
    min_output = PWM_COLD_MIN;
  }
  else if( mode == MODE_HOT )
  {
    max_output = PWM_HOT_MAX;
    min_output = PWM_HOT_MIN;
  }

  output = _pid( ref, input );

  previous_input = input;
  previous_ref = ref;

  if( output > max_output )
  {
    output = max_output;
    Ik = 0;
  }
  else if( output < min_output )
  {
    Ik = 0;
    output = min_output;
  }

  if( mode == MODE_COLD && Ik <= min_output )
    Ik = min_output;
  else if( mode == MODE_HOT && Ik >= max_output )
    Ik = max_output;

  if( mode == MODE_COLD )
    output = output * ( -1 );

  return output;
}


/**
 * Returns the last PID calculated values.
 *
 * \param      Pk_out  The pk out
 * \param      Dk_out  The dk out
 * \param      Ik_out  The ik out
 */
void controller_pid_values_get( float* Pk_out, float* Dk_out, float* Ik_out )
{
  *Pk_out = Pk;
  *Dk_out = Dk;
  *Ik_out = Ik;
}


/**
 * Sets the PID constants.
 *
 * \param[in]  new_Kp  The new kp
 * \param[in]  new_Kd  The new kd
 * \param[in]  new_Ki  The new ki
 */
void controller_pid_constants_set( const float new_Kp, const float new_Kd, const float new_Ki )
{
  Kp = new_Kp;
  Kd = new_Kd;
  Ki = new_Ki;
}


/**
 * Gets the PID constants
 *
 * \param      out_Kp  The out kp
 * \param      out_Kd  The out kd
 * \param      out_Ki  The out ki
 */
void controller_pid_constants_get( float* out_Kp, float* out_Kd, float* out_Ki )
{
  *out_Kp = Kp;
  *out_Kd = Kd;
  *out_Ki = Ki;
}

/* ----------------------------------------------------------------------------
  Internal function definition
------------------------------------------------------------------------------*/

/**
 * Performs a PID process based on the setted constants.
 *
 * \param[in]  ref    The reference
 * \param[in]  input  The input value
 *
 * \return     The output
 */
static float _pid( const float ref, const float input )
{
  if( !n )
    n = 1;
  float h = ( ( DELAY )*pow( 10, -3 ) );
  float gamma = Kd / n;
  Pk = Kp * ( ref - input );
  Ik = Ik + Ki * Kp * h * ( previous_ref - previous_input );
  Dk = gamma / ( gamma + h ) * Dk - Kp * Kd / ( gamma + h ) * ( input - previous_input );
  return Ik + Dk + Pk + bias;
}