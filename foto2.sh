#!/bin/bash
#'tURL":"https://pixabay.com/get/(\d+|\w+)+.\w{3}'"

Baixarfoto(){
        echo "Entrando em $SEARCH_TERM"
        curl -s -G -L --data-urlencode "key=$API_KEY" --data-urlencode "q=$SEARCH_TERM" --data-urlencode "image_type=photo" --data-urlencode "per_page=$QTY_RESULTS" https://pixabay.com/api  > site.txt
        controle=`cut -d ":" -f2 site.txt | cut -d "," -f1`

        if [ $controle -eq 0 ]
        then
            rm site.txt
            cd ..
            rmdir $SEARCH_TERM 
            echo "Nenhum item achado"
        else
            egrep -o 'tURL":"https://pixabay.com/get/(\d+|\w+)+.\w{3}' site.txt | cut -d '"' -f3 | xargs wget
            rm site.txt
        fi
}


API_KEY=13623998-877c27bd53b6ba11c01fc45d6

SEARCH_TERM=$1
QTY_RESULTS=$2

if [ -z $SEARCH_TERM ]
then
    echo 'Digite o quer procurar. Ex: "Dog" 5(numero de fotos) '
else

    case $QTY_RESULTS in
        1)
            QTY_RESULTS=3
            ;;
        2) 
            QTY_RESULTS=3
            ;;
        *)
            ;;
    esac

    if [ -e $SEARCH_TERM ]
    then
        cd $SEARCH_TERM
        Baixarfoto   
    else
        mkdir $SEARCH_TERM
        echo "Diretorio $SEARCH_TERM criado"
        cd $SEARCH_TERM
        Baixarfoto
    fi
fi


