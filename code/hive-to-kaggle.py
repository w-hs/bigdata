#!/usr/bin/env python

import sys

# Ignore first line
sys.stdin.readline()
# And print the desired headline
sys.stdout.write("id,repeatProbability\n")

for line in sys.stdin:
	# Remove the quotes, because Kaggle does not want them
	outputLine = line.replace('"', '')
	sys.stdout.write(outputLine)