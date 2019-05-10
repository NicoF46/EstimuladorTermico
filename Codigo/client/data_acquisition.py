#! /usr/bin/python
import serial
import struct
from time import time
import serial.tools.list_ports as ports_list
from live_plot import Plotter
import threading
import csv
import sys


BAUD_RATE = 9600
SEPARATOR_SIZE = 1
SEPARATOR = b'-'
DATA_SIZE = 4
DATA_FORMAT = '<f'


def find_arduino():
	ports = list(ports_list.comports())
	for p in ports:
		if p.usb_description() == 'ttyACM0': # arduino found
			print("Arduino found at " + p.device)
			return serial.Serial(p.device, BAUD_RATE)
	raise IOError("Could not find an arduino - is it plugged in?")


def get_data(find_arduino_event, stop_event):
	ser = find_arduino()
	find_arduino_event.set()
	p = Plotter([0,1], [20,30])
	start_time = time()
	data = []
	times = []
	while not stop_event.isSet():
		raw_separator = ser.read(SEPARATOR_SIZE)
		if raw_separator == SEPARATOR:

			raw_data = ser.read(DATA_SIZE)
			current_data, = struct.unpack(DATA_FORMAT,raw_data)
			current_time = time()-start_time

			p.add_data([current_time], [current_data])

			times.append(current_time)
			data.append(current_data)

	ser.close()
	p.close()
	if len(sys.argv) > 1:
		with open(sys.argv[1], 'w') as dataFile:
				wr = csv.writer(dataFile)
				wr.writerows([times,data])


def ask_stop(wait_event, stop_event):
	wait_event.wait()
	input("Press Enter to continue...")
	stop_event.set()
	print("Closing plot")


if __name__ == "__main__":

	arduino_search = threading.Event()
	stop_event = threading.Event()

	t = threading.Thread(name = 'ask_for_stop', \
						target=ask_stop, \
						args = (arduino_search, stop_event))
	t.start()
	get_data(arduino_search, stop_event)
	t.join()
