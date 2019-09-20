#!/bin/bash
cd
for item in /home/henrique/*
do
    if [ -d $item ]
    then
        echo "O item $item eh um diretorio"
    elif [ -f $item ]
    then
        echo "O item $item eh um arquivo"
    fi
done