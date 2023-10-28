#!/bin/bash
#================================================================
#   Copyright (C) 2022 All rights reserved.
#
#   Created by: Anemone
#   Created in: 2023-05-06
#
#================================================================

# 使用方法
# bash macInstall.sh : 默认参数启动

Config=$HOME/.config
First="NO"

readonly Alacritty=$Config/alacritty
readonly Zellij=$Config/zellij

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}
help() {
  echo "Options:"
  echo "  -c:"
  echo "    set default config path"
  echo "    default $HOME/.config"
  echo "  -f:"
  echo "    flag for first install,"
  echo "    such as Fonts"
}
parse_opts() {
  while getopts 'c:fh' flag; do
    case "${flag}" in
      c) Config="${OPTARG}" ;;
      f) First="YES" ;;
      h)
        help
        exit 0 ;;
      *)
        err "Unexpected option ${flag}"
        help
        exit 0 ;;
    esac
  done
}

InsMacBasic() {
  brew install zsh wget neovim subversion alacritty \
    zellij ripgrep clang-format
}
LinkTerminal() {
  if [[ ! -d $Alacritty ]]; then 
    mkdir -p $Alacritty
  fi
  ln -si $PWD/alacritty.yml $Alacritty
}
LinkZellij() {
  if [[ ! -d $Zellij ]]; then 
    mkdir -p $Zellij
  fi
  ln -si $PWD/zellij.kdl $Zellij/config.kdl
}
InsFont() {
  # 安装SauceCodePro Nerd Font字体
  brew tap homebrew/cask-fonts
  brew install font-sauce-code-pro-nerd-font --cask
}
LinkSetting() {
  LinkTerminal
  LinkZellij
  # -s 软链，-i交互模式询问覆盖
  ln -si $PWD/zshrc $HOME/.zshrc
  ln -si $PWD/vimrc $HOME/.vimrc
  ln -sFi $PWD/nvim $Config
}
Install() {
  if [[ $First == "YES" ]]; then
    InsMacBasic
    InsFont
  fi
}
main() {
  parse_opts "$@"
  Install
  LinkSetting
}
main "$@"
