#!/bin/bash

echo "set the fuse bits ..."

sudo avrdude -b 19200 -c usbtiny -p m328p -v -e -U efuse:w:0x05:m -U hfuse:w:0xDE:m -U lfuse:w:0xFF:m

echo "loading the bootloader ..."

sudo avrdude -b19200 -c usbtiny -p m328p -v -e -U flash:w:./blink_boot.hex -U lock:w:0x0F:m

sudo avrdude -b19200 -c usbtiny -p m328p -v -e -U flash:w:optiboot_atmega328.hex -U lock:w:0x0F:m

echo "loading the program file ..."

sudo avrdude -b19200 -c usbtiny -p m328p -v -e -U flash:w:blink_1s.hex -U lock:w:0x0F:m
