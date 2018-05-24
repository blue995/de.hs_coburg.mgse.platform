#!/usr/bin/python

from subprocess import check_call


with open('languages.txt') as fp:
	line = fp.readline()
	cnt = 1
	while line:
		line_formated = line.strip().replace('\n', '')
		print('Visiting {}'.format(line_formated))
		check_call(['gradle', 'build'], 
cwd='./'+line.replace('\n', ''))
		line = fp.readline()
		cnt += 1
