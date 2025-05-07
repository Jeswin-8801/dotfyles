#!/bin/bash

sudo apt update
sudo apt -y upgrade
sudo apt install -y -y build-essential snapd
sudo apt -y autoremove

# fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-add-repository universe -y
sudo apt update
sudo apt install -y fish zip
sudo chsh -s /usr/local/bin/fish # set as default shell

# VERSIONS
btop_VERSION="v1.4.0"
pandoc_VERSION="3.6.3"
neovim_VERSION="v0.10.4"
delta_VERSION="0.18.2"
maven_VERSION="3.9.9"
spring_VERSION="3.4.2"
zellij_VERSION="v0.42.2"
tcolors_VERSION="0.3.3"

# btop
echo "Installing btop..."
wget -q -P ~/Downloads "https://github.com/aristocratos/btop/releases/download/${btop_VERSION}/btop-x86_64-linux-musl.tbz"
sudo tar -xjf ~/Downloads/btop-x86_64-linux-musl.tbz -C /opt
cd /opt/btop
sudo make install
cd ~

# batcat
echo "Installing batcat..."
sudo apt install -y bat

# fzf
echo "Installing fzf..."
sudo apt install -y fzf

# fd-find
echo "Installing fd..."
sudo apt install -y fd-find

# duf
echo "Installing duf..."
sudo apt install -y duf

# ripgrep
echo "Installing ripgrep..."
sudo apt install -y ripgrep

# lnav
echo "Installing lnav..."
sudo snap install lnav

# lsd
echo "Installing lsd..."
sudo apt install -y lsd

# pandoc
echo "Installing pandoc..."
wget -q -P ~/Downloads "https://github.com/jgm/pandoc/releases/download/${pandoc_VERSION}/pandoc-${pandoc_VERSION}-1-amd64.deb"
sudo dpkg -i ~/Downloads/pandoc-"${pandoc_VERSION}"-1-amd64.deb

# neofetch
echo "Installing neofetch..."
sudo apt install -y neofetch

# superfile
echo "Installing superfile..."
bash -c "$(curl -sLo- https://superfile.netlify.app/install.sh)"

# cht.sh
echo "Installing cht.sh..."
curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh

# lazygit
echo "Installing lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# lazydocker
echo "Installing lazydocker..."
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# delta
echo "Installing delta..."
wget -q -P ~/Downloads "https://github.com/dandavison/delta/releases/download/${delta_VERSION}/git-delta_${delta_VERSION}_amd64.deb"
sudo dpkg -i ~/Downloads/git-delta_"${delta_VERSION}"_amd64.deb

# neovim
echo "Installing neovim..."
wget -q -P ~/Downloads "https://github.com/neovim/neovim/releases/download/${neovim_VERSION}/nvim-linux-x86_64.tar.gz"
sudo tar -xzf ~/Downloads/nvim-linux-x86_64.tar.gz -C /opt
cd /opt/nvim-linux-x86_64
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
sudo cp /opt/nvim-linux-x86_64/share/man/man1/nvim.1 /usr/share/man/man1
sudo mandb

# oh-my-posh
echo "Installing oh-my-posh..."
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin

# oh-my-tmux
sudo git clone "https://github.com/gpakosz/.tmux.git" /opt/oh-my-tmux
mkdir -p .config/tmux
sudo ln -s /opt/oh-my-tmux/.tmux.conf ~/.config/tmux/tmux.conf
cp /opt/oh-my-tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local

# Zellij
wget -q -P ~/Downloads "https://github.com/zellij-org/zellij/releases/download/${zellij_VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz"
sudo tar -xzf ~/Downloads/zellij-x86_64-unknown-linux-musl.tar.gz -C /usr/local/bin

# Tcolor
wget -q -P ~/Downloads "https://github.com/bcicen/tcolors/releases/download/v${tcolors_VERSION}/tcolors-${tcolors_VERSION}-linux-amd64"
chmod +x "tcolors-${tcolors_VERSION}-linux-amd64"
sudo mv "tcolors-${tcolors_VERSION}-linux-amd64" /usr/local/bin/tcolors

# Others
sudo apt install -y chafa ffmpeg

# Programming Languages and Packages

# Git
git config --global core.autocrlf input
git config --global core.eol lf
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.dark true
git config --global delta.side-by-side true
git config --global delta.line-numbers true
git config --global delta.minus-style "syntax #450a15"
git config --global delta.minus-emph-style "syntax #ff0000"
git config --global delta.plus-style "syntax #004010"
git config --global delta.plus-emph-style "syntax #ff8134"
git config --global delta.hunk-header-style syntax
git config --global delta.interactive.keep-plus-minus-markers false
git config --global merge.conflictstyle zdiff3

# Python
sudo apt install -y python3-venv

# nodejs
if [ -z "$NODE_VER" ]; then
  echo "Nodejs is not installed."
  echo "Installing LTS version of Nodejs..."
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
  sudo npm install -g npm@latest # update to the latest version of npm
fi

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install 24

# NPM Cli Tools
sudo npm install --global \
  tldr \
  speed-test \
  fkill-cli \
  jsome \
  iponmap

# Maven
wget -q -P ~/Downloads https://dlcdn.apache.org/maven/maven-3/"${maven_VERSION}"/binaries/apache-maven-"${maven_VERSION}"-bin.tar.gz
sudo tar -xzf ~/Downloads/apache-maven-"${maven_VERSION}"-bin.tar.gz -C /opt
sudo ln -s /opt/apache-maven-"${maven_VERSION}" /usr/local/bin/apache-maven

# Java
sudo apt install -y openjdk-21-jdk

# Spring boot CLI
wget -q -P ~/Downloads https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/"${spring_VERSION}"/spring-boot-cli-"${spring_VERSION}"-bin.tar.gz
sudo tar -xzf ~/Downloads/spring-boot-cli-"${spring_VERSION}"-bin.tar.gz -C /opt
sudo ln -s /opt/spring-"${spring_VERSION}"/bin/spring /usr/local/bin/spring

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Rust CLI Tools
cargo install \
  spring-initializr-cli \
  zellij-runner \
  fend \
  teehee \
  zoxide \
  pastel \
  dysk

# Zellij Runner
cargo install zellij-runner

# Docker Volume Snapshot
sudo curl -SL https://raw.githubusercontent.com/junedkhatri31/docker-volume-snapshot/main/docker-volume-snapshot -o /usr/local/bin/docker-volume-snapshot
sudo chmod +x /usr/local/bin/docker-volume-snapshot

# Copy and paste all dotfiles
rsync -av --exclude='install.sh' --exclude='README.md' * ~/.config

# Set Timezone
timedatectl set-timezone Asia/Kolkata

# Reloading terminal
source ~/.config/fish/config.fish
