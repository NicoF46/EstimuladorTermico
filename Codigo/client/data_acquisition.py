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
SEPARATOR = b't'
DATA_SIZE = 4
DATA_FORMAT = '<f'


def find_arduino():
	ports = list(ports_list.comports())
	for p in ports:
		if p.usb_description() == 'ttyACM0': # arduino found
			print("Arduino found at " + p.device)
			return serial.Serial(p.device, BAUD_RATE)
	raise IOError("Could not find an arduino - is it plugged in?")

def ask_stop(stop_event):
	input("Press Enter to continue...")
	stop_event.set()
	print("Closing plot")

def get_data():
	try:
		ser = find_arduino()
	except IOError as e:
		print(e)
		return

	stop_event = threading.Event()
	t = threading.Thread(name = 'ask_stop', target=ask_stop, args = (stop_event,))
	t.start()

	p = Plotter([0,30], [-20,40])
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

		elif raw_separator == b'p':
			raw_data = ser.read(1)
			current_data, = struct.unpack('<B',raw_data)
			print(current_data)


	ser.close()
	p.close()
	t.join()
	if len(sys.argv) > 1:
		with open(sys.argv[1], 'w') as dataFile:
			wr = csv.writer(dataFile)
			wr.writerows([times,data])


if __name__ == "__main__":
	get_data()