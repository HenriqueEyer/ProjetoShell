#!/bin/bash
var1=0

while [ $var1 -lt 10 ]
do
    echo $var1
    var1=$(( $var1 + 1 ))
done

echo "Lopp finalizado"