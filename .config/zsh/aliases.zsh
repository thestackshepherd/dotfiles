# cd navigation aliases #########################################################
# .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts #################################################################
alias doc="cd ~/documents"
alias dl="cd ~/downloads"
alias dt="cd ~/desktop"
alias devel="cd ~/devel"
alias imgs="cd ~/pictures"
alias lg=lazygit

# list aliases ###################################################################
alias l="ls -lF" 				# List all files in long format
alias lsd="ls -lF | grep '^d'" 	# List only directories
alias l='ls -lFh'     			# size,show type,human readable
alias la='ls -lAFh'   			# long list,show almost all,show type,human readable
alias lr='ls -tRFh'   			# sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   			# long list,sorted by date,show type,human readable
alias ll='ls -l'       			# long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files, preserving hyperlinks
# Usage: `mergepdf input{1,2,3}.pdf`
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# pacman
alias pacs='sudo pacman -S'							# install package
alias pacr='sudo pacman -Rns' 						# remove package and dependencies
alias pacu='sudo pacman -Syu'						# update system
alias pacss='pacman -Ss'							# search for package
alias pacsc='sudo pacman -Sc' 						# safe cache clear
alias pacscc='pacman -Scc' 							# full cache clear
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'   # remove orphaned packages

# systemd
alias sctl='systemctl'
alias sctl='systemctl status'
alias sctlrestart='sudo systemctl restart'
alias sctlreload='sudo systemctl reload'
alias sctlstart='sudo systemctl start'
alias sctlstop='sudo systemctl stop'

# journalctl
alias jctl='journalctl -xe'

# globals
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

# admin stuff
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# other
alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vim='vim'
alias vi='vim'

# for dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
