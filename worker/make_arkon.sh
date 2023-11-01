#!/usr/bin/env bash

source ./arkon.sh 

#
# reproduce /micropython/tools/ci.sh
# source tools/ci.sh && ci_esp32_idf50_setup
# source tools/ci.sh && ci_esp32_build
#

function ci_esp32_idf50_setup {
    # pip3 install pyelftools # use pacman
    git clone https://github.com/espressif/esp-idf.git
    git -C esp-idf checkout v5.0.2
    ./esp-idf/install.sh
}

function ci_esp32_build_XXX { # not used: example only
    source esp-idf/export.sh
    make ${MAKEOPTS} -C mpy-cross
    make ${MAKEOPTS} -C ports/esp32 submodules
    make ${MAKEOPTS} -C ports/esp32 \
        USER_C_MODULES=../../../examples/usercmodule/micropython.cmake \
        FROZEN_MANIFEST=$(pwd)/ports/esp32/boards/manifest_test.py
    make ${MAKEOPTS} -C ports/esp32 BOARD=ESP32_GENERIC_C3
    make ${MAKEOPTS} -C ports/esp32 BOARD=ESP32_GENERIC_S2
    make ${MAKEOPTS} -C ports/esp32 BOARD=ESP32_GENERIC_S3

    # Test building native .mpy with xtensawin architecture.
    ci_native_mpy_modules_build xtensawin
}

ci_esp32_idf50_setup
