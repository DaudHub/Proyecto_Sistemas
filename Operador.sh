clear
let op=-1
let cero=0

while [ $op -ne $cero ] 
do
clear
echo "--------------------------------------------------------"
echo "|                   OPERADOR                           |"
echo "|                                                      |" 
echo "|     0 -- Salir                                       |"
echo "|     1 -- Manejo de usuarios                          |"
echo "|     2 -- Registros de logs                           |"
echo "|     3 -- SSH                                         |"
echo "|     4 -- Instalar MYSQL                              |"
echo "|     5 -- Respaldos automaticos                       |"
echo "|     6 -- Respaldos manuales                          |"
echo "|     7 -- Reglas de Firewall                          |"
echo "|     8 -- Instalar .NET                               |"
echo "|     9 -- Instalar GIT                                |"
echo "--------------------------------------------------------"
echo ""
echo " Ingrese la opcion "
read op
echo ""
echo "La opcion elegida es: $op"
echo ""

case "$op" in

    "1")
        sh ABMUsuarios.sh
    ;;

    "2")
        sh ShellRlogs.sh
    ;;

    "3")
        sh SSH.sh
    ;;

    "4")
        sh InstalarMYSQL.sh
    ;;

    "5")
        sh RespaldosAuto.sh
    ;;

    "6")
        sh RespaldosManual.sh
    ;;

    "7")
        sh ReglasFirewall.sh
    ;;

    "8")
        sh Instalar.NET.sh
    ;;

    "9")
        sh InstalarGit.sh
    ;;

    "0")
        exit
    ;;

    *)
        echo "Opcion no determinada"

echo "--------------------------------------------------------"
echo "|                   OPERADOR                           |"
echo "|                                                      |" 
echo "|     0 -- Salir                                       |"
echo "|     1 -- Manejo de usuarios                          |"
echo "|     2 -- Registros de logs                           |"
echo "|     3 -- SSH                                         |"
echo "|     4 -- Instalar MYSQL                              |"
echo "|     5 -- Respaldos automaticos                       |"
echo "|     6 -- Respaldos manuales                          |"
echo "|     7 -- Reglas de Firewall                          |"
echo "|     8 -- Instalar .NET                               |"
echo "|     9 -- Instalar GIT                                |"
echo "--------------------------------------------------------"
echo ""

        echo -n " Ingrese la opcion: "
        read op
    ;;

esac

done
