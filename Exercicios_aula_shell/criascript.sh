#!/bin/bash

read -p "Digite nome do arquivo:" nome

criaarquivo(){
    echo "#!/bin/bash" >> $nome".sh"
}

if ls $nome".sh"
then
    echo "Arquivo existe"
else 
    criaarquivo
fi