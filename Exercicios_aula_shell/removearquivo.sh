#!/bin/bash

read -p "Digite o arquivo que quer remover:" nome

removearquivo(){
    rm $nome".sh"
}

if ls $nome".sh"
then
    removearquivo
else 
    echo "Arquivo não existe"
fi