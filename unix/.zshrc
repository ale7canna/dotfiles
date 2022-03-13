# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# disable path verification
ZSH_DISABLE_COMPFIX=true
# Path to your oh-my-zsh installation.
export ZSH=/Users/alessandro.canicatti/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git aws docker docker-compose zsh-autosuggestions
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
export ALTERNATE_EDITOR=""
export EDITOR="vim"
export VISUAL="vim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="kde4 ~/.zshrc"
alias ohmyzsh="kde4 ~/.oh-my-zsh"
alias ls="ls -la -G"
alias xclip="xclip -selection c"
# alias emacs="emacsclient -n -c -a emacs"
alias emax="emacsclient"
alias gl="git log --graph --pretty='%C(Yellow)%h  %C(reset)%ad (%C(Green)%cr%C(reset))%x09 %C(Cyan)%an: %C(reset)%s %C(#FF8C00)%d' --date=short"
alias gla="gl --all"
alias gfr="git fetch --all --prune && git rebase origin/dev"
alias gre="git fetch --all --prune && git rebase origin/master"
alias grei="git fetch --all --prune && git rebase -i origin/master"
alias gpf="git push --force-with-lease"
alias guf="git ls-files -z -o --exclude-standard | xargs -0 "
alias gs="git status -u"
alias gpuf="git branch --show-current | xargs git push -u origin "
alias gfc="git fetch --prune && git checkout"
alias gcb="f(){ git checkout -b  feature/PLAT-\"\$1\"-\"\$2\" ; unset -f f; }; f"
alias glat="git checkout master && git pull"

export PATH=$PATH:/home/ale7canna/minishift:/home/ale7canna/minishift/oc:/home/ale7canna/.local/bin
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv init --path)"
#  eval "$(pyenv virtualenv-init -)"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/opt/libpq/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NODE_ENV=development

# Docker
alias dl="docker logs --follow --tail 20"
alias dc="docker compose"
alias dcl="docker compose logs --follow --tail 20"
alias dfreeze="docker ps -q | xargs docker stop > ~/.containers.tmp"
alias dunfreeze="cat ~/.containers.tmp | xargs docker start"
alias dstop="f(){ docker ps -a | grep \"\$1\" | awk '{print \$1}' | xargs docker stop; unset -f f; }; f"
alias dstart="f(){ docker ps -a | grep \"\$1\" | awk '{print \$1}' | xargs docker start; unset -f f; }; f"

# Python django
alias mig="python manage.py migrate"
alias smig="python manage.py sqlmigrate"
alias mmig="python manage.py makemigrations"

# export PATH="$HOME/.pyenv/bin:$PATH"
# export PATH="/usr/local/bin:$PATH"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"


# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# export CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include"
# export LDFLAGS="-L$(brew --prefix openssl)/include -L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib" 
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
# export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias rn="npx react-native"

alias aws_families="f(){ aws ecs list-task-definition-families --region us-west-2 --status ACTIVE --query families --output table | grep \"\$1\" | grep \"\$2\"; unset -f f; }; f"
aws_tasks() {
    aws ecs describe-tasks \
        --region us-west-2 \
        --cluster $1 \
        --task $(aws ecs list-tasks --region us-west-2 --cluster $1 --family $2 | jq '.taskArns[0]' -r) \
        --query 'tasks[*].containers[*].name' \
        | jq -r '.[0] | map(select(. != "fluent-bit"))';
}

aws_run() {
    aws ecs execute-command \
        --cluster $1 \
        --region us-west-2 \
        --task $(aws ecs list-tasks --region us-west-2 --cluster $1 --family $2 | jq '.taskArns[0] | split("/") as $tmp | $tmp[2]' -r) \
        --container $3 \
        --interactive \
        --command "/bin/bash"
}

drop_host() {
    sed -i -e /^$1/d ~/.ssh/known_hosts
}

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
