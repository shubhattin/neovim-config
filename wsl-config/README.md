# WSL Ubuntu Config

## Basics

### Enablig downloading packages via curl/wget

```bash
sudo rm /etc/resolv.conf
sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'
sudo bash -c 'echo "[network]" > /etc/wsl.conf'
sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'
sudo chattr +i /etc/resolv.conf
```

### Download few Basic packages

```bash
sudo apt update
sudo apt upgrade
sudo apt install sl # just to test
sudo apt install build-essential gdb # compilers
sudo apt install llvm clang lldb lld
sudo apt install cmake
sudo apt install libreadline-dev unzip zip
sudo apt install manpages-dev
sudo apt install software-properties-common
sudo apt update
```

## Installing zsh, Git, GitHub CLI, NVM(Node and NPM), Python

### zsh

```bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install fonts-powerline
```

### NVM(Node Version Manager)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# Install the nvm version you prefer 
# like nvm install 18.12.1
```

### Git

```bash
sudo apt remove git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# Git Credential Manager
# This will help connect to windows credential manager for git
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
# the option above should not be on windows
git config --global init.defaultBranch main # default branch name
git config --global core.autocrlf input
git config --global core.safecrlf true
# ^ We are setting the autocrlf to always to be '\n' instead of '\r\n'

sudo apt install gh # Github CLI
```

### tmux

```bash
sudo apt install tmux
```

Config :- `~/.tmux.conf`

```bash
# enabling mouse
set -g mouse on
# vim mode in scroll
setw -g mode-keys vi
```

### Python

```bash
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
# Use can replace python3.11 with other versions
sudo apt install python3.11
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 2
sudo update-alternatives --config python3
sudo apt install python3-dev python3-pip
# Also install "python3.x-dev" like python3.11-dev
sudo apt install python3-virtualenv
# Also install venv module with command below
# sudo apt install python3.x-venv
sudo apt install python3-tk # tkinter support
sudo apt install python-is-python3
# sudo apt remove python3-apt # this might cause problems
sudo apt install python3-apt # apt manager python

# apt_pkg not found problem fix
# cd /usr/lib/python3/dist-packages
# sudo cp apt_pkg.cpython-310-x86_64-linux-gnu.so apt_pkg.so
```

### _**NeoVim**_

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
# Installing Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Installing ClipBoard tool win32yank.exe
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/

# Grep Tool
sudo apt install ripgrep

# Github Copilot
git clone https://github.com/github/copilot.vim \
   ~/.config/nvim/pack/github/start/copilot.vim

# LazyGit tool
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

### Java

```bash
sudo apt install default-jdk
sudo apt install default-jre
update-alternatives --config java
```

Add `JAVA_HOME` Environment variable to `/etc/environment`.
Write the output path `update-alternatives --config java`

### Kotlin

```bash
curl -s https://get.sdkman.io | bash # SDKMan
sdk install kotlin
```

## Others

### zhc/bash

Import the configs using the command below, add it to both `.bashrc` and `.zshrc`.

```bash
source "$HOME/.config/nvim/wsl-config/cli_config.sh"
# The file below is optional, this is the place where you could define your Environment Variabels
source "$HOME/.config/nvim/wsl-config/my_env.sh"
```

### Optional GUI Apps

```bash
sudo apt install gedit # Editor
sudo apt install nautilus # File Manager
sudo apt install x11-apps -y # like xcalc, xclock, xeyes
sudo apt install tilix # Terminal Tool
# run these gui Apps with '&' at the end to run in background
```

### Powershell (pwsh)

```bash
sudo apt update
sudo apt install -y wget apt-transport-https software-properties-common
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt install -y powershell
```

### Lua

```bash
curl -R -O http://www.lua.org/ftp/lua-5.4.4.tar.gz
tar -zxf lua-5.4.4.tar.gz
cd lua-5.4.4
make linux test
sudo make install

# lua rocks
wget https://luarocks.org/releases/luarocks-3.8.0.tar.gz
tar zxpf luarocks-3.8.0.tar.gz
cd luarocks-3.8.0
./configure --with-lua-include=/usr/local/with-lua-include
make
sudo make install
```

### Julia

```bash
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.1-linux-x86_64.tar.gz
tar zxvf julia-1.8.1-linux-x86_64.tar.gz
mv julia-1.8.1 .julia
rm julia-1.8.1-linux-x86_64.tar.gz
```

### R and Perl

```bash
sudo apt install r-base
sudo apt install perl
```

### 7zip

```bash
sudo apt install p7zip-full p7zip-rar
```

### Android Build Tools and ADB

```bash
sudo apt install android-sdk-build-tools
sudo apt install android-tools-adb
```
