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
alias fd="fd -H"
alias keycodes="cat /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/Headers/Events.h"

 . /usr/local/opt/asdf/asdf.sh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export GPG_TTY=$(tty)

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

export PATH=$PATH:$(yarn global bin)
export FZF_DEFAULT_COMMAND="rg --files --hidden -l -g '!.git/*' -g '!node_modules/*'"
export FZF_DEFAULT_OPTS="-m --height 100% --border --preview 'cat {}'"

. $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

