# Including setings file
if [ -f $HOME/.bash/aliases ]; then
	source $HOME/.bash/aliases
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Function coloring man
man()
{
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# Python virtualenv
prompt-venv()
{
	if test -z "$VIRTUAL_ENV"; then
		echo -n ""
	else
		echo -en "$(tput bold)\033[38;5;11m[$(tput sgr0)\033[38;5;135m`basename \"$VIRTUAL_ENV\"`$(tput bold)\033[38;5;11m]"
	fi
}
# Disable defoult prompt change by venv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Function git branch
git-branch()
{
	git_branch()
	{
		git branch --show-current 2> /dev/null
	}
	git branch &> /dev/null
	if [ $? -eq 0 ]; then
		echo -ne "$(tput bold)\033[38;5;11m[$(tput sgr0)\033[38;5;147m$(git_branch)$(tput bold)\033[38;5;11m]-"
	fi
}

# My custom prompt
export PS1="$(tput bold)\033[38;5;11m┌─\$(git-branch)\[$(tput bold)\]\[\033[38;5;11m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;11m\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\H\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;11m\]]-[\[$(tput sgr0)\]\[\033[38;5;208m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;11m\]]\[$(tput sgr0)\]\n\[$(tput bold)\]\[\033[38;5;11m\]└────\$(prompt-venv)─\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;11m\][\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;11m\]]:\[$(tput sgr0)\] \[$(tput sgr0)\]"
export PS2="\[$(tput bold)\]\[\033[38;5;11m\]->\[$(tput sgr0)\]"
export PS4="\[$(tput bold)\][\[$(tput sgr0)\]\[\033[38;5;208m\]::\[$(tput sgr0)\]\[$(tput bold)\]]\[$(tput sgr0)\]\[\033[38;5;208m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"

# Color aliases 
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ip="ip -c"
     
# Usefull aliases
alias bashrc='vim $HOME/.bashrc'
alias mkdir='mkdir -p -v'	# Beter create dir
alias rm='rm -f -r -v'		# Beter remove
alias cp='cp -r -v'		# Beter coping
alias gs='git status'		# View Git status.
alias ga='git add'		# Add a file to Git.
alias gaa='git add --all'	# Add all files to Git.
alias gc='git commit'		# Commit changes to the code.
alias gl='git log --oneline'	# View the Git log.
alias gb='git checkout -b'	# Create a new Git branch and move to the new branch at the same time. 
alias gd='git diff'		# View the difference.
alias wget='wget2'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

# Keyserver GPG
export DOWNLOAD_KEYSERVER=hkps://keys.openpgp.org
