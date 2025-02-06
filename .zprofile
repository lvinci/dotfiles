# Initialize Homebrew environment (only for macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set OS-specific environment variables
if [[ "$OSTYPE" == "darwin"* ]]; then
    export CHROME_EXECUTABLE="/Applications/Chromium.app/Contents/MacOS/Chromium"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools/"  # Android SDK (macOS only)
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export CHROME_EXECUTABLE="$(which google-chrome || which chromium)"
fi

# Add Flutter to PATH (works for both macOS and Linux)
export PATH="$PATH:$HOME/tools/flutter/bin"

# General aliases
alias vim="nvim"  # Use Neovim instead of Vim
alias v="vim ."
alias ls="ls -G"  # For macOS
alias ll="ls -lh"  # Long format with file sizes
alias la="ls -lah"  # Show hidden files too
alias lt="ls -lt --color=auto"  # Sort by modification time

# 📌 Git Aliases
alias gs="git status -sb"  # Short status
alias gcm="git commit -m"  # Commit with message
alias gacp="git add . && git commit -m"  # Add & commit
alias gp="git push"  # Push current branch
alias gfr="git fetch --all && git rebase"  # Fetch & rebase
alias gpl="git pull --rebase"  # Pull latest changes
alias grh="git reset --hard HEAD"  # Reset to last commit
alias gbd="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"  # Delete merged branches
alias gamend="git commit --amend --no-edit"  # Fix last commit message
alias gl='git log --graph --abbrev-commit --decorate \
  --format=format:"%C(auto)%h%C(reset) - %C(bold green)(%cr)%C(reset) %C(white)%s%C(reset) %C(dim white)- %C(bold blue)<%an>%C(reset) %C(auto)%d%C(reset)" --all'  # Pretty Git log
alias gundo="git reset --soft HEAD~1"  # Undo last commit (keep changes)
alias gb="git for-each-ref --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:green)%(committerdate:relative)%(color:reset)' refs/heads/"  # List branches sorted by last commit date

# 📌 Useful Git Functions
gsw() { git switch $(git branch --sort=-committerdate | fzf); }  # Fuzzy switch branches
gcd() { cd $(find ~/ -name ".git" | sed 's|/.git||' | fzf); }  # Fuzzy navigate to Git project
gsearch() { git log --oneline --all | fzf | awk '{print $1}'; }  # Fuzzy search commits

# 📌 Flutter Aliases
alias ftest="flutter test -r github"  # Run tests
alias fgen="dart run build_runner build --delete-conflicting-outputs"  # Generate JSON serialization files
alias frun="flutter run"  # Run Flutter app

# 📌 Golang Aliases
alias grun="go run ."  # Run Go app
alias gbuild="go build -o main"  # Build Go binary
alias gtest="go test ./..."  # Test Go code
alias gfmt="gofmt -w ."  # Format Go code
alias gclean="go clean -modcache"  # Clean Go cache
alias goutdated="go list -u -m all"  # List outdated dependencies
alias gupdate="go get -u ./..."  # Update all dependencies
alias genv="go env"  # Show Go environment

# Function to update system tools with clean logging
upd8() {
    # ANSI escape codes for colors
    BOLD="\033[1m"
    PURPLE="\033[35m"
    GREEN="\033[32m"
    RESET="\033[0m"

    echo -e "${BOLD}${PURPLE}🔄 Starting system update...${RESET}"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo -n "${BOLD}${PURPLE}📦 Checking for macOS system updates... ${RESET}\n"
        softwareupdate -l
        echo -e "${BOLD}${PURPLE}🍺 Upgrading installed Homebrew packages...${RESET}"
        brew upgrade
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo -e "${BOLD}${PURPLE}📦 Upgrading installed system packages...${RESET}"
        if command -v apt &>/dev/null; then
            sudo apt update && sudo apt upgrade -y
        elif command -v yay &>/dev/null; then
            yay -Syu --noconfirm
        fi
    fi

    if command -v flutter &>/dev/null; then
        echo -e "${BOLD}${PURPLE}🚀 Updating Flutter SDK...${RESET}"
        flutter upgrade && flutter precache
    fi

    if command -v rustup &>/dev/null; then
        echo -e "${BOLD}${PURPLE}🦀 Updating Rust toolchain...${RESET}"
        rustup update
    fi

    echo -e "${BOLD}${GREEN}✅ Update complete!${RESET}"
}

export -f upd8

