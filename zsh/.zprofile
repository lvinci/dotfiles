# Initialize Homebrew environment (only for macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set OS-specific environment variables
if [[ "$OSTYPE" == "darwin"* ]]; then
    export CHROME_EXECUTABLE="/Applications/Chromium.app/Contents/MacOS/Chromium"
    export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
    export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools/"
    export PATH="$PATH:$HOME/Library/Android/sdk/cmdline-tools/latest/bin"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export CHROME_EXECUTABLE="$(which google-chrome || which chromium)"
fi

# Add Flutter to PATH (works for both macOS and Linux)
export PATH="$PATH:$HOME/tools/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
