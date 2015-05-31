#!/usr/bin/env python

# Diese Skript vervollständigt eine Kaggle-Einreichung.
# Fehlenden Kunden wird eine Wahrscheinlichkeit von 0 
# zugeordnet.
# Die Datei sampleSubmissions.csv muss sich im aktuellen 
# Verzeichnis befinden

import sys

samplesFile = open('sampleSubmission.csv', 'r')
samplesFile.readline()
samples = { }
for line in samplesFile:
	id, prob = line.split(',', 1)
	samples[id] = prob

# Erste Zeile ignorieren
sys.stdin.readline()
# Und die geforderte Kopfzeile ausgeben
sys.stdout.write("id,repeatProbability\n")

for line in sys.stdin:
	id, prob = line.split(',', 1)
	if (id in samples):
		del samples[id]
	sys.stdout.write(id + ',' + prob)
	
for id in samples:
	sys.stdout.write(id + ',' + samples[id])
	
