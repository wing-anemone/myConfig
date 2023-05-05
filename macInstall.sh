#!/bin/bash
# this script for macos
# need to check fialed command

set -uxo pipefail
echo "the first time you run? [y/N]"
read first
[[ -z $first ]] && first="N"
cd

brew install zsh wget subversion alacritty \
  zellij ripgrep fd-find clang-format

readonly Config=$HOME/.config
readonly Alacritty=$Config/alacritty
readonly Zellij=$Config/zellij

if [[ ! -d $Alacritty ]]; then 
  mkdir -p $Alacritty
fi
if [[ ! -d $Zellij ]]; then 
  mkdir -p $Zellij
fi

# 如果存在软链，直覆盖
ln -sf $HOME/myConfig/alacritty.yml $Alacritty/alacritty.yml
ln -sf $HOME/myConfig/zellij.kdl $Zellij/config.kdl
ln -sf $HOME/myConfig/zshrc $HOME/.zshrc
ln -sf $HOME/myConfig/nvim/vim/vimrc $HOME/.vimrc

# 重复链接目录会出现在后者目录里
if [[ -d $Config/nvim ]]; then
  rm $Config/nvim
fi
ln -s $HOME/myConfig/nvim $Config/nvim

# 第一次运行脚本，需要安装SauceCodePro Nerd Font字体
if [[ $first == "y" || $first == "yes" ]]; then
  brew tap homebrew/cask-fonts
  brew install font-sauce-code-pro-nerd-font --cask
fi 
