#include "controller.h"
#include "power_board.h"
#include "app_utils.h"
#include "temperature.h"
#include "error.h"
#include "keep_alive.h"

#include <math.h>
#include <stdint.h>
#include <avr/interrupt.h>
#include <stdbool.h>

/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

#define DELAY 100
#define PWM_HOT_MAX 120
#define PWM_HOT_MIN 0
#define PWM_COLD_MAX 0
#define PWM_COLD_MIN -255

static float KP_COLD = 10.01;
static float KI_COLD = 0.0305;
static float KD_COLD = 0.0023;
static float KP_HOT = 7.241;
static float KI_HOT = 0.0285;
static float KD_HOT = 0.0032;
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
static void _stop();

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

void controller_loop()
{
  keep_alive_delay_set( DELAY );

  sei();
  float temp;

  while( true )
  {
    if( !error_is_on_error() && ( status_get() == COLD || status_get() == HOT ) )
    {
      temp = temperature_read();
      uint8_t pwm = controller_pid( temperature_reference_get(), temp );
      power_board_pwm_set( pwm );
    }

    if( !keep_alive_wait() )
      _stop();

   error_check();
   if( error_is_on_error() )
   {
     _stop();
     error_wait();
   }
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
    output = max_output;
  else if( output < min_output )
    output = min_output;

  if( mode == MODE_COLD && Ik <= min_output )
    Ik = min_output;
  else if( mode == MODE_HOT && Ik >= max_output )
    Ik = max_output;

  if( mode == MODE_COLD )
    output = output * ( -1 );

  return output;
}


void controller_restart( float current_pwm, status_t new_status )
{
  Pk = 0;
  Ik = 0;
  Dk = 0;
  bias = 0;
  if ( new_status == status_get() )
    bias = new_status == COLD ? -current_pwm : current_pwm;  
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

  float Kp = KP_COLD;
  float Ki = KI_COLD;
  float Kd = KD_COLD;
  if( status_get() == HOT )
  {
    Kp = KP_HOT;
    Ki = KI_HOT;
    Kd = KD_HOT;
  }

  if( !n )
    n = 1;
  float h = ( ( DELAY )*pow( 10, -3 ) );
  float gamma = Kd / n;
  Pk = Kp * ( ref - input );
  Ik = Ik + Ki * Kp * h * ( previous_ref - previous_input );
  Dk = gamma / ( gamma + h ) * Dk - Kp * Kd / ( gamma + h ) * ( input - previous_input );
  return Ik + Dk + Pk + bias;
}

/**
 * Stops the device.
 */
static void _stop()
{
  power_board_mode_set( MODE_OFF );
  status_set( STANDBY );
}