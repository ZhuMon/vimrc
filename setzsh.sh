sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

sudo apt-get install powerline
sudo apt-get install fonts-powerline

# cd ..
# git clone https://github.com/powerline/fonts.git
# install
# cd fonts
# ./install.sh


git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv ssh context dir dir_writable vcs)" > ~/.zshrc
echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ram time) " > ~/.zshrc
echo "DEFAULT_USER=\"$USER\"" > ~/.zshrc

source ~/.zshrc

echo "set font to Ubunto Mono Regular"
echo "write in .zshrc \"ZSH_THEME=\"powerlevel9k/powerlevel9k\"\""
echo "write in .zshrc plugins: zsh-syntax-highlighting zsh-autosuggestions"
#reboot
