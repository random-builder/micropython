#
#
#

from utime import sleep_ms
from esp32 import RMT
from machine import Pin

driver = RMT(
    id=0,
    pin=Pin(2, mode=Pin.OUT, value=0),
    # source_freq=80_000_000,  # fixed at 80 MHz
    clock_div=80,  # 1 micro second base unit
    idle_level=1,  # initial signal level
    tx_carrier=None  # do not chop signal
)

print(f"{driver=}")

this_head = (10 << 1) | 1
this_tail = (100 << 1) | 0

this_item = (this_head << 16) | (this_tail << 0)
# print(f"{this_item=}")

item_list = 55 * [this_item]
# print(f"{item_list=}")


def reactor():
    print("reactor")

"""
// RMT.store_pulses(self, item_list:list[int32]) -> None
"""
driver.store_pulses(item_list)

"""
// RMT.issue_pulses(self, tx_ready_func:callable, item_index:int, item_count:int, clock_div:int) -> None
"""
driver.issue_pulses(reactor, 16, 8, 80)

while True:
    print("...")
    sleep_ms(1000)
    driver.issue_pulses(reactor, 16, 8, 80)
