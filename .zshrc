# Zsh

OSTYPE=`uname -s`

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

autoload -U compinit promptinit
compinit
promptinit

export TERM=xterm-256color

if [[ -z "$?WINDOW" ]]; then
    export PS1="%m [%4~] -%n- "
else
    export PS1="%m [%4~] -%n- [W$WINDOW] "
fi

setopt recexact
setopt autolist
setopt ignoreeof
setopt noclobber
setopt notify
setopt autocd
setopt cdablevars
setopt interactivecomments
setopt nobanghist
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup

##################################################################
# Stuff to make my life easier

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

##################################################################

## File permission security
umask 022

## Alias telnet to zh-telnet to fix 8bit problem
alias telnet='/usr/bin/telnet -8'

## Aliases
alias df='/bin/df -h'
alias du='/usr/bin/du -h'
alias cp='/bin/cp -i'
alias mv='/bin/mv -i'
alias rm='/bin/rm -i'
alias b5='env LANG=zh_TW.Big5'

if [ $OSTYPE = 'FreeBSD' -o $OSTYPE = 'Darwin' ]; then
    ls() { /bin/ls -F -G "$@"; }
elif [ $OSTYPE = 'Linux' ]; then 
    ls() { /bin/ls --color=auto -F -G "$@"; }
fi

## Environment Settings
export LANG=en_US.UTF-8
export PATH="/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin:/usr/games/:/usr/local/git/bin"
export MAIL="/var/mail/$USER"

export EDITOR=vim
export VISUAL=vim
export PAGER=less

export LS_COLORS=':no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.c=01;33:*.cpp=01;33:*.MP3=01;44;37:*.mp3=01;44;37:*.pl=01;33:';
export LSCOLORS='GaGaFadaCaDaDaAcacafaF'
export CLICOCOR

# bindkey
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

## 256 color
export TERMCAP='xterm|xterm-color|xterm-256color:Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm:tc=xterm-xfree86:'

