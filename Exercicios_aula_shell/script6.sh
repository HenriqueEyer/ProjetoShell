#!/bin/bash

read -p "Digite um numero: " num1

read -p "Digite o segundo numero: " num2

echo $(($num1 + $num2))
echo $(($num1 - $num2))
echo $(($num1 * $num2))
echo " o numero scale=2; $num1 / $num2" | bc



