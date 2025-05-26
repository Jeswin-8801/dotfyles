#!/bin/bash

if [ "$EUID" -eq 0 ]; then
  echo "This script is not meant to be run as root"
  exit
fi

USER_HOME_DIR="/home/$(sudo who am i | awk '{print $1}')"
DOWNLOADS_DIR="${USER_HOME_DIR}/Downloads"
LOGFILE="script.log"

if ! [ -d "$DOWNLOADS_DIR" ]; then
  echo "Creating dir '$DOWNLOADS_DIR/' if not Exists"
  mkdir -p $DOWNLOADS_DIR
fi

if ! [ -d ~/.config ]; then
  echo "Creating dir '~/.config/' if not Exists"
  mkdir -p ~/.config
fi

# Save original stdout to FD 3
exec 3>&1

# Redirect stdout and stderr to log file
exec >"$LOGFILE" 2>&1

print_status() {
  if [ $1 -eq 0 ]; then
    echo "  ✅  '$2' succeeded." >&3
  else
    echo "  ❗ '$2' failed!" >&3
  fi
  echo ""
}

echo -e "\nUpdating and Upgrading Packages..." >&3
sudo apt update
sudo apt -y upgrade
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
  libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
# sudo apt -y autoremove

# fish
echo -e "\nAdding fish apt repo and installing from it..." >&3
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-add-repository universe -y
sudo apt update
sudo apt install -y fish zip

# VERSIONS
pandoc_VERSION="3.6.3"
delta_VERSION="0.18.2"
maven_VERSION="3.9.9"
spring_VERSION="3.4.2"
zellij_VERSION="v0.42.2"
tcolors_VERSION="0.3.3"
neovim_VERSION="v0.11.1"
lnav_VERSION="0.12.4"
superfile_VERSION="v1.2.1"

# btop
# Use echo >&3 to print only to the console
echo -e "\nInstalling btop..." >&3
sudo apt install -y btop
print_status $? "Install btop"

# batcat
echo -e "\nInstalling batcat..." >&3
sudo apt install -y bat
print_status $? "Install bat"

# fzf
echo -e "\nInstalling fzf..." >&3
sudo apt install -y fzf
print_status $? "Install fzf"

# fd-find
echo -e "\nInstalling fd..." >&3
sudo apt install -y fd-find
print_status $? "Install fd-find"

# duf
echo -e "\nInstalling duf..." >&3
sudo apt install -y duf
print_status $? "Install duf"

# ripgrep
echo -e "\nInstalling ripgrep..." >&3
sudo apt install -y ripgrep
print_status $? "Install ripgrep"

# lnav
echo -e "\nInstalling lnav..." >&3
wget -q -P "$DOWNLOADS_DIR" "https://github.com/tstack/lnav/releases/download/v${lnav_VERSION}/lnav-${lnav_VERSION}-linux-musl-x86_64.zip"
print_status $? "Download lnav zipped binary from GitHub"
sudo unzip "$DOWNLOADS_DIR/lnav-${lnav_VERSION}-linux-musl-x86_64.zip" -d /opt
print_status $? "Unzip lnav binary"
sudo ln -s /opt/lnav-${lnav_VERSION}/lnav /usr/local/bin/lnav
print_status $? "Create lnav symbolic link"

# lsd
echo -e "\nInstalling lsd..." >&3
sudo apt install -y lsd
print_status $? "Install lsd"

# pandoc
echo -e "\nInstalling pandoc..." >&3
wget -q -P "$DOWNLOADS_DIR" "https://github.com/jgm/pandoc/releases/download/${pandoc_VERSION}/pandoc-${pandoc_VERSION}-1-amd64.deb"
print_status $? "Download pandoc binary from GitHub"
sudo dpkg -i "$DOWNLOADS_DIR/pandoc-${pandoc_VERSION}-1-amd64.deb"
print_status $? "Install pandoc"

# neofetch
echo -e "\nInstalling neofetch..." >&3
sudo apt install -y neofetch
print_status $? "Install neofetch"

