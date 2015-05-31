#!/usr/bin/env python

import sys
import csv

daysBeforeOffer = [-1, 30, 60, 90, 180]

input = csv.DictReader(sys.stdin, delimiter=',')
for row in input:
	# Ausgabe beginnt mit der Klassifizierung:
	# hat gekauft (1), hat nicht gekauft (0) oder unbekannt (0.5)
	output = '0.5'
	if row['repeater'] == 't':
		output = '1'
	elif row['repeater'] == 'f':
		output = '0'
		
	# Customer ID eintragen und Feature-Liste beginnen
	output += ' \'' + row['id'] + ' |f'
	
	for key in row:
		if key != 'id' and  key != 'repeater' and len(row[key]) > 0:
			output += ' ' + key + ':' + row[key]
		
	print(output)