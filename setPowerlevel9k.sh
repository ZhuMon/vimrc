echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv ssh context dir dir_writable vcs)" >> ~/.zshrc
echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ram time) " >> ~/.zshrc
echo "DEFAULT_USER=\"$USER\"" >> ~/.zshrc

source ~/.zshrc

echo "set font to Ubunto Mono Regular"
echo "ZSH_THEME=\"powerlevel9k/powerlevel9k\"" >> ~/.zshrc
echo "plugins=(git\n\t\tzsh-syntax-highlighting\n\t\tzsh-autosuggestions)" >> ~/.zshrc
echo "reboot"
