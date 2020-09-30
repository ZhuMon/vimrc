sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# remember to exit zsh shell before finish install

sudo apt-get install powerline
sudo apt-get install fonts-powerline

#git clone https://github.com/powerline/fonts.git ~/fonts
# install
#~/fonts/install.sh


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

chsh -s /bin/zsh
