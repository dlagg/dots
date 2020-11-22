# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dlag/.config/zsh/.oh-my-zsh"
#Path of z ohmyzsh Plugin
export _Z_DATA="$HOME/.config/zsh/.z"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

#XBINDKEYS XDG Directory Specification
xbindkeys -f "$XDG_CONFIG_HOME"/xbindkeys/config


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dlag"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize vi-mode zsh-syntax-highlighting z zsh-completions zsh-autosuggestions history-substring-search zsh-vimode-visual)

source $ZSH/oh-my-zsh.sh

# User configuration

ZSH_COLORIZE_TOOL="pygmentize"
ZSH_COLORIZE_STYLE="colorful"

##para completions Y definir mis propias funciones
#fpath=(path/to/zsh-completions/src ~/.zfuncs $fpath)
fpath=(~/.config/zsh/.zfuncs $fpath)
autoload -U compinit && compinit

#autoload -Uz hello go wp fixMonitorDock
autoload ${fpath[1]}/*(:t)


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9932cc,underline"
bindkey '^ ' autosuggest-accept


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="nvim"
alias a="cd .."
alias sour="source ~/.config/zsh/.zshrc"
alias cl="clear && pwd && ls"
alias cla="clear && pwd && ls -a"
alias r="ranger"
alias batstat="upower -d | grep -e percentage -e capacity"
alias gac="git add . && git commit"
alias gr.="git restore . && git status"
alias gpa="git push origin --all"
alias reX="sudo systemctl restart display-manager"
alias paqc="sudo pacman -Qc --noconfirm"
alias up="sudo pacman -Syu"
alias notion="/home/dlag/apksManual/lotion/Lotion/Lotion"
alias fix2monitors="xrandr --output DP2-2 --right-of eDP1 --auto"
alias fixmonitor="xrandr --auto"
alias random="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1"
alias record="ffmpeg -f alsa -i hw:0 $(random).wav"
alias esp="setxkbmap -layout es"
alias eng="setxkbmap -layout us"
alias lanmap="nmap -sn 192.168.1.0/24"
alias ssh="ssh -F /home/dlag/.config/ssh/config"
alias notas="nvim /home/dlag/synIT/notas/generales-notas.md"
alias tiempo="curl -H 'Accept-Language: es' wttr.in/Alicante"
alias aa="bluetoothctl connect 90:7F:61:00:29:73"

alias dbnetDrop="dotnet ef database drop -f -c ClaveSolDbContext && dotnet ef database drop -f -c ApplicationDbContext"
#
#Cleaning home
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias gpg2='gpg2 --homedir "$XDG_DATA_HOME"/gnupg'


#CURRENT DIRECTORY (CNTL+SHIFT+T FOR TERMITE)
if [[ $TERM == xterm-termite ]]; then
   . /etc/profile.d/vte.sh
   __vte_osc7
fi
##


if [ -d "$HOME/.bin" ] ;
	then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
	then PATH="$HOME/.local/bin:$PATH"
fi


#NPM_PACKAGES="$HOME/.npm-global-packages"
#PATH="$NPM_PACKAGES/bin $PATH"
#MANPATH="$NPM_PACKAGES/share/man $MANPATH"

#xmodmap -e "keycode 9 = Caps_Lock" && xmodmap -e "keycode 66 = Escape"
##udiskie &!
#setxkbmap -option caps:swapescape #NO COMPATIBLE CON VSCODE-VIM
