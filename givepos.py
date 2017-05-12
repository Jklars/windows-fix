files = ['msftres', 'msftdata']

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

for i in range(0,1):
	DoStuff(i)