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
DATA_SIZE = 6
DATA_FORMAT = '<bbf'
T_LABELS = ('t1', 't2')
TIMEOUT = 0.5

DEBUG = False


class Commander(cmd.Cmd):
    ser = None
    communication_available = threading.Event();
    start = 0
    time = 0
    t1 = None
    t2 = None
    t_ref = None
    pwm = None

    @classmethod
    def wait_communication_available(cls):
        while not Commander.communication_available.isSet():
            pass

    @classmethod
    def send_chunk(cls, data_format, data):
        raw_data = struct.pack(data_format, *data)
        Commander.ser.write(raw_data)
        return True

    @classmethod
    def read_chunk(cls, size, data_format):
        raw_data = Commander.ser.read(size)
        data = struct.unpack(data_format, raw_data)
        return data
    
    @classmethod
    def set_data(cls, t1, t2):
        Commander.t1 = t1
        Commander.t2 = t2
        Commander.time = time.time() - Commander.start

    def do_data(self, data):
        print(f'time = {Commander.time}')
        print(f't1 = {Commander.t1}')
        print(f't2 = {Commander.t2}')
        print(f'dif = {Commander.t2 - Commander.t1}')


    def do_cold_sequence(self, data):
        if data == '':
            print("Missing data")
            return
        data = list(map(int, data.split(' ')))
        if len(data)%2 != 0:
            print("The data len must be even")
            return
        
        for i in range(0, len(data), 2):
            print(f'pwm = {data[i]}')
            Commander.pwm = data[i]
            print(f'time = {data[i+1]}')

            self.wait_communication_available()
            Commander.communication_available.clear()
            self.send_chunk('<bB', (4, numpy.uint8(Commander.pwm)))
            frame = self.read_chunk(2, '<bb')
            Commander.communication_available.set()
            time.sleep(data[i+1])

    def do_hot_sequence(self, data):
        if data is '':
            print("Missing data")
            return
        data = list(map(int, data.split(' ')))
        if len(data)%2 != 0:
            print("The data len must be even")
            return
        
        for i in range(0, len(data), 2):
            print(f'pwm = {data[i]}')
            Commander.pwm = data[i]
            print(f'time = {data[i+1]}')

            self.wait_communication_available()
            Commander.communication_available.clear()
            self.send_chunk('<bB', (5, numpy.uint8(Commander.pwm)))
            frame = self.read_chunk(2, '<bb')
            Commander.communication_available.set()
            time.sleep(data[i+1])

    def do_status(self, data):
        self.wait_communication_available()
        Commander.communication_available.clear()
        if not self.send_chunk('<b', (0,)):
            return
        status = self.read_chunk(2, '<bb')
        Commander.communication_available.set()
        print(f'status = {status}')

    def do_cold(self, dato):
        self.wait_communication_available()
        Commander.communication_available.clear()
        self.send_chunk('<bb', (2, numpy.int8(dato)))
        frame = self.read_chunk(2, '<bb')
        Commander.communication_available.set()
        print(f'frame = {frame}')
        Commander.start = time.time()
        Commander.t_ref = int(dato)

    def do_hot(self, dato):
        self.wait_communication_available()
        Commander.communication_available.clear()
        self.send_chunk('<bb', (3, numpy.int8(dato)))
        frame = self.read_chunk(2, '<bb')
        Commander.communication_available.set()
        print(f'frame = {frame}')
        Commander.start = time.time()
        Commander.t_ref = int(dato)

    def do_pwm_cold(self, dato):
        self.wait_communication_available()
        Commander.communication_available.clear()
        self.send_chunk('<bB', (4, numpy.uint8(dato)))
        Commander.pwm = dato
        frame = self.read_chunk(2, '<bb')
        Commander.communication_available.set()
        print(f'frame = {frame}')
        Commander.start = time.time()

    def do_pwm_hot(self, dato):
        self.wait_communication_available()
        Commander.communication_available.clear()
        self.send_chunk('<bB', (5, numpy.uint8(dato)))
        Commander.pwm = dato
        frame = self.read_chunk(2, '<bb')
        Commander.communication_available.set()
        print(f'frame = {frame}')
        Commander.start = time.time()

    def do_temperature_read(self, dato):
        self.wait_communication_available()
        Commander.communication_available.clear()
        self.send_chunk('<b', (6,))
        frame = self.read_chunk(6, '<bbf')
        Commander.communication_available.set()
        print(f'frame = {frame}')


    def do_stop(self, data):
        self.wait_communication_available()
        Commander.communication_available.clear()
        self.send_chunk('<b', (7,))
        frame = self.read_chunk(2, '<bb')
        Commander.communication_available.set()
        print(f'frame = {frame}')
        Commander.start = time.time()

    def do_error_set(self, data):
        self.wait_communication_available()
        Commander.communication_available.clear()
        self.send_chunk('<bB', (8, numpy.uint8(data)))
        frame = self.read_chunk(2, '<bb')
        Commander.communication_available.set()
        print(f'frame = {frame}')
        Commander.start = time.time()

    def do_error_clear(self, data):
        self.wait_communication_available()
        Commander.communication_available.clear()
        self.send_chunk('<bB', (9, numpy.uint8(data)))
        frame = self.read_chunk(2, '<bb')
        Commander.communication_available.set()
        print(f'frame = {frame}')
        Commander.start = time.time()

    def do_error_clear_all(self, data):
        self.wait_communication_available()
        Commander.communication_available.clear()
        self.send_chunk('<b', (10,))
        frame = self.read_chunk(2, '<bb')
        Commander.communication_available.set()
        print(f'frame = {frame}')
        Commander.start = time.time()

    def do_exit(self, data):
        return True

    def do_EOF(self, data):
        return True


