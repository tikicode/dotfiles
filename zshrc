# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(
asdf
brew
bundler
cp
docker
docker-compose
git
node
npm
macos
python
ruby
tmux
yarn
)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias katyal="ssh arijit@10.162.34.146"
alias ugrad="ssh -l anukala1 ugradx.cs.jhu.edu"
alias nv="nvim"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/avnukala/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/avnukala/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/avnukala/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/avnukala/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/avnukala/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/avnukala/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/avnukala/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/avnukala/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# MacPorts Installer addition on 2022-12-08_at_08:09:37: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

. "$HOME/.cargo/env"
export PYTHONPATH="/Users/avnukala/Library/CloudStorage/OneDrive-JohnsHopkins/Documents/JHU/Research\ -\ Katyal/order":$PYTHONPATH
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"


export NVM_DIR="$HOME/.reflex/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/avnukala/.reflex/.bun/_bun" ] && source "/Users/avnukala/.reflex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.reflex/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias config='/usr/bin/git --git-dir=/Users/avnukala/.config/ --work-tree=/Users/avnukala'

# opam configuration
[[ ! -r /Users/avnukala/.opam/opam-init/init.zsh ]] || source /Users/avnukala/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# OpenAI API key NLP
export OPENAI_API_KEY="BWRrbv43rIc4tTLxwW2eT3BlbkFJvJZ3m9EXGUBPzaLqDoFz"
