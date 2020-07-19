#! /usr/bin/python
import serial
import struct
import time
import serial.tools.list_ports as ports_list
from live_plot import Plotter
import threading
import csv
import sys
import cmd
import numpy


BAUD_RATE = 9600
SEPARATOR_SIZE = 1
SEPARATOR = b't'
DATA_SIZE = 4
DATA_FORMAT = '<f'
T_LABELS = ('t1', 't2')
TIMEOUT = 0.1

DEBUG = False


class EnviarDatos(cmd.Cmd):
    ser = None
    communication_available = threading.Event();

    @classmethod
    def send_chunk(cls, data_format, data):
        raw_data = struct.pack(data_format, *data)
        if not EnviarDatos.communication_available.wait(timeout = TIMEOUT):
            print( "serial communcation bussy")
            return False
        EnviarDatos.communication_available.clear()
        EnviarDatos.ser.write(raw_data)
        EnviarDatos.communication_available.set()
        return True

    @classmethod
    def read_chunk(cls, size, data_format):
        if not EnviarDatos.communication_available.wait(timeout = TIMEOUT):
            print( "serial communcation bussy")
            return None
        EnviarDatos.communication_available.clear()
        raw_data = EnviarDatos.ser.read(size)
        EnviarDatos.communication_available.set()
        data, = struct.unpack(data_format, raw_data)
        return data

    def do_pwm_cold(self, dato):
        self.send_chunk('<cB', (b'a', numpy.uint8(dato)))

    def do_pwm_hot(self, dato):
        self.send_chunk('<cB', (b'b', numpy.uint8(dato)))

    def do_cold(self, dato):
        self.send_chunk('<cf', (b'd', int(dato)))

    def do_hot(self, dato):
        self.send_chunk('<cf', (b'e', int(dato)))
        
    def do_stop(self, data):
        self.send_chunk('<c', (b's',))

    def do_error(self, data):
        self.send_chunk('<c', (b'x',))

    def do_no_error(self, data):
        self.send_chunk('<c', (b'z',))

    def do_status(self, data):
        if not self.send_chunk('<c', (b'i',)):
            return
        status = self.read_chunk(1, '<b')
        print(f'status = {status}')


    def do_exit(self, data):
        return True

    def do_EOF(self, data):
        return True


def find_arduino(baud_rate):
    ports = list(ports_list.comports())
    for p in ports:
        if p.device == '/dev/ttyACM0' or p.device == '/dev/ttyUSB0':  # arduino found
            print("Device found at " + p.device)
            ser = serial.Serial(p.device, baud_rate)
            time.sleep(3)
            return ser

    raise IOError("Could not find the device - is it plugged in?")


def ask_stop(stop_event):
    EnviarDatos().cmdloop()
    stop_event.set()
    print("Closing plot")


def get_data():
    try:
        ser = find_arduino(BAUD_RATE)
    except IOError as e:
        print(e)
        return

    stop_event = threading.Event()
    EnviarDatos.ser = ser
    t = threading.Thread(name='ask_stop', target=ask_stop, args=(stop_event,))
    t.start()

    p = Plotter([0, 30], [-10, 60])
    p.set_ticks('y', [y for y in range(-10, 61, 5)])
    start_time = time.time()
    data = {}
    for l in T_LABELS:
        p.add_line(l)
        data[l] = []
    times = [[],[]]

    EnviarDatos.communication_available.set()

    while not stop_event.isSet():
        
        i = 0
        for l in T_LABELS:

            EnviarDatos.send_chunk('<cb', (b't',i))
            current_data = EnviarDatos.read_chunk(DATA_SIZE, DATA_FORMAT)

            current_time = time.time()-start_time
            p.add_data([current_time], [current_data], l)
            data[l].append(current_data)
            times[i].append(current_time)
            i += 1

        time.sleep(0.1)

    ser.close()
    p.close()
    t.join()
    if len(sys.argv) > 1:
        with open(sys.argv[1], 'w') as dataFile:
            wr = csv.writer(dataFile)
            wr.writerows([times, data])


if __name__ == "__main__":
    get_data()