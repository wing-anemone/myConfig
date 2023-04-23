#!/bin/bash
# this script for ubuntu 22.04
# need to check fialed command
set -uxo pipefail
echo "the first time you run? [y/N]"
read first 
[[ -z $first ]] && first="N"
cd
apt update
apt install zsh subversion libclang-12-dev ripgrep fd-find

Config=$HOME/.config

# 重复链接目录会有出现在后者目录里,所以要先rm
[[ -d $Config/nvim ]] && rm $Config/nvim
ln -s $HOME/myConfig/nvim $Config/nvim
ln -sf $HOME/myConfig/zshrc $HOME/.zshrc
ln -sf $HOME/myConfig/nvim/vim/vimrc $HOME/.vimrc
Zellij=$Config/zellij
if [[ ! -d $Zellij ]]; then 
  mkdir -p $Zellij
fi
ln -sf $HOME/myConfig/zellij.yaml $Zellij/config.yaml

# 第一次运行脚本
if [[ $first == "y" || $first == "yes" ]]; then
  # 安装SauceCodePro Nerd Font字体
  # wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.1/SourceCodePro.zip
  # unzip SourceCodePro.zip -d $HOME/.fonts
  # 下载安装 neovim
  wget -O nvim-linux64.deb https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
  # ccls for lsp
  git clone --depth=1 --recursive https://github.com/MaskRay/ccls && cd ccls
  cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release
  cmake --build Release && cd
  # accelerate for telescope

  # wait for delete
  # git clone --depth=1 https://github.com/junegunn/fzf.git $HOME/.fzf

  # For Ubuntu, install nodejs 19
  curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi 

# fc-cache -fv $HOME/.fonts
sudo apt install $HOME/nvim-linux64.deb

cd $HOME/ccls/Release
sudo make install && cd

# 这个貌似不需要重复安装
# bash $HOME/.fzf/install

# python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pynvim

# neovim python3
npm install -g neovim

# 解决 ccls 在 coc 下的问题(未发生时无需，也无法执行)
# cd ~/.config/coc/extensions/node_modules/coc-ccls
# ln -s node_modules/ws/lib lib
