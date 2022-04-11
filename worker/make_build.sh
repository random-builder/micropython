#!/usr/bin/env bash

#
# https://github.com/micropython/micropython/blob/master/ports/esp32/README.md
#

source ./arkon.sh 

export IDF_PATH=$espidf_dir 
source $espidf_dir/export.sh

make -C mpy-cross

cd ports/esp32
make submodules
make

this_build="build-GENERIC"
this_image=$this_build/firmware.bin

install_firmware() {

    echo "### flash file"
    ls -las $this_image
    
    this_port="/dev/serial/by-id/usb-Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001-if00-port0"
    
    echo "### flash erase"
    esptool.py --chip esp32 --port $this_port erase_flash
    
    echo "### flash write"
    esptool.py --chip esp32 --port $this_port --baud 460800 write_flash -z 0x1000 $this_image
   
}

install_firmware
