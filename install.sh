sudo apt-get update -y && sudo apt-get full-upgrade -y

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

sudo apt-get install bless terminator name-that-hash python3-pip curl dnsrecon enum4linux feroxbuster gobuster lolcat impacket-scripts nbtscan nikto onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf -y

sudo apt install python3-venv -y
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp ./.vimrc ~
cp -r wallpaper ~/Pictures/
cp ./tmux/.tmux.conf ~
cp banner ~
cp -r ./zsh ~

sudo cp -r ./fonts/Fira-Code /usr/share/fonts/truetype
echo "lolcat ~/banner" >> ~/.zshrc
echo "source ~/zsh/aliases.zsh" >> ~/.zshrc
source ~/.zshrc
