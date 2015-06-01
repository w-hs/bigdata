#!/usr/bin/env python

import sys

# Das Ergebnis von Vorpal Wabbit gibt ein Paar aus Wahrscheinlichkeit
# und Kunden-ID pro Zeile und durch ein Leerzeichen getrennt aus.
# Dieses Programm konviertiert diese Format in da von Kaggle
# geforderte CSV-Format.

print('id,repeatProbability')

for line in sys.stdin:
	prob, id = line.split(' ', 1)
	print(id[:-1] + ',' + prob)