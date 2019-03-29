import serial
import sys

ser = serial.Serial('/dev/tty.usbmodem1441')
print(ser.name)

logfile = open("result.txt", "w")

while(True):
	line = ser.readline()
	sys.stdout.write(line)
	logfile.write(line)

logfile.close()
ser.close()