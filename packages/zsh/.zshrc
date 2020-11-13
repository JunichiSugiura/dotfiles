export PATH=$PATH:$HOME/scripts
export GIT_CLONE_PATH="$HOME"/projects/github.com/JunichiSugiura

alias cat="bat"
alias code="code-insiders"
alias ls="exa"
alias ll="ls -lah --git"
alias lt="ll -TL 3 --ignore-glob=.git"
alias syncsh=". syncsh"
alias cdrepo=". cdrepo"
alias lscmd="ls ~/scripts"

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=$(tty)

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=$(/usr/libexec/java_home)

eval "$(rbenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"
