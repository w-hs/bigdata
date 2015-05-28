#!/usr/bin/env python

import sys

samplesFile = open('sampleSubmission.csv', 'r')
samplesFile.readline()
samples = { }
for line in samplesFile:
	id, prob = line.split(',', 1)
	samples[id] = prob

# Ignore first line
sys.stdin.readline()
# And print the desired headline
sys.stdout.write("id,repeatProbability\n")

for line in sys.stdin:
	# Remove the quotes, because Kaggle does not want them
	id, prob = line.split(',', 1)
	if (id in samples):
		del samples[id]
	sys.stdout.write(id + ',' + prob)
	
for id in samples:
	sys.stdout.write(id + ',' + samples[id])
	
