#!/bin/bash

while :
do
    clear
    git --no-pager log -n25 --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all
    sleep 1
done