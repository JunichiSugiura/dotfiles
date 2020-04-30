alias code="code-insiders"
alias h="hunter"
alias ll='ls -la'
alias syncrc="echo \"🔄 Syncing zsh config...\" && source ~/.zshrc"
alias work="cd $HOME/projects/github.com/LukeSugiura/ && echo \"💻 Happy coding!\""

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=$(tty)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="$HOME/.cargo/bin:$PATH"

if [ -e ~/.config/lf/lfcd.sh ]; then
    source ~/.config/lf/lfcd.sh
fi