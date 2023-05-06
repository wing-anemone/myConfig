#!/bin/bash
Zellij=$HOME/.config/zellij
[[ ! -d $Zellij ]] mkdir -p $Zellij
ln -si $PWD/zellij.kdl $Zellij/config.kdl