def find_arduino(baud_rate):
    ports = list(ports_list.comports())
    for p in ports:
        if p.device == '/dev/ttyACM0' or p.device == '/dev/ttyUSB0':  # arduino found
            print("Device found at " + p.device)
            ser = serial.Serial(p.device, baud_rate, parity=serial.PARITY_EVEN)
            ser.reset_input_buffer()
            ser.reset_output_buffer()
            time.sleep(3)
            return ser

    raise IOError("Could not find the device - is it plugged in?")


def start_cmd(stop_event):
    Commander().cmdloop()
    stop_event.set()
    print("Closing plot")

def main():

    try:
        ser = find_arduino(BAUD_RATE)
    except IOError as e:
        print(e)
        return
    Commander.ser = ser

    stop_event = threading.Event()
    t = threading.Thread(name='commander', target=start_cmd, args=(stop_event,))
    t.start()

    p = Plotter([0, 30], [0, 60])
    p.set_ticks('y', [y for y in range(0, 60, 1)])
    start_time = time.time()
    data = {}
    for l in T_LABELS:
        p.add_line(l)
        data[l] = []
    times = []
    pwm = []
    t_refs = []

    Commander.communication_available.set()

    while not stop_event.isSet():
        
        Commander.wait_communication_available()

        i = 0
        Commander.communication_available.clear()
        current_time = time.time()-start_time
        times.append(current_time)
        pwm.append(Commander.pwm)
        t_refs.append(Commander.t_ref)
        for l in T_LABELS:
            Commander.send_chunk('<bb', (1,i))
            current_data = Commander.read_chunk(DATA_SIZE, DATA_FORMAT)[2]
            
            p.add_data([current_time], [current_data], l)
            data[l].append(current_data)

            i += 1


        Commander.communication_available.set()
        Commander.set_data(data['t1'][-1], data['t2'][-1])
        time.sleep(0.1)

    ser.close()
    p.close()
    t.join()
    if len(sys.argv) > 1:
        with open(sys.argv[1], 'w') as dataFile:
            wr = csv.writer(dataFile)
            wr.writerow(["time", "t1", "t2", "t_ref", "pwm"])
            for i in range(len(times)):
                wr.writerow([times[i], data['t1'][i], data['t2'][i], t_refs[i], pwm[i]])


if __name__ == "__main__":
    main()