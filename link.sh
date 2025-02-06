# Symlink
stow -t ~/.config .config
stow -t ~ zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    stow -t ~/Library/Application\ Support/VSCodium/User vscodium
else
    stow -t ~/.config/VSCodium/User vscodium
fi
