# Zsh

# Customize to your needs...
OSTYPE=`uname -s`

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

autoload -U compinit promptinit
compinit
promptinit

export TERM=xterm-256color

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

# bindkey
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# 256 color
export TERMCAP='xterm|xterm-color|xterm-256color:Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm:tc=xterm-xfree86:'

# pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# BEGIN of oh-my-zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nicoulaj"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ENE of oh-my-zsh
