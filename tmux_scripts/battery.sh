#!/bin/bash

capacity=$(cat /sys/class/power_supply/axp288_fuel_gauge/capacity)
echo "#[fg=colour1] ♥ "$capacity

