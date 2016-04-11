#!/bin/bash


sudo avrdude -C ./avrdude.conf -v -patmega328p -cusbtiny -e -Ulock:w:0x3F:m -Uefuse:w:0x05:m -Uhfuse:w:0xDE:m -Ulfuse:w:0xFF:m

sudo avrdude -C ./avrdude.conf -v -patmega328p -cusbtiny -Uflash:w:./optiboot_atmega328.hex:i -Ulock:w:0x0F:m

sudo avrdude -C ./avrdude.conf -v -patmega328p -c usbtiny -b115200 -D -Uflash:w:./Blink_riffle.ino.hex:i
