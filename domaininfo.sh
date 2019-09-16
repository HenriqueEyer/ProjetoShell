#!/bin/bash


DOMAIN=$1
DOMAIN_REGEXP="[Aa-zZ0-9]+(\.[Aa-zZ0-9]+)+"

if [ -z $DOMAIN ]
then        
    echo "CADE?:thinking"
else
    if [[ $DOMAIN =~ $DOMAIN_REGEXP ]]
    then
        whois $DOMAIN > "$DOMAIN.info"
    else 
        echo "Invalido"
    fi
fi

