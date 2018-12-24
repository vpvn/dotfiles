#!/bin/bash

output_num=$(mpc status -f "♫ [%title%]" | wc -l)
if (($output_num>1))
then
    output_str=$(mpc status -f "♫ [%title%]" | head -n 1)
else
    output_str=$(spotify-now -i "♫ %artist - %title" -e "♫ --- ♫")
fi

str_len=${#output_str}

if (($str_len>35))
then
    output_str=${output_str:0:35}'…'
fi

echo $output_str
