source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
cp
git
fzf
pip
thefuck
ripgrep
autojump
git-extras
compleat
zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
docker
docker-compose
django
EOBUNDLES

# load the theme.
antigen theme frontcube

# tell Antigen that you're done.
antigen apply

# set vim bindings
bindkey -v
# change directories without cd
setopt autocd

# source aliases
source ~/.aliases
# source env vars
source ~/.zshenv
