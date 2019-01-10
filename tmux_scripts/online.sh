#!/bin/bash

nc -z 8.8.8.8 53  >/dev/null 2>&1
online=$?
if [ $online -eq 0 ]; then
    echo "#[fg=colour155]● "
else
    echo "#[fg=colour1]○ "
fi
