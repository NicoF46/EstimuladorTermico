#include "keep_alive.h"
#include "app_utils.h"

/* ----------------------------------------------------------------------------
  Internal data
------------------------------------------------------------------------------*/

#define KEEP_ALIVE_TIMEOUT 5000

static int keep_alive = 0;
static int delay = 300;

/* ----------------------------------------------------------------------------
  Function definition
------------------------------------------------------------------------------*/

/**
 * Configures the delay used by te keep alive.
 *
 * \param[in]  new_delay  The new delay
 */
void keep_alive_setup( const unsigned int new_delay )
{
  delay = new_delay;
  keep_alive = 0;
}

/**
 * Restarts the keep alive counter.
 */
void keep_alive_reset()
{
  keep_alive = 0;
}

/**
 * Waits the delay parameter previously configured. If it was not configured 300 ms will be used.
 *
 * \return     true if the keep alive counter is lower than the timeout ( 5 seconds ), otherwise
 * false.
 */
bool keep_alive_wait()
{
  delay_ms( delay );
  keep_alive += delay;
  return keep_alive < KEEP_ALIVE_TIMEOUT;
}