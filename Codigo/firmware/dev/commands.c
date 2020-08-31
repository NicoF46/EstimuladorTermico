#include "commands.gen.h"
#include "status.h"
#include "temperature.h"
#include "power_board.h"

#include "funciones.h"

void command_thermistor_temp( union command_ctx *ctx)
{
  return;
}

void command_cold( union command_ctx *ctx )
{
  power_board_mode_set( MODE_COLD );
  temperature_reference_set(ctx->cold.input.temp);
  status_set( COLD );
}

void command_hot( union command_ctx *ctx )
{
  power_board_mode_set( MODE_HOT );
  temperature_reference_set(ctx->hot.input.temp);
  status_set( HOT );
}

void command_pwm_cold( union command_ctx *ctx)
{
  power_board_mode_set( MODE_COLD );
  power_board_pwm_set(ctx->pwm_cold.input.pwm);
  status_set( PWM_COLD );
}

void command_pwm_hot( union command_ctx *ctx)
{
  power_board_mode_set( MODE_HOT );
  power_board_pwm_set( ctx->pwm_hot.input.pwm );
  status_set( PWM_HOT );
}