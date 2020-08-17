#ifndef FRAME_H
#define FRAME_H

#include <stddef.h>

void frame_send( void *data, size_t size );
void frame_receive();

#endif