#include <time.h>
#include <stdbool.h>

#define KEEP_ALIVE_TIMEOUT 5000

static time_t keep_alive;


void keep_alive_reset()
{
  time( &keep_alive );
}

bool keep_alive_get()
{
  time_t current_time;
  time( &current_time );
  return difftime( current_time, keep_alive ) < KEEP_ALIVE_TIMEOUT;
}