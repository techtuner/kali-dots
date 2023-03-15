import os
from pathlib import Path
import subprocess
current_path = os.getcwd()
user = os.getlogin()
home = f"/home/{user}"


def code_neovim():
    print('Adding Code Installation')
    os.system("wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \n sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ \n sudo sh -c 'echo \"deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main\" > /etc/apt/sources.list.d/vscode.list' \n rm -rf packages.microsoft.gpg")
    print('Add Neovim and Install Neovim')
    os.system("wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb \n sudo dpkg -i nvim-linux64.deb \n rm -rf nvim-linux64.deb")
    os.system(f"chmod +x {current_path}/nvm_ins.sh")
    subprocess.call(f"./nvm_ins.sh")
    
	
def update_upgrade():
    os.system('sudo apt-get update -y && sudo apt-get full-upgrade -y && sudo apt autoremove -y')

def install_apps():
    apps = "bless terminator name-that-hash python3-pip curl dnsrecon enum4linux python3-virtualenv feroxbuster gobuster impacket-scripts nbtscan nikto onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf tmux cargo libimage-exiftool-perl code golang-go"
    apps_list = apps.split(" ")
    for app in apps_list:
        os.system(f'sudo apt-get install {app} -y')

def autorecon_urlencode():
    os.system("python -m pip install pip==22.2.2 --upgrade --break-system-packages")
    os.system(f"export PATH={home}/.local/bin:$PATH")
    print("Installing Autorecon")
    os.system("sudo apt-get install python3-virtualenv -y")
    os.system("sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git")
    print("Installing URL Encode")
    os.system("cargo install urlencode")
    os.system(f"export PATH={home}/.cargo/bin/:$PATH")

def boxes():
    if Path(f"{home}/Desktop/Boxes/").exists():
        pass
    else:
        os.mkdir(f"{home}/Desktop/Boxes")
        os.mkdir(f"{home}/Desktop/Boxes/HTB")
        os.mkdir(f"{home}/Desktop/Boxes/THM")

def install_tools():
    tools_path = f"{home}/tools/"
    if not Path(tools_path).exists():
        os.mkdir(tools_path)
        os.chdir(f"{tools_path}")
        os.system("git clone https://github.com/cwinfosec/revshellgen.git")
        os.system(f"cd {tools_path}/revshellgen")
        os.system(f"chmod +x {tools_path}/revshellgen/revshellgen.py")
        os.system(f"sudo ln -s {tools_path}/revshellgen/revshellgen.py /usr/bin/revshellgen")
        os.chdir(tools_path)
        os.system("git clone https://github.com/sherlock-project/sherlock.git")
        os.chdir(f"{tools_path}/sherlock")
        os.system(f"python3 -m pip install -r requirements.txt")
        os.system(f"chmod +x {home}/tools/sherlock/sherlock/sherlock.py")
        os.system(f"sudo ln -s {home}/tools/sherlock/sherlock/sherlock.py /usr/bin/sherlock")
        os.chdir(tools_path)
        os.system("wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64")
        os.system("chmod +x ./pspy64")
        os.system(f"sudo ln -s {tools_path}/pspy64 /usr/bin/pspy")   
    else:
        print('Tools folder exists')
        os.chdir(tools_path)
        if Path(f"{tools_path}/revshellgen").exists():
            pass
        else:
            os.chdir(f"{tools_path}")
            os.system("git clone https://github.com/cwinfosec/revshellgen.git")
            os.system(f"cd {tools_path}/revshellgen")
            os.system(f"chmod +x {tools_path}/revshellgen/revshellgen.py")
            os.system(f"sudo ln -s {tools_path}/revshellgen/revshellgen.py /usr/bin/revshellgen")

            os.chdir(tools_path)
        if Path(f"{tools_path}/sherlock").exists():
            pass
        else:
            os.chdir(tools_path)
            os.system("git clone https://github.com/sherlock-project/sherlock.git")
            os.chdir(f"{tools_path}/sherlock")
            os.system(f"python3 -m pip install -r requirements.txt")
            os.system(f"chmod +x {home}/tools/sherlock/sherlock/sherlock.py")
            os.system(f"sudo ln -s {home}/tools/sherlock/sherlock/sherlock.py /usr/bin/sherlock")
            os.chdir(tools_path)
        if Path(f"{tools_path}/pspy64").exists():
            pass
        else:
            os.chdir(tools_path)
            os.system("wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64")
            os.system("chmod +x ./pspy64")
            os.system(f"sudo ln -s {tools_path}/pspy64 /usr/bin/pspy")   
            os.chdir(tools_path)
    os.chdir(current_path)
    
def copy_fonts():
    os.system(f"sudo cp -r {current_path}/fonts/Fira-Code /usr/share/fonts/truetype")
    os.system(f"sudo cp -r {current_path}/fonts/Monaco /usr/share/fonts/truetype")
    os.system(f"sudo cp -r {current_path}/fonts/'Anonymous Pro' /usr/share/fonts/truetype")
    os.system(f"sudo cp -r {current_path}/fonts/'Dank Mono' /usr/share/fonts/opentype")

def copy_configs():
    os.system(f"cp -r {current_path}/wallpapers {home}/Pictures/")
    os.system(f"cp -r {current_path}/nvim/ {home}/.config/")
    os.system(f"cp -r {current_path}/terminator/ {home}/.config/")
    os.system(f"cp -r {current_path}/zsh/ {home}")
    os.system(f"cp {current_path}/.vimrc {home}")
    os.system(f"cp {current_path}/tmux/.tmux.conf {home}")
    os.system(f"echo 'source ~/zsh/aliases.zsh' >> {home}/.zshrc")
    os.system(f"source {home}/.zshrc")
    os.system("git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim")

def code_extensions():
    extensions = ["formulahendry.auto-complete-tag",
"beardedbear.beardedtheme",
"formulahendry.auto-rename-tag",
"naumovs.color-highlight",
"miguelsolorio.fluent-icons",
"golang.go",
"naumovs.color-highlight",
"visualstudioexptteam.vscodeintellicode",
"ritwickdey.liveserver",
"sumneko.lua",
"yzhang.markdown-all-in-one",
"christian-kohler.path-intellisense",
"esbenp.prettier-vscode",
"usernamehw.errorlens",
"wix.vscode-import-cost",
"miguelsolorio.symbols",
"MS-vsliveshare.vsliveshare",
"steoates.autoimport",
"streetsidesoftware.code-spell-checker",
"dbaeumer.vscode-eslint",
"bradlc.vscode-tailwindcss",
"ms-python.python",
"rust-lang.rust-analyzer",
"ms-python.black-formatter",
"aaron-bond.better-comments",
"equinusocio.vsc-community-material-theme"
]
    for extension in extensions:
        os.system(f"code --install-extension {extension}")
    os.system(f"cp {current_path}/code/settings.json {home}/.config/Code/User/")
    os.system(f"cp {current_path}/code/keybindings.json {home}/.config/Code/User/")


code_neovim()
update_upgrade()
install_apps()
autorecon_urlencode()
boxes()
copy_fonts()
copy_configs()
code_extensions()
install_tools()
