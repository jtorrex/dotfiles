# ZSH
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
export ZSH_THEME="robbyrussell"

# ENV
export TERM=xterm-256color
export PATH="$HOME/bin:$PATH"
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export GDK_BACKEND=wayland
export XDG_CONFIG_HOME=~/.config
export PATH="$PATH:/opt/local/bin:$HOME/.local/bin"

# DEV
export GOPATH="$HOME/.local"
export NOTMUCH_CONFIG=~/.config/notmuch/notmuch
export CARGO_HOME="$HOME/.local"
source "$HOME/.cargo/env"

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

# Input method
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# Vim
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'

# Fix Java application renders as a plain gray box
export _JAVA_AWT_WM_NONREPARENTING=1

# Hide emojis
export PIPENV_HIDE_EMOJIS=1
export MINIKUBE_IN_STYLE=0
