#!/bin/bash

for file in *.csv; do
	python plot_csv.py ${file}
done