# Superfile
echo -e "\nInstalling spf..." >&3
wget -q -P "$DOWNLOADS_DIR" "https://github.com/yorukot/superfile/releases/download/${superfile_VERSION}/superfile-linux-${superfile_VERSION}-amd64.tar.gz"
print_status $? "Download spf zipped binary from GitHub"
sudo tar --strip-components=2 -xzf "$DOWNLOADS_DIR/superfile-linux-${superfile_VERSION}-amd64.tar.gz" -C /opt
print_status $? "Unzip spf binary"
sudo ln -s /opt/superfile-linux-${superfile_VERSION}-amd64/spf /usr/local/bin/spf
print_status $? "Create spf symbolic link"

# cht.sh
echo -e "\nInstalling cht.sh..." >&3
curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
print_status $? "Install cht.sh"

# Lazygit
echo -e "\nInstalling lazygit..." >&3
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
wget -q -P "$DOWNLOADS_DIR" "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
print_status $? "Download lazygit zipped binary from GitHub"
sudo tar -xzf "$DOWNLOADS_DIR/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" -C /opt
print_status $? "Unzip lazygit binary"
sudo ln -s /opt/lazygit /usr/local/bin/lazygit
print_status $? "Create lazygit symbolic link"

# lazydocker
echo -e "\nInstalling lazydocker..." >&3
export DIR=/usr/local/bin
cd "$DOWNLOADS_DIR"
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
print_status $? "Install lazydocker"
cd -

# delta
echo -e "\nInstalling delta..." >&3
wget -q -P "$DOWNLOADS_DIR" "https://github.com/dandavison/delta/releases/download/${delta_VERSION}/git-delta_${delta_VERSION}_amd64.deb"
print_status $? "Download delta binary from GitHub"
sudo ar -xzf "$DOWNLOADS_DIR/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" -C /opt
sudo dpkg -i $DOWNLOADS_DIR/git-delta_"${delta_VERSION}"_amd64.deb
print_status $? "Install delta"

# neovim
echo -e "\nInstalling neovim..." >&3
wget -q -P "$DOWNLOADS_DIR" "https://github.com/neovim/neovim/releases/download/${neovim_VERSION}/nvim-linux-x86_64.tar.gz"
print_status $? "Download neovim zipped binary from GitHub"
sudo tar -xzf $DOWNLOADS_DIR/nvim-linux-x86_64.tar.gz -C /opt
print_status $? "Unzip neovim binary"
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
print_status $? "Create neovim symbolic link"
sudo cp /opt/nvim-linux-x86_64/share/man/man1/nvim.1 /usr/share/man/man1
sudo mandb
print_status $? "Populate neovim man pages"

# oh-my-posh
echo -e "\nInstalling oh-my-posh..." >&3
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin
print_status $? "Install oh-my-posh"

# Zellij
echo -e "\nInstalling Zellij..." >&3
wget -q -P "$DOWNLOADS_DIR" "https://github.com/zellij-org/zellij/releases/download/${zellij_VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz"
print_status $? "Download zellij zipped binary from GitHub"
sudo tar -xzf $DOWNLOADS_DIR/zellij-x86_64-unknown-linux-musl.tar.gz -C /usr/local/bin
print_status $? "Unzip neovim binary to /usr/local/bin"

# Tcolor
echo -e "\nInstalling tcolor..." >&3
wget -q -P "$DOWNLOADS_DIR" "https://github.com/bcicen/tcolors/releases/download/v${tcolors_VERSION}/tcolors-${tcolors_VERSION}-linux-amd64"
print_status $? "Download tcolor zipped binary from GitHub"
chmod +x "$DOWNLOADS_DIR/tcolors-${tcolors_VERSION}-linux-amd64"
sudo mv "$DOWNLOADS_DIR/tcolors-${tcolors_VERSION}-linux-amd64" /usr/local/bin/tcolors
print_status $? "Install tcolor"

