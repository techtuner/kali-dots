#!/bin/bash

cwd=$(pwd)

update_system(){
sudo apt install --fix-broken -y
sudo apt update -y
sudo apt full-upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
}

installing_apps(){
	sudo apt install cargo gcc gdb cmake make git curl wget net-tools software-properties-common python3 python3-pip python3-venv golang gh routersploit netexec autorecon dex2jar jd-gui jadx apktool apksigner hexedit bytecode-viewer redis-tools dnsrecon gobuster feroxbuster nikto nmap sslscan libimage-exiftool-perl python3-impacket ghidra strace ltrace steghide nuclei afl++ protobuf-compiler ruby whatweb osrframework sherlock seclists sublist3r wifite wifiphisher dnsmasq kitty fzf fd-find ripgrep zoxide netexec mitmproxy default-jdk default-jre hexcurse gradle tmux bat gh nodejs npm -y

cargo install urlencode rustscan eza

mkdir -p ~/tools/
mkdir -p ~/workspace/


cd ~/tools
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
sudo chmod +x ./pspy64
sudo ln -s ~/tools/pspy64 /usr/bin/pspy

cd ~/tools
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
go install github.com/fullstorydev/grpcui/cmd/grpcui@latest
go install github.com/ropnop/kerbrute@latest
go install github.com/tomnomnom/assetfinder@latest
sudo ln -s ~/go/bin/kerbrute /usr/bin/kerbrute
sudo ln -s ~/go/bin/grpcui /usr/bin/grpcui
sudo ln -s ~/go/bin/grpcurl /usr/bin/grpcurl
sudo ln -s ~/go/bin/assetfinder /usr/bin/assetfinder

pip3 install drozer frida-tools --break-system-packages 

cd ~/tools
wget https://github.com/carlospolop/PEASS-ng/releases/download/20240204-ab87b191/linpeas.sh
sudo chmod +x linpeas.sh
sudo ln -s ~/tools/linpeas.sh /usr/bin/linpeas

cd ~/tools
wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage nvim.appimage
sudo chmod +x nvim.appimage
sudo ln -s ~/tools/nvim.appimage /usr/bin/nvim


cd $cwd
sudo cp -r $cwd/fonts/'Fira Code' /usr/share/fonts/truetype
cp -r $cwd/wallpapers/ ~/Pictures/
cp -r $cwd/configs/nvim ~/.config/
cp -r $cwd/configs/kitty ~/.config/
cp -r $cwd/configs/zsh ~
cp -r $cwd/configs/zsh/.zshrc ~ && rm -rf ~/zsh/.zshrc
cp -r $cwd/configs/tmux/ ~
sudo cp -r $cwd/configs/dnsmasq/techtuner.conf /etc/dnsmasq.d/
}


main(){
	update_system
	installing_apps
}

main
echo "CHANGE the nameserver to 127.0.0.1 in /etc/resolv.conf"
