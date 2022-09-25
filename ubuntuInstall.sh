#!/bin/bash
# this script for ubuntu 22.04
# need to check fialed command
set -uxo pipefail

cd
apt update
apt install zsh subversion libclang-12-dev ripgrep

Config=$HOME/.config
# 重复链接目录会有出现在后者目录里
if [[ -d $Config/nvim ]]; then
  rm $Config/nvim
fi
ln -s $HOME/myConfig/nvim $Config/nvim
ln -sf $HOME/myConfig/zshrc $HOME/.zshrc
ln -sf $HOME/myConfig/nvim/vim/vimrc $HOME/.vimrc

# 第一次运行脚本
Flag=${1:-NoFirst}
if [[ $Flag -ne "NoFirst" ]]; then
  # 安装SauceCodePro Nerd Font字体
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.1/SourceCodePro.zip
  unzip SourceCodePro.zip -d $HOME/.fonts
  # 下载安装 neovim
  wget -O nvim-linux64-0.7.2.deb https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
  # ccls for lsp
  git clone --depth=1 --recursive https://github.com/MaskRay/ccls && cd ccls
  cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release
  cmake --build Release && cd
  # accelerate for telescope
  git clone --depth=1 https://github.com/junegunn/fzf.git $HOME/.fzf
fi 
fc-cache -fv $HOME/.fonts
sudo apt install $HOME/nvim-linux64-0.7.2.deb

cd $HOME/ccls/Release
sudo make install && cd

# 这个貌似不需要重复安装
bash $HOME/.fzf/install

# python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pynvim

# 解决 ccls 在 coc 下的问题(未发生时无需，也无法执行)
# cd ~/.config/coc/extensions/node_modules/coc-ccls
# ln -s node_modules/ws/lib lib

# neovim python3? 
# # npm install -g neovim
