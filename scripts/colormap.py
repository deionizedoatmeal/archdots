#!/usr/bin/env python3
import subprocess
from random import randrange, random
import itertools


def chunks(iterable, steps):
	n = 0
	step = itertools.cycle(steps)
	while n < len(iterable):
		next_step = next(step)
		yield iterable[n:n + next_step]
		n+=next_step

def col(text):
	chance = random()
	if chance < 0.2:
		return f"\033[1;31m{text}\033[m"
	elif chance < 0.4:
		return f"\033[1;34m{text}\033[m"
	elif chance < 0.6:
		return f"\033[1;36m{text}\033[m"
	elif chance < 0.8:
		return f"\033[1;32m{text}\033[m"
	else:
		return f"\033[1;33m{text}\033[m"

minimap = subprocess.run(['code-minimap', 'colormap.py'], capture_output=True, text=True).stdout
braille = list(chunks( minimap, [4, 5, 2] ))
for breaks in braille:
		if random() < 0.7:
			print(col(breaks), end="")
		else:
			print(breaks, end='')
			
