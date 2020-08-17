#include "commands.gen.h"
#include "status.h"

#include "funciones.h"

void command_cold( union command_ctx *ctx )
{
  modo_frio();
  status_set( COLD );
}

void command_hot( union command_ctx *ctx )
{
  modo_calor();
  status_set( HOT );
}