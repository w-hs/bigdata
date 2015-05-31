#!/usr/bin/env python

import sys
import csv

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
	
	# Spalten in Features übersetzen
	for key in row:
		if key != 'id' and  key != 'repeater' and len(row[key]) > 0:
			output += ' ' + key + ':' + row[key]
		
	# Negative Features erzeugen, wenn nichts gekauft wurde
	if len(row['b_tx_count']) == 0:
		output += ' b_never:1'
	if len(row['co_tx_count']) == 0:
		output += ' co_never:1'
	if len(row['ca_tx_count']) == 0:
		output += ' ca_never:1'
		
	print(output)