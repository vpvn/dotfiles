# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH=/home/vpvn/projects/esp8266/ESP8266/esp-open-sdk/xtensa-lx106-elf/bin:/home/vpvn/projects/air_project:$PATH

translate() {
  sdcv --color -n "$1"
}
alias tr=translate

alias radiodfm="mplayer -cache 2048 -ao alsa:device=hw=1,0 http://92.53.112.250:8100/rr_aac?type=.aac"
alias radioeuropa="mplayer -cache 2048 http://europa.stav.ru:8010/"
alias radioyou="mplayer -cache 2048 http://s6.radioheart.ru:8016/live"
alias radiotrans="mplayer -cache 2048 http://lr-fm.com:8000/trance128mp3"
alias radiorecord="mplayer -cache 2048 http://air.radiorecord.ru:805/tm_320"
alias radiogti256="mplayer -cache 2048 http://radio.globaltranceinvasion.com:8000/radiohi"
alias radiogti128="mplayer -cache 2048 http://radio.globaltranceinvasion.com:8000/radiomid"
alias radiogti96="mplayer -cache 2048 http://radio.globaltranceinvasion.com:8000/radiolow"
alias book="mplayer -cache 2048 -ao alsa:device=hw=1,0 http://litraserver1.streamr.ru:8069/fm128"
alias wrk="cd ~/projects/spavto_project && vim -S vim"
alias cdwrk="cd ~/projects/spavto_project"
alias djrun="cd ~/projects/spavto_project && workon sp_dev && python manage.py runserver"
alias scrs="avconv -f x11grab -threads 4 -r 25 -s 3840x1080 -i :0.0 -c:v libx264 ~/Видео/screen.mp4"

# esp shell
alias espshell='mpfshell -c "open ttyUSB0"'
# esp shell upload boot.py
alias espboot='mpfshell -c "open ttyUSB0; put boot.py"'
# esp shell upload main.py
alias espmain='mpfshell -c "open ttyUSB0; put main.py"'
# esp shell upload boot.py and main.py
alias espfiles='mpfshell -c "open ttyUSB0; put main.py"'
# esp repl
alias esprepl='mpfshell -c "open ttyUSB0; repl"'

# kill window process
alias killwin='kill -9 $(xprop _NET_WM_PID | grep -o "[0-9]*")'

# weather
alias weather='curl -4 wttr.in/Stavropol?lang=ru'


# virtualenv wrapper
export WORKON_HOME='/home/vpvn/.envs'
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
source /usr/local/bin/virtualenvwrapper.sh


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
