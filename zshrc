# =========================================================
#		 ███████╗███████╗██╗  ██╗██████╗  ██████╗
#		 ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#		   ███╔╝ ███████╗███████║██████╔╝██║
#		  ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#		 ███████╗███████║██║  ██║██║  ██║╚██████╗
#		 ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
# =========================================================

# Ravikiran Kawade
# Last Updated: 2018-09-29

# Preamble                  {{{
#===========================
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
DEFAULT_USER=ravi
JAVA_HOME=/usr/lib/jvm/java-8-openjdk

(cat /home/ravi/.cache/wal/sequences &) # Run Python-PyWal 
#========================}}}
# Aliases {{{1
#===========================
#
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Quicklaunch aliases
alias v="vim"
alias r="ranger"

# Make sure neofetch doesn't... actually I'm not quite sure why 'echo' is here
alias neofetch="echo && neofetch"

# Print 256-bit colormap in terminal
alias print256colours="bash /home/ravi/Documents/Code/Scripts/colors/print256colours.sh"

# Mpv profile aliases
alias mpvur="mpv --profile=ur"
alias mpvbr="mpv --profile=br"

# Lock laptop using Mod+Shift+X
alias lock="bash /home/ravi/Documents/Rice/i3lock/betterlockscreen"

# Display a clock in the terminal
alias clock="/home/ravi/Documents/Rice/tty-clock/tty-clock -bBcSt"

# Use vimdiff as git's difftool
alias gvd="git difftool --tool=vimdiff"

# Don't correct
alias unison="nocorrect unison "
alias gcalcli="nocorrect gcalcli "
# Todo.sh {{{2
#---------------------------

# path+=('/home/ravi/Documents/Linux/Tarballs/todo.txt_cli-2.11.0/todo.sh')
alias t="todo.sh -cAtd ~/.todo/config"
alias todoedit="$EDITOR ~/.todo/todo.txt"
export TODO_ACTIONS_DIR=/home/ravi/.todo/actions
export TODOTXT_DEFAULT_ACTION=ls
#-----------------------}}}2
#=======================}}}1
# Functions {{{1
#===========================

# http://danishprakash.github.io/2018/08/03/command-line-dir-switcher.html
# Fuzzy directory switcher
function quick_find () {
    dir=$(find ~/Documents -type d -not -path '*/\.*' -maxdepth 3 | fzf)
    cd $dir
    zle reset-prompt
}

zle -N quick_find_widget quick_find # bind the function to a widget

#function echo_blank() {
#  echo
#  echo
#}
#preexec_functions+=echo_blank
#precmd_functions+=echo_blank

# Uses agenda as default parameter unless specified
function gcal () {
	if [ $# -eq 0 ]; then		# If no parameters, default to agenda
		gcalcli agenda $(date +"%D") "11:59pm"
	else
		case "$1" in
			"m")	gcalcli calm	# Calendar month
					;;
			"w")	gcalcli calw	# Calendar week
					;;
			*)		gcalcli ${@:1:2}	# Replay arguments to gcalcli
					;;
		esac
	fi
}


#=======================}}}1
# Completion                {{{
#==========================

# fuzzfy file finder
source /usr/share/fzf/completion.zsh

autoload -Uz compinit
compinit
#=======================}}}
# OH-MY-ZSH	 {{{1
#===============================
# Path to your oh-my-zsh installation.
  export ZSH="/home/ravi/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

#	Powerline & Powerlevel9K
POWERLEVEL9K_MODE=nerdfont-fontconfig
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# OhMyZsh Defaults {{{2
#-------------------------------

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#---------------------------}}}2
# Plugins                   {{{
#-------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
  common-aliases
  python
  zsh-completions
)
# }}}
# User configuration        {{{
#-------------------------------

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
# }}}
# POWERLEVEL9K Customization {{{2
#-------------------------------
# # Segment Separators				{{{3
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
# ------------------------------	}}}3
# #	Icons							{{{3
#------------------
VCS_GIT_GITHUB_ICON=''
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
POWERLEVEL9K_TODO_ICON=ﰧ
POWERLEVEL9K_ROOT_ICON=
POWERLEVEL9K_VCS_TAG_ICON=
POWERLEVEL9K_HOME_ICON=''
# ------------------------------	}}}3
# #	Custom Segments					{{{3
#------------------
prompt_helloworld() {
	local content='Ravi'
	$1_prompt_segment "$0" "$2" "029" "231" "$content" "#"
}

