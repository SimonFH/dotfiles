# LS STUFF
alias dir='ls -alv'
alias ls='ls -GF'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lh='ll -h'

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
alias lsusb='system_profiler SPUSBDataType'

alias vi='vim'
#alias less="/usr//share/vim/vim73/macros/less.sh -R -c -"

# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Custom bash prompt via kirsle.net/wizards/ps1.html
# export PS1="\[$(tput bold)\]\u\[$(tput setaf 7)\]:\[$(tput setaf 4)\]\w\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

source ~/.git-prompt.sh
# source /usr/local/git/contrib/completion/git-completion.bash
source ~/.bash_colors
#export PS1="\[\e[01;30m\]\u\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[00;34m\]\w\[\e[0m\]\[\e[00;37m\]\\$ \[\e[0m\]"
#if [ -f ~/.git-prompt.sh ]; then
#  source ~/.git-prompt.sh
#  #export PS1='Geoff[\W]$(__git_ps1 "(%s)"): '
#  PS1='\[\e[01;30m\]\u\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[00;34m\]\w $(__git_ps1 "(%s)") \[\e[0m\]\[\e[00;37m\]\\$ \[\e[0m\] \$' 
#  #PS1='\u $(__git_ps1 "(%s)")\$ '
#fi

export PS1=$IBlack'\u'$White':'$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$Blue$PathShort$LightGrey'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$Blue$PathShort$LightGrey'\$'$Color_Off' "; \
fi)'

# GIT_PS1_SHOWDIRTYSTATE=true
# export GIT_PS1_SHOWDIRTYSTATE=1

export CLICOLOR=1
# Don't use these color schemes, they are ugly
# export LSCOLORS='GxFxCxDxBxegedabagaced'
# export LSCOLORS='dxfxcxdxbxegedabagacad'
export GREP_OPTIONS='--color=auto'

## Stuff for ant
#export ANT_HOME='/usr/local/ant/'
## export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/'
## export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Versions/Current/'
export JAVA_HOME=$(/usr/libexec/java_home)
#
#export PATH=${PATH}:${ANT_HOME}/bin/
#
## rbenv stuff
#eval "$(rbenv init -)"

man() {
  /usr/bin/man $* | \
    col -b | \
    #vim -R -c 'set ft=man nomod nolist' -
    /usr//share/vim/vim73/macros/less.sh -R -c 'set ft=man nomod nolist' -
}



#highlights files with given postfix
lsed() {
    #lsed ls|sed $'s/.*\\c$/\e[40;1;32m&\e[0m/'
    #echo "the $1 eats a $2 every time there is a $3"
    #ls|sed $'s/.*\\'"$1"'$/\e[40;1;32m&\e[0m/'
#    ls|sed ''/$1/s/.*\\$1$/`printf "\033[32m$1\033[0m"`/'' $2
    if [ $# -eq 1 ]
    then
        lh|sed ''/$1/s/.*\\$1$/`printf "\e[40;1;32m&\e[0m"`/''
    elif [ $# -eq 2 ]
    then    
        lh $1|sed ''/$2/s/.*\\$2$/`printf "\e[40;1;32m&\e[0m"`/''
    fi
}
lsed2() {
    if [ $# -eq 1 ]
    then
        #lh|grep -e \\.$1$|sed ''s/$1$/`printf "\e[5;42m&\e[0m"`/''
        lh|grep -e \\.$1$|sed ''s/$1$/`printf "\e[0m&\e[1;5;32m\xe2\x97\x80\xef\xb8\x8e\xe2\x97\x80\xef\xb8\x8e\e[0m"`/''
    elif [ $# -eq 2 ]
    then    
        lh $1|grep -e \\.$2$|sed ''s/$2$/`printf "\e[0m&\e[1;5;32m\xe2\x97\x80\xef\xb8\x8e\xe2\x97\x80\xef\xb8\x8e\e[0m"`/''
    fi
}

#needs work
toHex() {
    if [ $# -eq 1 ]
    then
        echo $1|hexdump|sed ''s/" "/\\\\x/g''|sed ''s/x\\\\//g''
    fi
}
