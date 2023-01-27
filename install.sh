sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install kali-tweaks tmux powerline xclip lolcat name-that-hash -y

cp ./.vimrc ~

cp greeting.txt ~
cp -r wallpaper ~/Pictures/
echo "lolcat ~/greeting.txt" >> ~/.zshrc


sudo cp -r ./fonts/Monaco /usr/share/fonts/truetype
sudo cp -r ./fonts/MonoLisa /usr/share/fonts/truetype
