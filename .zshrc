ZSH_THEME="dallas"

# History settings
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=9999999
export SAVEHIST=9999999

# Shell Options ###############################################################
setopt autocd
setopt INC_APPEND_HISTORY   # immediately append the history file
setopt EXTENDED_HISTORY     # record timestamp in history
setopt HIST_IGNORE_DUPS     # don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS # ignore all duplicate entries
setopt HIST_FIND_NO_DUPS    # do not display a line previously found
setopt HIST_IGNORE_SPACE    # ignore commands that start with space
setopt HIST_SAVE_NO_DUPS    # don't write duplicate entries
setopt SHARE_HISTORY        # share history between sessions
setopt COMPLETE_ALIASES
unsetopt BEEP

# Completion ##################################################################
autoload -Uz compinit
zstyle ':completion:*' menu select=1
compinit -C
fpath=($HOME/.local/share/zsh/completions $fpath)

# Startup Graphic ##################################################################
fastfetch --logo ARCHlabs
echo ""

# Env Variables ##################################################################
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi
export ARCHFLAGS="-arch $(uname -m)"
export ZSH="$HOME/.oh-my-zsh"

# Path ##################################################################
function path_append() {
    local p="$1"
    if [[ -n "$p" && -d "$p" && ":$PATH:" != *":$p:"* ]]; then
        PATH="$PATH:$p"
        export PATH
    fi
}
local_bin="/home/thestackshepherd/.local/bin"
go_bin="/usr/local/go/bin"
dbin="/home/thestackshepherd/devel/dbin"
global_bash="/home/thestackshepherd/devel/global-bash"
path_append "$local_bin"
path_append "$go_bin"
path_append "$dbin"
path_append "$global_bash"

# Misc ZSH Settings ##################################################################
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="false"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 14
DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm-dd-yyyy"

plugins=(
            git
            zsh-autosuggestions
            zsh-syntax-highlighting
            zsh-completions
            fzf
            fzf-tab
            zsh-history-substring-search
            ansible
            docker
            kubectl
            zsh-autopair
            zsh-you-should-use
            command-not-found
            zsh-system-clipboard
            colored-man-pages
            zsh-interactive-cd
            zsh-navigation-tools
            zsh-vi-mode
            zsh-you-should-use
            zsh-autoswitch-virtualenv
            direnv
        )
source $ZSH/oh-my-zsh.sh

# Source Aliases and Functions ###############################################
[ -f ~/.config/zsh/aliases.zsh ] && source ~/.config/zsh/aliases.zsh
[ -f ~/.config/zsh/functions.zsh ] && source ~/.config/zsh/functions.zsh

# Tool Initialization ###############################################
[[ -s /home/thestackshepherd/.autojump/etc/profile.d/autojump.sh ]] && source /home/thestackshepherd/.autojump/etc/profile.d/autojump.sh
[ -n "$(command -v cargo)" ] && source "$HOME/.cargo/env"
[ -n "$(command -v direnv)" ] && eval "$(direnv hook zsh)"
[ -n "$(command -v fzf)" ] && eval "$(fzf --zsh)"
