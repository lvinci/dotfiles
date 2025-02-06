# Ensure Znap is installed, otherwise clone it
[[ -r ~/tools/znap/znap.zsh ]] || 
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/tools/znap
source ~/tools/znap/znap.zsh

# Set up prompt and plugins
znap prompt sindresorhus/pure
znap install zsh-users/zsh-completions
znap source zsh-users/zsh-history-substring-search

# Configure history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

