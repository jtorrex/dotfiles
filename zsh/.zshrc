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
else
   export EDITOR='nvim'
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
antigen bundle git
antigen bundle tmux
antigen bundle docker
antigen bundle helm
antigen bundle fzf
antigen bundle kubectl
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply

# Enable complex autocompletion
autoload -Uz compinit
compinit

#ALIAS
alias vi='nvim'
alias vim='nvim'
alias vimwiki='vim ~/Sync/wiki/index.md'
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias repair-qemu="sudo rm -rf /etc/libvirt/qemu.old && sudo mv /etc/libvirt/qemu /etc/libvirt/qemu.old && sudo ln -s ~/VirtualMachines/qemu /etc/libvirt/qemu && sudo systemctl restart libvirtd"
alias ssh="TERM=xterm-256color ssh"

# FUNCTIONS
function pomo() {
    arg1=$1
    shift
    args="$*"

    min=${arg1:?Example: pomo 15 Take a break}
    sec=$((min * 60))
    msg="${args:?Example: pomo 15 Take a break}"

    while true; do
        date '+%H:%M' && sleep "${sec:?}" && notify-send -u critical -t 0 -a pomo "${msg:?}"
    done
}

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
