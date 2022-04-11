
### file

/micropython/ports/esp32/esp32_rmt.c

### rmt item32_t format

https://esp32.com/viewtopic.php?t=2273

### issues

https://github.com/micropython/micropython/issues/4895

### config

crash workaround needs:
* /micropython/ports/esp32/boards/sdkconfig.base
* CONFIG_FREERTOS_INTERRUPT_BACKTRACE=n

https://docs.espressif.com/projects/esp-idf/en/v4.2-beta1/esp32/api-reference/kconfig.html#config-freertos-interrupt-backtrace

https://docs.espressif.com/projects/esp-idf/en/v4.2-beta1/esp32/api-reference/kconfig.html#config-freertos-idle-task-stacksize

### print item32

        mp_printf(&mp_plat_print, "item: %d %d %d %d\n", 
                self->items[item_index].duration0, self->items[item_index].level0,
                self->items[item_index].duration1, self->items[item_index].level1
        );
