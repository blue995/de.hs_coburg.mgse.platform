#!/usr/bin/python

from subprocess import check_call
import os

with open('languages.txt') as fp:
	line = fp.readline()
	cnt = 1
	while line:
		line_formated = line.strip().replace('\n', '')
		print('Visiting {}'.format(line_formated))
		path = os.path.join(line.replace('\n', ''))
		print('Executing "gradle build" in "{}"'.format(path))
		check_call(['gradle', 'build'], cwd=path)
		line = fp.readline()
		cnt += 1
