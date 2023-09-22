#!/bin/bash

mkdir logs

let op=-1
let cero=0

while [ $op -ne $cero ] 
do

clear
echo "--------------------------------------------------------"
echo "|                 LOGS DEL SISTEMA                     |"
echo "|                                                      |" 
echo "|       0 -- Salir                                     |"
echo "|       1 -- Ver logs exitosos                         |"
echo "|       2 -- Ver logs exitosos remotos                 |"
echo "|       3 -- Ver detalles de log de un usuario         |"
echo "|       4 -- Ver logs fallidos                         |"
echo "|       5 -- Ver usuarios conectados                   |"
echo "|       6 -- Ver por usuario conectado                 |"
echo "--------------------------------------------------------"
echo " Ingrese la opcion "
read op

echo "La opcion elegida es: $op"

logsExitosos() {

last  > ~/logs/logoks.txt

less ~/logs/logoks.txt

echo "Presione enter para continuar"
read fin
echo "Informe terminado"

}

logsExitososR() {
    
last  > ~/logs/logokRs.txt

less ~/logs/logokRs.txt

echo "Presione enter para continuar"
read fin
echo "Informe terminado"

}

logsGeneralesU() {

echo "Ingrese el nombre del usuario"
 read usuario

lastlog -u $usuario  > ~/logs/logsGu.txt

less ~/logs/logsGu.txt

echo "Presione enter para continuar"
read fin
echo "Informe terminado"
}


logsFail() {
    
lastb  > ~/logs/logF.txt

less ~/logs/logF.txt

echo "Presione enter para continuar"
read fin
echo "Informe terminado"

}

logsUconectados() {
 echo "Usuarios conectados actualmente"
 w > ~/logs/logU.txt

less ~/logs/logU.txt

echo "Presione enter para continuar"
read fin
echo "Informe terminado"

}


logsUconectado() {
 echo "Ingrese el nombre del usuario"
 read nameU
 w > ~/logs/logUn.txt

grep "$nameU" ~/logs/logUn.txt

less ~/logs/logUn.txt

echo "Presione enter para continuar"
read fin
echo "Informe terminado"

}


# Llamada a las funciones seg�n la opcion proporcionada

case "$op" in
    "1")
        logsExitosos
        ;;

    "2")
        logsExitososR
        ;;


    "3")
        logsGeneralesU
        ;;

     "4")
        logsFail
        ;;


     "5")
        logsUconectados
        ;;

     "6")
        logsUconectado
        ;;


     "0")
         exit
       ;;

    *)
echo "--------------------------------------------------------"
echo "|                 LOGS DEL SISTEMA                     |"
echo "|                                                      |" 
echo "|       0 -- Salir                                     |"
echo "|       1 -- Ver logs exitosos                         |"
echo "|       2 -- Ver logs exitosos remotos                 |"
echo "|       3 -- Ver detalles de log de un usuario         |"
echo "|       4 -- Ver logs fallidos                         |"
echo "|       5 -- Ver usuarios conectados                   |"
echo "|       6 -- Ver por usuario conectado                 |"
echo "--------------------------------------------------------"
        echo " Ingrese la opcion "
        read op

        ;;
esac
done

