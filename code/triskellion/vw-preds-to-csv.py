#!/usr/bin/env python

import sys

print('id,repeatProbability')

for line in sys.stdin:
	prob, id = line.split(' ', 1)
	print(id[:-1] + ',' + prob)