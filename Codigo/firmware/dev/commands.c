#include "commands.gen.h"
#include "status.h"
#include "temperature.h"
#include "power_board.h"
#include "controller.h"

#include "error.h"

/**
 * Do nothing, this command is used to return the status and error flag-
 *
 * \param      ctx   The command context
 */
void command_status( command_status_ctx_t *ctx )
{
  return;
}

/**
 * Return the temperature readed by the thermistor indicated by its number.
 *
 * \param      ctx   The command context
 */
void command_thermistor_temp( command_thermistor_temp_ctx_t *ctx )
{
  ctx->output.temp = temperature_read_thermistor( ctx->input.thermistor );
}

/**
 * Regulates the device to reach the input temperature using cold mode.
 *
 * \param      ctx   The command context
 */
void command_cold( command_cold_ctx_t *ctx )
{
  power_board_mode_set( MODE_COLD );
  temperature_reference_set( ctx->input.temp );
  status_set( COLD );
}

/**
 * Regulates the device to reach the input temperature using hot mode.
 *
 * \param      ctx   The command context
 */
void command_hot( command_hot_ctx_t *ctx )
{
  power_board_mode_set( MODE_HOT );
  temperature_reference_set( ctx->input.temp );
  status_set( HOT );
}

/**
 * Sets the pwm to the desired value using cold mode.
 *
 * \param      ctx   The command context
 */
void command_pwm_cold( command_pwm_cold_ctx_t *ctx )
{
  power_board_mode_set( MODE_COLD );
  power_board_pwm_set( ctx->input.pwm );
  status_set( PWM_COLD );
}

/**
 * Sets the pwm to the desired value using hot mode.
 *
 * \param      ctx   The command context
 */
void command_pwm_hot( command_pwm_hot_ctx_t *ctx )
{
  power_board_mode_set( MODE_HOT );
  power_board_pwm_set( ctx->input.pwm );
  status_set( PWM_HOT );
}

/**
 * Returns the average temperature.
 *
 * \param      ctx   The command context
 */
void command_read_temperature( command_read_temperature_ctx_t *ctx )
{
  ctx->output.temperature = temperature_read();
}

/**
 * Power off the power board and sets the current status to STANDBY.
 *
 * \param      ctx   The context
 */
void command_stop( command_stop_ctx_t *ctx )
{
  power_board_mode_set( MODE_OFF );
  status_set( STANDBY );
}


/**
 * Sets up the device's error flag. The input integer is maped with the enum error_t.
 *
 * \param      ctx   The command context
 */
void command_error_set( command_error_set_ctx_t *ctx )
{
  error_set( ctx->input.code );
}

/**
 * Clears the device's error flag. The input integer is maped with the enum error_t.
 *
 * \param      ctx   The command context
 */
void command_error_clear( command_error_clear_ctx_t *ctx )
{
  error_clear( ctx->input.code );
}

/**
 * Clears all the error flags.
 *
 * \param      ctx   The command context
 */
void command_error_clear_all( command_error_clear_all_ctx_t *ctx )
{
  error_clear_all();
}