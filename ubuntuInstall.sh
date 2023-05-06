#!/bin/bash
# this script for ubuntu 22.04
# need to check fialed command
set -uxo pipefail
echo "the first time you run? [y/N]"
read first 
[[ -z $first ]] && first="N"
cd
apt update
apt install zsh subversion libclang-12-dev ripgrep fd-find clang-format

Config=$HOME/.config

# 重复链接目录会有出现在后者目录里,所以要先rm
[[ -d $Config/nvim ]] && rm $Config/nvim
ln -s $HOME/myConfig/nvim $Config/nvim
ln -sf $HOME/myConfig/zshrc $HOME/.zshrc
ln -sf $HOME/myConfig/nvim/vim/vimrc $HOME/.vimrc

# 第一次运行脚本
if [[ $first == "y" || $first == "yes" ]]; then

  cd /workspace
  clang-format -style=google -dump-config > .clang-format
  cd

  # 安装SauceCodePro Nerd Font字体
  # wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.1/SourceCodePro.zip
  # unzip SourceCodePro.zip -d $HOME/.fonts

  # 下载安装 neovim
  # wget -O nvim-linux64.deb https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
  wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
  ./nvim.appimage --appimage-extract
  mv squashfs-root neovim

  # ccls for lsp
  git clone --depth=1 --recursive https://github.com/MaskRay/ccls && cd ccls
  cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release
  cmake --build Release && cd

  # For Ubuntu, install nodejs 20
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  apt-get install -y nodejs
fi 

# fc-cache -fv $HOME/.fonts
# sudo apt install $HOME/nvim-linux64.deb

cd $HOME/ccls/Release
sudo make install && cd

# python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pynvim

# neovim python3
npm install -g neovim

# 解决 ccls 在 coc 下的问题(未发生时无需，也无法执行)
# cd ~/.config/coc/extensions/node_modules/coc-ccls
# ln -s node_modules/ws/lib lib
