sudo apt-get update -y && sudo apt-get full-upgrade -y

sudo apt-get install terminator name-that-hash python3-pip curl dnsrecon enum4linux feroxbuster gobuster impacket-scripts nbtscan nikto onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf -y

sudo apt install python3-venv
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git

cp ./.vimrc ~
cp -r ./terminator ~/.config/
cp -r wallpaper ~/Pictures/
cp ./tmux/.tmux.conf ~

sudo cp -r ./fonts/Monaco /usr/share/fonts/truetype
sudo cp -r ./fonts/MonoLisa /usr/share/fonts/truetype
