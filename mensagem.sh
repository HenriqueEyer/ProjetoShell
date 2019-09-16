#!/bin/bash

MENSAGEM=$1

 
if [ -z $MENSAGEM ]
then
    echo "Envie uma mensagem"
else
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MENSAGEM\"}" https://hooks.slack.com/services/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
    echo "Mensagem enviada: $MENSAGEM ."
fi