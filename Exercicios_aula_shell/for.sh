#!/bin/bash
arquivo=/home/henrique/Trybe/Introducao_desenvolvimento_web/Unix_Shell/Shell_Script/lista.txt

for nomes in `cat $arquivo`
do
    echo $nomes
done