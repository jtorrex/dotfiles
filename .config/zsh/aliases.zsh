# ls
alias l='ls -Flha'
alias ll='ls -Flha'

# interactive
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# verbose
alias mkdir='mkdir -p -v'
alias rmdir='rmdir -v'

# git
alias lg='lazygit'
alias g='git'
alias gs='git status --short'
alias gS='git status'
alias gd='git diff'
alias gD='git diff --staged'
alias ga='git add'
alias gA='git add --update'
alias gc='git commit'
alias gp='git push'
alias gP='git push --set-upstream origin HEAD'
alias gl='git log --all --decorate --oneline --graph'
alias gL='git log -p'
alias gt='git ls-tree -r "$(git rev-parse --abbrev-ref HEAD)" --name-only | tree --fromfile'

# tmux
alias t='tmux'
alias ta='tmux attach'

# less
alias less='less --raw-control-chars'

# feh
alias feh='feh --scale-down --auto-zoom'

# nvim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimwiki='vim ~/Sync/wiki/index.md'

# kubectl
source <(kubectl completion zsh)
alias k='kubectl'
alias kgp='kubectl get pods -A'
alias kc='kubectx'
alias kn='kubens'

# flux
source <(flux completion zsh)
alias fgk='flux get kustomizations'

# cheat
cheat () {
    curl "cheat.sh/$1"
}

# calculator
alias calc='python -i -c "from math import *"'

# get GPLv3
alias gplv3='curl "https://www.gnu.org/licenses/gpl-3.0.md" > LICENSE.md'

# Miscelanea
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias ssh="TERM=xterm-256color ssh"
alias cdwork="cd ~/Workspace/"
alias cdrepos="cd ~/Workspace/repositories"
alias cdconfig="cd ~/.config/"
alias cddots="cd ~/Workspace/repositories/dotfiles"
alias cdhomelab="cd ~/Workspace/repositories/homelab"
alias vimhomelab="vim ~/Workspace/repositories/homelab/"
alias vimconfig="vim ~/.config/"
alias vimdots="vim ~/Workspace/repositories/dotfiles"
alias startsession="~/.local/bin/init"
alias gpgencrypt="gpg --encrypt --sign -r"
alias gpgdecrypt="gpg --decrypt"
alias kvmlist="watch sudo virsh list --all"

# Vagrant as a function
vvagrant(){
  docker run -it --rm \
    -e LIBVIRT_DEFAULT_URI \
    -v /var/run/libvirt/:/var/run/libvirt/ \
    -v ~/.vagrant.d:/.vagrant.d \
    -v $(realpath "${PWD}"):${PWD} \
    -w "${PWD}" \
    --network host \
    vagrantlibvirt/vagrant-libvirt:latest \
      vagrant $@
}

# Machines
alias hpcgw="sshuttle -NHr gateway"
