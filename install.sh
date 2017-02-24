#!/bin/bash

sudo apt update
sudo apt install gcc g++ make -y
sudo apt install vim
sudo apt install -f
sudo apt install curl
sudo apt install wget


#vimrc
cd $HOME/
git clone https://github.com/rapirent/vimrc.git
cd vimrc
sudo sh ./install.sh
cd $HOME
vim << EOF
:PlugUpgrade
:PlugInstall
:PlugUpdate
:quit
EOF

#sublime
wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb
sudo dpkg -i sublime-text_build*.deb
git clone https://github.com/rapirent/my_sublimetext.git
cd my_sublimetext
sudo sh ./install.sh
cd $HOME
sudo rm -r -f sublime-text_build-3126_amd64.deb

#music
wget https://sourceforge.net/projects/deadbeef/files/debian/deadbeef-static_0.7.2-2_amd64.deb/download -O 123.deb
sudo dpkg -i 123.deb
sudo rm -r -f 123.deb

#chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O 123.deb
sudo dpkg -i 123.deb
sudo rm -r -f 123.deb
sudo apt install -f

#zsh
sudo apt install zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
vim .zshrc << EOF
:1,$s/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g
:w!!
:quit
EOF
chsh -s /bin/zsh
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -r -f fonts
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono derivative Powerline 13'
