
### idf install

https://github.com/micropython/micropython/blob/master/tools/ci.sh
    ci_esp32_idf50_setup
    ci_esp32_build

# make local project

git clone https://github.com/espressif/esp-idf
cd esp-idf
git checkout v5.0.2
./install.sh

### mpy <-> idf dir

ensure $espidf_dir is valid in arkon.sh
