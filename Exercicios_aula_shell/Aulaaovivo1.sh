#!/bin/bash

echo "Hello word"

echo "Digite a sua idade:"
read idade
echo "Sua idade é: $idade"

if [ $idade -ge 18 ]
then
    echo "Maior de idade! =("
    else
    echo "Menor de idade! =)"
fi