# Others
echo -e "\nInstalling chafa, ffmpeg..." >&3
sudo apt install -y chafa ffmpeg
print_status $? "Install chafa, ffmpef"

# Programming Languages and Packages

# Python
echo -e "\nInstalling python3-venv..." >&3
sudo apt install -y python3-venv
print_status $? "Install python3-venv"

# Pyenv
echo -e "\nInstalling pyenv (For maintaining python versions)..." >&3
curl https://pyenv.run | bash
print_status $? "Install pyenv"

# nodejs
if [ -z "$NODE_VER" ]; then
  echo -e "\nNodejs is not installed." >&3
  echo "Installing LTS version of Nodejs..." >&3
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
  print_status $? "Install nodejs"
  sudo npm install -g npm@latest # update to the latest version of npm
  print_status $? "Install npm"
fi

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install --lts
nvm use --lts

# pnpm
echo -e "\nInstalling pnpm..." >&3
curl -fsSL https://get.pnpm.io/install.sh | sh -
print_status $? "Install pnpm"

# NPM Cli Tools
sudo npm install --global \
  tldr \
  speed-test \
  fkill-cli \
  jsome \
  iponmap

# Maven
echo -e "\nInstalling maven..." >&3
wget -q -P "$DOWNLOADS_DIR" https://dlcdn.apache.org/maven/maven-3/"${maven_VERSION}"/binaries/apache-maven-"${maven_VERSION}"-bin.tar.gz
print_status $? "Download tcolor zipped binary from GitHub"
sudo tar -xzf $DOWNLOADS_DIR/apache-maven-"${maven_VERSION}"-bin.tar.gz -C /opt
print_status $? "Unzip maven binary"
sudo ln -s /opt/apache-maven-"${maven_VERSION}" /usr/local/bin/apache-maven
print_status $? "Create maven symbolic link"

# Java
echo -e "\nInstalling java-21..." >&3
sudo apt install -y openjdk-21-jdk
print_status $? "Install java-21"

# Spring boot CLI
echo -e "\nInstalling spring-boot..." >&3
wget -q -P "$DOWNLOADS_DIR" https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/"${spring_VERSION}"/spring-boot-cli-"${spring_VERSION}"-bin.tar.gz
print_status $? "Download spring-boot zipped binary from GitHub"
sudo tar -xzf "$DOWNLOADS_DIR/spring-boot-cli-${spring_VERSION}-bin.tar.gz" -C /opt
print_status $? "Unzip spring-boot binary"
sudo ln -s /opt/spring-"${spring_VERSION}"/bin/spring /usr/local/bin/spring
print_status $? "Create spring-boot symbolic link"

# Rust
echo -e "\nInstalling rust..." >&3
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
print_status $? "Install rust"

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
echo -e "\nInstalling zellij-runner..." >&3
cargo install zellij-runner
print_status $? "Install zellij-runner"

# Docker Volume Snapshot
echo -e "\nInstalling docker-volume-snapshot..." >&3
sudo curl -SL https://raw.githubusercontent.com/junedkhatri31/docker-volume-snapshot/main/docker-volume-snapshot -o /usr/local/bin/docker-volume-snapshot
print_status $? "Install docker-volume-snapshot"
sudo chmod +x /usr/local/bin/docker-volume-snapshot

# Copy and paste all dotfiles
echo -e "\nCopy and paste all dotfiles to ~/.config" >&3
OUT=$(rsync -av --exclude='install.sh' --exclude='README.md' --exclude='.git/' --exclude='git/' --exclude='wezterm/' * ~/.config)
if [ -z "$OUT" ]; then
  echo "  ❗ Nothing copied" >&3
else
  echo "  ✅ Copied files successfully" >&3
fi

# Set Timezone
echo -e "\nSetting timezone..." >&3
sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
print_status $? "Set timezone"

# Git
echo -e "\nSet .gitconfig..." >&3
cp -f git/.gitconfig ~/.gitconfig
print_status $? "Copy .gitconfig"

# Fish
chsh -s /usr/bin/fish # set as default shell
