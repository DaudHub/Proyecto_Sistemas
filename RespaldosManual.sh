#Respaldos manuales

#!/bin/bash

mkdir directorioRespaldoBD
mkdir directorioRespaldoAPIs

clear
let op=-1
let cero=0

while [ $op -ne $cero ] 
do
clear
echo "--------------------------------------------------------"
echo "|              RESPALDOS MANUALES                      |"
echo "|                                                      |" 
echo "|     0 -- Salir                                       |"
echo "|     1 -- Respaldar Base de datos                     |"
echo "|     2 -- Respaldar APIs                              |"
echo "|     3 -- Respaldar Firewall BD                       |"
echo "|     4 -- Respaldar Firewall APIs                     |"
echo "|     5 -- Respaldar SSH BD                            |"
echo "|     6 -- Respaldar SSH APIs                          |"
echo "|     7 -- Respaldar Crontab BD                        |"
echo "|     8 -- Respaldar Crontab APIs                      |"
echo "|     9 -- Respaldar Logs BD                           |"
echo "|     10 -- Respaldar Logs APIs                        |"
echo "--------------------------------------------------------"
echo ""
echo " Ingrese la opcion "
read op
echo ""
echo "La opcion elegida es: $op"
echo ""

echo -n "Seguro que quiere realizar un backup? [Y/n]: "
read confirmation

if [ $confirmation != "y" ]; then
    echo "Operacion cancelada..."
    exit
fi

case "$op" in
    "1")
        rsync -zv Falonso2@192.168.1.198:~/respaldoBD/RespaldoBD.gz ~/directorioRespaldoBD
        read stop
    ;;
    "2")
        rsync -zv root@192.168.5.51:~/respaldoAPIS/RespaldoAPIs.gz ~/directorioRespaldoAPIs
         read stop
    ;;
    "3")
        rsync -zv root@192.168.5.50:~/respaldoBD/RespaldoFirewall.gz ~/directorioRespaldoBD
         read stop
    ;;
    "4")
        rsync -zv root@192.168.5.51:~/respaldoAPIS/RespaldoFirewall.gz ~/directorioRespaldoAPIs
         read stop
    ;;
    "5")
        rsync -zv root@192.168.5.50:~/respaldoBD/RespaldoSSH.gz ~/directorioRespaldoBD
         read stop
    ;;
    "6")
        rsync -zv root@192.168.5.51:~/respaldoAPIS/RespaldoSSH.gz ~/directorioRespaldoAPIs
         read stop
    ;;
    "7")
        rsync -zv root@192.168.5.50:~/respaldoBD/RespaldoCrontab.gz ~/directorioRespaldoBD
         read stop
    ;;
    "8")
        rsync -zv root@192.168.5.51:~/respaldoAPIS/RespaldoCrontab.gz ~/directorioRespaldoAPIs
         read stop
    ;;
    "9")
        rsync -zv root@192.168.5.50:~/respaldoBD/RespaldoLogs.gz ~/directorioRespaldoBD
         read stop
    ;;
    "10")
        rsync -zv root@192.168.5.51:~/respaldoAPIS/RespaldoLogs.gz ~/directorioRespaldoAPIs
         read stop
    ;;
    *)
        echo "Operacion cancelada..."
        exit
    ;;
esac

echo "Respado con exito"
read stop
done