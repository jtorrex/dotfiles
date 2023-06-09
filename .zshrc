#ZSH PREFS
export TERM=xterm-256color
export GOPATH=$HOME/.go/
export PATH="$HOME/bin:$PATH"
export NOTMUCH_CONFIG=~/.config/notmuch/notmuch
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
ZSH_THEME="robbyrussell"

# Export editor for ssh
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
   export KUBE_EDITOR=nvim
else
   export EDITOR='nvim'
   export KUBE_EDITOR=nvim
fi

 # Enable ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi

if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

#ANTIGEN
source ~/.antigen.sh
antigen bundle ansible
antigen bundle aws
antigen bundle colored-man-pages
antigen bundle docker
antigen bundle fzf
antigen bundle git
antigen bundle helm
antigen bundle history
antigen bundle kubectl
antigen bundle terraform
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply

# Enable complex autocompletion
autoload -Uz compinit
compinit

#Aliases
source $HOME/.aliases

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jtorrex/Workspace/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jtorrex/Workspace/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jtorrex/Workspace/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jtorrex/Workspace/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
