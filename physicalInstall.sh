#!/bin/bash


Zellij=$Config/zellij

[[ ! -d $Zellij ]] mkdir -p $Zellij
ln -sf $HOME/myConfig/zellij.yaml $Zellij/config.yaml


