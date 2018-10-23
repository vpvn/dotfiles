#!/bin/bash

capacity=$(cat /sys/class/power_supply/axp288_fuel_gauge/capacity)
if [[ -z $capacity ]]; then
    echo ""
    exit 0
fi
if (($capacity >= 50 )); then
    echo "#[fg=colour22] ♥ "$capacity
    exit 0
fi
if (($capacity < 50 )); then
    echo "#[fg=colour58] ♥ "$capacity
    exit 0
fi
if (($capacity < 20 )); then
    echo "#[fg=colour52] ♥ "$capacity
    exit 0
fi
