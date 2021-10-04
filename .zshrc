#ZSH PREFS
export TERM=xterm-256color
export GOPATH=$HOME/.go/

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

#INIT KEYCHAIN
eval $(keychain --eval --quiet ~/.ssh/ed25519-torrex-key)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#ANTIGEN
source /usr/share/zsh/share/antigen.zsh
antigen theme romkatv/powerlevel10k
antigen use oh-my-zsh
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

# POWELEVEL10K
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=11
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=".."
POWERLEVEL9K_FOLDER_ICON=""
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
POWERLEVEL9K_DIR_HOME_BACKGROUND="014"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="014"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="014"
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='178'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="deepskyblue4"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="grey11"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="red3"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='purple'
POWERLEVEL9K_SHOW_CHANGESET=true

autoload -Uz compinit
compinit

#ALIAS
alias vim='nvim'
alias vi='nvim'
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias repair-qemu="sudo rm -rf /etc/libvirt/qemu.old && sudo mv /etc/libvirt/qemu /etc/libvirt/qemu.old && sudo ln -s ~/VirtualMachines/qemu /etc/libvirt/qemu && sudo systemctl restart libvirtd"
alias es='setxkbmap es'
alias us='setxkbmap us'
alias ssh="TERM=xterm-256color ssh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zxcv90/Workspace/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zxcv90/Workspace/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zxcv90/Workspace/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zxcv90/Workspace/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function pomo() {
    arg1=$1
    shift
    args="$*"

    min=${arg1:?Example: pomo 15 Take a break}
    sec=$((min * 60))
    msg="${args:?Example: pomo 15 Take a break}"

    notify-send -u low -t 2000 "Running Pomodoro for $min min"

    while true; do
        sleep "${sec:?}" && echo "${msg:?}" && notify-send -u critical -t 0 "${msg:?}"
    done
}

