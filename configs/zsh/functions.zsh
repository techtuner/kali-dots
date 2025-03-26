#!/bin/zsh


function update_system(){
  sudo apt --fix-broken install -y
  sudo apt update -y
  sudo apt full-upgrade -y
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
}

function virtual(){
VENV_DIR="myenv"

# Checks if the virtual environment exists and creates it if not
if [[ ! -d "$VENV_DIR" ]]; then
    echo "Virtual environment '$VENV_DIR' does not exist. Creating it under the user directory"
    cd ~
    sudo apt install python3-venv -y
    python3 -m venv myenv
    source "$VENV_DIR/bin/activate" 
   return 1
fi

# Check if the Virtual environment is already active
if [[ "$VIRTUAL_ENV" == "$VENV_DIR" ]]; then
    echo "Virtual Environment '$VENV_DIR' is already activated"
    return 0
fi

# Check for deactivate command argument
if [[ "$1" == "deactivate" ]]; then
    deactivate
    echo "Virtual Environment '$VENV_DIR' is deactivated"
else
    cd ~
    source "$VENV_DIR/bin/activate"
    echo "Virtual Environment '$VENV_DIR' is activated"
fi
}

function ghclone() {
    # Default username is 'techtuner' if not provided
    local username=${1:-techtuner}
    
    # Ensure that a repository is provided
    if [[ $# -lt 2 ]]; then
        echo "Usage: ghclone [<username>] <repository>"
        return 1
    fi

    local repository=$2

    # Clone the repository
    gh repo clone "https://github.com/$username/$repository.git" && cd $repository
    
    # Print a reminder if the user isn't authenticated
    set -e "Run gh auth login to configure Github CLI"
}

function ghcreate(){
  local repository=$1
  local visibility=$2
  local username=${1:-techtuner}
  
  if [[ $# -lt 3 ]]; then
    echo "Usage: ghcreate <repository> <visibility> [<username]"
    return 1
  fi

  gh repo create $repository --$visibility
  ghclone $repository

  # Print a reminder if the user is not authenticated
  set -e "Run gh auth login to configure Github CLI"
}

