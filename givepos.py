import sys

total = len(sys.argv)
exec = True

try:  
	argument = int(sys.argv)
except ValueError:
	exec = False

files = [ 'msftdata', 'msftres']

def DoStuff(i):
	global files

	file = open(files[i], 'r+')

	filst = list(file)

	filst = list(filst[0])

	print(filst[8])

	file.close()

	file = open(files[i], 'w+')
	
	file.write(filst[8])

	file.close()

if exec == True:
	for i in range(0,argument):
		DoStuff(i)
