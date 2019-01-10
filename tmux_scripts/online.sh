#!/bin/bash

wget -q --tries=1 --timeout=2 --spider http://google.com
if [[ $? -eq 0 ]]; then
    echo "#[fg=colour155]● "
else
    echo "#[fg=colour1]○ "
fi
