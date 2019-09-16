#!/bin/bash
export LANG=C.UTF-8
#Aqui cria um arquivo para separar os dados
#Como a API puxa um tanto de dados eu preciso tratar ele te mostrar a lista.


#Função para tratar os dados pegados da API
criararquivo(){

    controle=1 # variavel de controle para o while
    # while para passar por cada parte do arquivo gerado pela API.
    while [ $controle -lt 35 ]; do
    #COMANDO a baixo(cut) Ele ta transformando aquela linha enorme e ta quebrando ela em varias outras.
    # transformando em uma nova.
    cut -d"{" -f$controle list1.txt >> dados.txt 
    let controle=controle+1
    done

    grep temp dados.txt > dados2.txt
    controle=1
    
    while [ $controle -lt 6 ]; do
    cut -d"," -f$controle dados2.txt >> dados3.txt
    let controle=controle+1
    done

}


CIDADE=$*
API_KEY=5ff2f2aaf23ad640503a718cc55b3721

if [ -z "$CIDADE" ]
then
    echo "Esqueceu de digitar a cidade."
else
    curl -s -G --data-urlencode "appid=$API_KEY" --data-urlencode "q=$CIDADE" http://api.openweathermap.org/data/2.5/weather > list1.txt
    cod=`cut -d"," -f1 list1.txt | cut -d":" -f2`
    criararquivo
    if [ $cod != '"404"' ]
    then
        temp=`head -1 dados3.txt | cut -d":" -f2`
        tempMAX=`grep temp_max dados3.txt | sed 's/}/:/g' |cut -d":" -f2` 
        tempMIN=`grep temp_min dados3.txt | cut -d":" -f2`
        kelvin=273.15
        tempatual=$(echo "scale=2; $temp - $kelvin " | bc)
        temMAX=$(echo "scale=2; $tempMAX - $kelvin " | bc)
        temMIN=$(echo "scale=2; $tempMIN - $kelvin " | bc)
        echo "Temperatura de $CIDADE:" 
        echo "$tempatual"
        echo "Maxima: "
        echo "$temMAX"
        echo "Minima:"
        echo "$temMIN"
        rm dados.txt dados2.txt dados3.txt list1.txt
    else
        echo "E ($CIDADE) é uma cidade?"
        
    fi
fi


