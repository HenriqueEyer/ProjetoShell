#!/bin/bash

if [ $USER = henrique ] && [ -x operadoresL.sh ]
then
    echo "O usuario eh o $USER e tem permissao sobre o arquivo"
else
    echo "Não possui permissao"
fi