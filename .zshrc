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
