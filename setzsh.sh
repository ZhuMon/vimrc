sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

sudo apt-get install powerline
sudo apt-get install fonts-powerline

# git clone https://github.com/powerline/fonts.git
# install
# cd fonts
# ./install.sh


git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

source ~/.zshrc

echo "set font to Meslo LG L DZ for powerline"
echo "write in .zshrc \"ZSH_THEME=\"powerlevel9k/powerlevel9k\"\""
echo "write in .zshrc plugins: zsh-syntax-highlighting zsh-autosuggestions"
#reboot
