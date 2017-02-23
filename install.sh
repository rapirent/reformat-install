#!/bin/bash

sudo apt install gcc g++ make -y

#vimrc
cd $HOME/
sudo apt install -y git
git clone https://github.com/rapirent/vimrc.git
cd vimrc
./install.sh
cd $HOME
rm -r vimrc
vim << EOF
:PlugUpgrade
:PlugInstall
:PlugUpdate
:quit
EOF

#sublime
git clone https://github.com/rapirent/my_sublimetext.git
cd my_sublimetext
./install.sh
cd $HOME

#music
$music = "https://sourceforge.net/projects/deadbeef/files/debian/deadbeef-static_0.7.2-2_amd64.deb/download"
wget $music -O 123.deb
sudo dpkg -i 123.deb
rm -r 123.deb

#chrome
$chrome = "https://www.google.com.tw/chrome/browser/thankyou.html?platform=linux"
wget $chrome -O 123.deb
sudo dpkg -i 123.deb
rm -r 123.deb

#zsh
sudo apt install zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
vim .zshrc << EOF
:1,$s/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g
:quit
EOF
chsh -s /bin/zsh
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -r fonts
$font = 'Ubuntu Mono derivative Powerline 13'
gsettings set org.gnome.desktop.interface monospace-font-name $font