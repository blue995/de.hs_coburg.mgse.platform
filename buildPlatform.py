#!/usr/bin/python

from subprocess import check_call
import os
import platform
import sys

with open('languages.txt') as fp:
	current_system = platform.system()
	if current_system == "Windows":
		shell=True
	elif current_system == "Linux":
		shell=False
	else:
		print('Unknown system platform: {}'.format(current_system))
		sys.exit(1)
	print('Executing build on system {}. Execute in additional shell={}'.format(current_system, shell))
	
	line = fp.readline()
	cnt = 1
	while line:
		line_formated = line.strip().replace('\n', '')
		path = os.path.join(line_formated)
		print('Visiting {}'.format(path))
		print('Executing "gradle build" in "{}"'.format(path))
		check_call(['gradle', 'build'], cwd=path, shell=shell)
		line = fp.readline()
		cnt += 1
