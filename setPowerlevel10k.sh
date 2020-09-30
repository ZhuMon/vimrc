echo "DEFAULT_USER=\"$USER\"" >> ~/.zshrc
echo "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" >> ~/.zshrc
echo "plugins=(git\n\t\tzsh-syntax-highlighting\n\t\tzsh-autosuggestions)" >> ~/.zshrc

source ~/.zshrc
p10k configure
