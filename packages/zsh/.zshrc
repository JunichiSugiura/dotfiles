export PATH=$PATH:$HOME/scripts
export GIT_CLONE_PATH="$HOME"/projects/github.com/JunichiSugiura

alias cat="bat"
alias code="open -a 'Visual Studio Code'"
alias ls="exa"
alias ll="ls -lah --git"
alias lt="ll -TL 3 --ignore-glob=.git"
alias syncsh=". syncsh"
alias cdrepo=". cdrepo"
alias lscmd="ls ~/scripts"
alias pr="gh pr view --web"
alias prysm="~/prysm/prysm.sh"
alias lldlib="open ~/Library/Application\ Support/Electron"
alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
alias vi="nvim"

eval "$(starship init zsh)"

. /usr/local/opt/asdf/asdf.sh

export GPG_TTY=$(tty)

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
