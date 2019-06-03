#!/bin/bash
LC_TYPE=ru_RU.UTF-8

# This need spotify-cli-linux package
# to install type
# sudo pip install spotify-cli-linux
#
# sometimes you need to fix stotifycli.py:
#     def show_status():
#         artist, title = get_song()
#         print(("%s - %s" % (artist, title)).encode('utf-8'))

output_num=$(mpc status -f "♫ [%title%]" | wc -l)
play_status=''

if (($output_num>1))
then
    output_str=$(mpc status -f "♫ [%title%]" | head -n 1)
else
    output_str=$(spotifycli --status)
    play_status=' '$(spotifycli --playbackstatus)' '
fi

str_len=${#output_str}

if (($str_len<1))
then
    output_str='♫ --- ♫'
else
    output_str=$play_status'♫ '$output_str' ♫'
fi

if (($str_len>35))
then
    output_str=${output_str:0:35}'…'
fi

echo $output_str
