#!/bin/bash
lsl1(){
    ls -l
}

lsl1

entraremdesktopecriaarquivodetexto(){
    cd /home/henrique | touch textoteste.txt
    ls
}
entraremdesktopecriaarquivodetexto
echo "Removendo arquivo (remove/alias)"
alias remove='rm'
remove textoteste.txt
ls
