#!/bin/bash

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt-get update -y && sudo apt-get full-upgrade -y

sudo apt-get install bless terminator name-that-hash python3-pip curl dnsrecon enum4linux feroxbuster gobuster lolcat impacket-scripts nbtscan nikto onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf zsh tmux cargo libimage-exiftool-perl code -y

sudo apt install python3-venv -y
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cargo install urlencode
export PATH=/home/techtuner/.cargo/bin/:$PATH


mkdir ~/tools
cd ~/tools
git clone https://github.com/cwinfosec/revshellgen.git
git clone https://github.com/sherlock-project/sherlock.git
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
chmod +x ./pspy64
sudo ln -s ~/tools/pspy64 /usr/bin/pspy
cd ~/tools/revshellgen
chmod +x ./revshellgen.py
sudo ln -s ~/tools/revshellgen/revshellgen.py /usr/bin/revshellgen
cd ~/tools/sherlock
python3 -m pip install -r requirements.txt
chmod +x ./sherlock/sherlock.py
sudo ln -s ~/tools/sherlock/sherlock/sherlock.py /usr/bin/sherlock
cd ../../
cp ./.vimrc ~
cp -r wallpaper ~/Pictures/
cp ./tmux/.tmux.conf ~
cp banner ~
cp -r ./zsh ~

mkdirBoxes(){
  mkdir ~/Desktop/Boxes
  mkdir ~/Desktop/Boxes/HTB && mkdir ~/Desktop/Boxes/HTB/vpns
  mkdir ~/Desktop/Boxes/THM && mkdir ~/Desktop/Boxes/THM/vpns

}

mkdirBoxes

sudo cp -r ./fonts/Fira-Code /usr/share/fonts/truetype
sudo cp -r ./fonts/Monaoc /usr/share/fonts/truetype
sudo cp -r ./fonts/'Anonymous Pro' /usr/share/fonts/truetype

if grep -Fxq "lolcat ~/banner" ~/.zshrc
then
  echo "Exists"
else
  echo "lolcat ~/banner" >> ~/.zshrc
  echo "source ~/zsh/aliases.zsh" >> ~/.zshrc
fi
cp ./techtuner.zsh-theme ~/.oh-my-zsh/custom/themes/
source ~/.zshrc
