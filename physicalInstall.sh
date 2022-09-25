#!/bin/bash


Zellij=$Config/zellij

if [[ ! -d $Zellij ]]; then 
  mkdir -p $Zellij
fi
ln -sf $HOME/myConfig/zellij.yaml $Zellij/config.yaml


