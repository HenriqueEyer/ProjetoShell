#!/bin/bash

mkdir bob

var1="marcelo"
var2="WIlson"
var3="bob"

if ls $var1
then
    echo "Diretorio $var1 encontrado"
elif ls $var2
then    
    echo "Diretorio $var2 encontrado"
elif ls $var3
then
    echo "Diretorio $var3 encontrado"
else
    echo "Não exite diretorio com esses nomes"
fi

rmdir bob
