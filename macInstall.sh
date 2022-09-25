#!/bin/bash
# this script for macos
# need to check fialed command

set -uxo pipefail

brew install zsh wget subversion alacritty zellij

Config=$HOME/.config

Alacritty=$Config/alacritty
echo $Alacritty
if [[ ! -d $Alacritty ]]; then 
  mkdir -p $Alacritty
fi
# 如果存在软链，直覆盖
ln -sf $HOME/myConfig/alacritty.yml $Alacritty/alacritty.yml

Zellij=$Config/zellij
if [[ ! -d $Zellij ]]; then 
  mkdir -p $Zellij
fi
ln -sf $HOME/myConfig/zellij.yaml $Zellij/config.yaml

# 重复链接目录会有出现在后者目录里
if [[ -d $Config/nvim ]]; then
  rm $Config/nvim
fi
ln -s $HOME/myConfig/nvim $Config/nvim
ln -sf $HOME/myConfig/zshrc $HOME/.zshrc
ln -sf $HOME/myConfig/nvim/vim/vimrc $HOME/.vimrc

# 第一次运行脚本，需要安装SauceCodePro Nerd Font字体
if [[ -n $1 && $1 == "first" ]]; then
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.1/SourceCodePro.zip
  unzip SourceCodePro.zip -d ~/.fonts
  rm SourceCodePro.zip
  fc-cache -fv ~/.fonts
  rm -r ~/.fonts
fi 