prompt_customtodo() {
  if $(hash todo.sh 2>&-); then
    count=$(todo.sh ls | egrep "TODO: [0-9]+ of ([0-9]+) tasks shown" | awk '{ print $4 }')
    if [[ "$count" = <-> ]]; then
      "$1_prompt_segment" "$0" "$2" "grey50" "$DEFAULT_COLOR" "$count" 'TODO_ICON'
    fi
  fi
}
# ------------------------------	}}}3
# #	Prompt							{{{3
#------------------
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status customtodo background_jobs history)
# ------------------------------	}}}3
# #	Battery							{{{3
#------------------
# # #		Charging
# POWERLEVEL9K_BATTERY_CHARGING_ICON=
POWERLEVEL9K_BATTERY_CHARGING="yellow"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="yellow"
# # #		Charged
POWERLEVEL9K_BATTERY_CHARGED="cyan"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="115"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="black"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
POWERLEVEL9K_BATTERY_ICON=
POWERLEVEL9K_BATTERY_VERBOSE=false

POWERLEVEL9K_BATTERY_STAGES=($' ' $' ' $' ' $' ' $' ')
# ------------------------------	}}}3
# #	Background Jobs					{{{3
#-------------------------
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='grey23'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='080'
# ------------------------------	}}}3
# #	Context							{{{3
#------------------
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='039'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='231'
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='176'
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='231'
# ------------------------------	}}}3
# #	DIR								{{{3
#-------------------------------
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='004'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='231'
POWERLEVEL9K_DIR_HOME_BACKGROUND='006'
POWERLEVEL9K_DIR_HOME_FOREGROUND='231'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='005'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='231'

# Home Directory Icon
POWERLEVEL9K_HOME_FOLDER_ABBREVIATION="%F{231} $(print_icon 'HOME_ICON') %F{231}"
# Directory delimiter
POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{231} $(print_icon 'LEFT_SUBSEGMENT_SEPARATOR') %F{231}"
# Turn off Home & home subfolder icon
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_HOME_ICON=''
# Truncation
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="default"
POWERLEVEL9K_SHORTEN_DELIMITER=''
# ------------------------------	}}}3
# #	DIR_WRITABLE					{{{3
#------------------
#POWERLEVEL9K_DIRWRITABLE_BACKGROUND='204'
#POWERLEVEL9K_DIRWRITABLE_FOREGROUND='015'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='203'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='254'
# ------------------------------	}}}3
# #	History							{{{3
#------------------
POWERLEVEL9K_HISTORY_BACKGROUND='grey15'
POWERLEVEL9K_HISTORY_FOREGROUND='231'
#------------------------------		}}}3
# #	STATUS							{{{3
#------------------
POWERLEVEL9K_STATUS_OK=false

POWERLEVEL9K_STATUS_ERROR_BACKGROUND='204'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='231'
POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_COLOR='015'
# ------------------------------	}}}3
# #	TODO							{{{3
#------------------
POWERLEVEL9K_TODO_BACKGROUND='006'
POWERLEVEL9K_TODO_FOREGROUND='231'
POWERLEVEL9K_CUSTOMTODO_BACKGROUND='006'
POWERLEVEL9K_CUSTOMTODO_FOREGROUND='231'
# ------------------------------	}}}3
# #	VI_MODE							{{{3
#------------------
#POWERLEVEL9K_VI_INSERT_MODE_STRING=''
POWERLEVEL9K_VI_INSERT_MODE_STRING=''
POWERLEVEL9K_VI_COMMAND_MODE_STRING='NORMAL'
# ------------------------------	}}}3
# #	VCS								{{{3
#------------------
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='074'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='231'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='069'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='231'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='135'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='231'
# Customization
POWERLEVEL9K_HIDE_BRANCH_ICON=true
#-------------------------------	}}}3
#-------------------------------	}}}2
#===========================}}}1
# Keybindings               {{{
#==========================

# Bind danishprakash's function to Ctrl+P
bindkey "^f" quick_find_widget

# Source fzf's default keybindings
source /usr/share/fzf/key-bindings.zsh

#=======================}}}
# Terminal Startup Commands {{{
#======================================


# Show calendar agenda
# gcalcli --calendar 'rvikwd7@gmail.com' agenda

# Colorblocks
colorblocks -g 0 -m 20 -M 40 && tput cnorm

# Show todo.txt
todo.sh ls

#=======================}}}
# Anaconda - Conda {{{
#======================================

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/ravi/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
 if [ $? -eq 0 ]; then
     eval "$__conda_setup"
 else
     if [ -f "/home/ravi/miniconda3/etc/profile.d/conda.sh" ]; then
		 . "/home/ravi/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
         CONDA_CHANGEPS1=false conda activate base
     else
         export PATH="/home/ravi/miniconda3/bin:$PATH"
     fi
 fi
 unset __conda_setup
# <<< conda init <<<
#=======================}}}
