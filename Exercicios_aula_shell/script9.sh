#!/bin/bash

read -p "Digite o nome do seu backdoor:" nome

read -p "Informe seu ip interno ou externo:" ip

read -p "informe uma porta:" porta

echo "Queria usar o msfvenom, mas como não tenho vou imprimir aqui os valores da entrada: " > output.txt
echo $nome >> output.txt
echo $ip >> output.txt
echo $porta >> output.txt