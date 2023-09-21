#!/bin/bash

mkdir registroFirewall

let op=-1
let op2=-1
let op3=-1
let cero=0

while [ $op -ne $cero ] 
do

clear
echo "------------------------------------------------"
echo "|              REGLAS DE FIREWALL              |"
echo "|                                              |"
echo "|     0 -- Salir                               |"
echo "|     1 -- Ver reglas de firewall              |"
echo "|     2 -- Aplicar reglas de firewall base     |"
echo "------------------------------------------------"
echo " Ingrese la opcion "
read op

echo "La opcion elegida es: $op"

verReglas(){

sudo iptables -S > ~/registroFirewall/verReglas.txt

while [ $op2 -ne $cero ] 
do

clear
echo "------------------------------------------------"
echo "|              REGLAS DE FIREWALL              |"
echo "|      0 -- Salir                              |"
echo "|      1 -- Ver reglas de INPUT                |"
echo "|      2 -- Ver reglas de OUTPUT               |"
echo "|      3 -- Ver reglas de FORWARD              |"            
echo "-----------------------------------------------|"

echo " Ingrese la opcion "
read op2

echo "La opcion elegida es: $op2"

case "$op2" in

    "1")
        grep "INPUT" ~/registroFirewall/verReglas.txt

        read stop
        echo "Informe terminado"
        ;;

    "2")
        grep "OUTPUT" ~/registroFirewall/verReglas.txt

        read stop
        echo "Informe terminado"
        ;;


    "3")
        grep "FORWARD" ~/registroFirewall/verReglas.txt

        read stop
        echo "Informe terminado"
        ;;


     "0")
         exit
       ;;

    *)
        echo "Opcion no determinada"
echo "------------------------------------------------"
echo "|              REGLAS DE FIREWALL              |"
echo "|      0 -- Salir                              |"
echo "|      1 -- Ver reglas de INPUT                |"
echo "|      2 -- Ver reglas de OUTPUT               |"
echo "|      3 -- Ver reglas de FORWARD              |"            
echo "-----------------------------------------------|"
        read op2

        ;;
esac

done

read stop
echo "Informe terminado"

}

aplicarReglas(){


while [ $op3 -ne $cero ] 
do

clear
echo "-----------------------------------------------------"
echo "|              REGLAS DE FIREWALL                   |"
echo "|   0 -- Salir                                      |"
echo "|   1 -- Aplicar reglas para servidor BD            |"
echo "|   2 -- Aplicar reglas para servidor APIs          |"
echo "|   3 -- Aplicar reglas para servidor de Back up    |"
echo "-----------------------------------------------------"

echo " Ingrese la opcion "
read op3

echo "La opcion elegida es: $op3"

case "$op3" in

    "1")
        # Servidor de base de datos

        # 1) Administrador de redes - (SOLO PERMITIRLE SSH)
        iptables -t filter -A INPUT -s 192.168.1.2 -p tcp --dport 22 -j ACCEPT

        # 2) Back-officer - (SOLO PERMITIRLE MYSQL)
        iptables -t filter -A INPUT -s 192.168.1.6 -p tcp --dport 3306 -j ACCEPT

        # Servidor de APIs - (SOLO MYSQL)
        iptables -t filter -A INPUT -s 192.168.1.4 -p tcp --dport 3306 -j ACCEPT

        # Servidor de Respaldo y Backups - (SOLO PERMITE RECIBIR LOS BACKUPS)
        iptables -t filter -A INPUT -s 192.168.1.5 -p tcp --dport 873 -j ACCEPT

        # Política:
        iptables -t filter -P INPUT DROP 


        ;;



    "2")

        #Servidor de APIs
        
        # 1) Administrador de redes - (SOLO PERMITIRLE SSH)
         iptables -t filter -A INPUT -s 192.168.1.2 -p tcp --dport 22 -j ACCEPT

        # 2) Resto del mundo - (SOLO HTTP)
         iptables -t filter -A INPUT -p tcp --dport 81 -j ACCEPT
         iptables -t filter -A INPUT -p tcp --dport 82 -j ACCEPT
         iptables -t filter -A INPUT -p tcp --dport 83 -j ACCEPT

        # 3) Servidor de Respaldo y Backups - (SOLO PERMITE RECIBIR LOS BACKUPS)
         iptables -t filter -A INPUT -s 192.168.1.5 -p tcp --dport 873 -j ACCEPT

        #Política:
         iptables -t filter -P INPUT DROP 

        ;;


    "3")
        
        # Servidor de Respaldo y Backups

        # 1) Administrador de redes - (SOLO PERMITIRLE SSH)
         iptables -t filter -A INPUT -s 192.168.1.2 -p tcp --dport 22 -j ACCEPT

        # 2) Servidor APIs - (SOLO PERMITIRLE RECIBIR LOS BACKUPS)
         iptables -t filter -A INPUT -s 192.168.1.4 -p tcp --dport 873 -j ACCEPT

        # 3) Servidor Base de datos - (SOLO PERMITIRLE RECIBIR LOS BACKUPS)
         iptables -t filter -A INPUT -s 192.168.1.3 -p tcp --dport 873 -j ACCEPT

        # Política
         iptables -t filter -P INPUT DROP 


        ;;


     "0")
        exit
       ;;

    *)
echo "-----------------------------------------------------"
echo "|              REGLAS DE FIREWALL                   |"
echo "|   0 -- Salir                                      |"
echo "|   1 -- Aplicar reglas para servidor BD            |"
echo "|   2 -- Aplicar reglas para servidor APIs          |"
echo "|   3 -- Aplicar reglas para servidor de Back up    |"
echo "-----------------------------------------------------"
        read op2

        ;;
esac

done

read stop
echo "Informe terminado"


}

# Llamada a las funciones segun la opcion proporcionada

case "$op" in

    "1")
        verReglas
        ;;

    "2")
        aplicarReglas
        ;;


    "3")
        eliminarReglas
        ;;

    "4")
        agregarReglas
        ;;


     "0")
         exit
       ;;

    *)
        echo "Opcion no determinada"
echo "------------------------------------------------"
echo "|              REGLAS DE FIREWALL              |"
echo "|                                              |"
echo "|     0 -- Salir                               |"
echo "|     1 -- Ver reglas de firewall              |"
echo "|     2 -- Aplicar reglas de firewall base     |"
echo "------------------------------------------------"
        read op

        ;;
esac
done

