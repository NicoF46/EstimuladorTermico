#! /usr/bin/python
import serial
import struct
from time import time
import serial.tools.list_ports as ports_list
from live_plot import Plotter
import threading
import csv
import sys
import cmd


BAUD_RATE = 9600
SEPARATOR_SIZE = 1
SEPARATOR = b't'
DATA_SIZE = 4
DATA_FORMAT = '<f'
T_LABELS = ('t1', 't2')

DEBUG = False


class EnviarDatos(cmd.Cmd):
    ser = None

    def _send_chunk(self, prefix, dato):
        try:
            temp = int(dato)
        except ValueError(e):
            print("temperature must be an integer")

        raw_data = struct.pack('<cb', prefix, temp)
        EnviarDatos.ser.write(raw_data)

    def do_temp(self, dato):
        self._send_chunk(b'r', dato)

    def do_pwm_cold(self, dato):
        self._send_chunk(b'a', dato)

    def do_pwm_hot(self, dato):
        self._send_chunk(b'b', dato)

    def do_cold(self, dato):
        self._send_chunk(b'd', dato)

    def do_hot(self, dato):
        self._send_chunk(b'e', dato)
    
    def do_cal(self, dato):
        self._send_chunk(b'c', dato)
        print("Iniciando calibracion")
    
    def do_stop(self, data):
        EnviarDatos.ser.write(b's')

    def do_error(self, data):
        EnviarDatos.ser.write(b'x')

    def do_no_error(self, data):
        EnviarDatos.ser.write(b'z')

    def do_exit(self, data):
        return True

    def do_EOF(self, data):
        return True


def find_arduino(baud_rate):
    ports = list(ports_list.comports())
    for p in ports:
        if p.device == '/dev/ttyACM0' or p.device == '/dev/ttyUSB0':  # arduino found
            print("Device found at " + p.device)
            return serial.Serial(p.device, baud_rate)
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
    start_time = time()
    data = {}
    for l in T_LABELS:
        p.add_line(l)
        data[l] = []
    times = []

    while not stop_event.isSet():

        raw_separator = ser.read(SEPARATOR_SIZE)

        if raw_separator == SEPARATOR:
            

            current_time = time()-start_time
            for l in T_LABELS   :
                raw_data = ser.read(DATA_SIZE)
                current_data, = struct.unpack(DATA_FORMAT, raw_data)
                p.add_data([current_time], [current_data], l)
                data[l].append(current_data)

            times.append(current_time)

    ser.close()
    p.close()
    t.join()
    if len(sys.argv) > 1:
        with open(sys.argv[1], 'w') as dataFile:
            wr = csv.writer(dataFile)
            wr.writerows([times, data])


if __name__ == "__main__":
    get_data()