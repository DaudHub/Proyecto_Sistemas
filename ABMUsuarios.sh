#!/bin/bash

clear
let op=-1
let cero=0

while [ $op -ne $cero ] 
do
clear
echo "--------------------------------------------------------"
echo "|              MANEJO DE USUARIOS                      |"
echo "|                                                      |" 
echo "|     0 -- Salir                                       |"
echo "|     1 -- Crear usuarios                              |"
echo "|     2 -- Eliminar usuarios                           |"
echo "|     3 -- Modificar usuarios                          |"
echo "|     4 -- Ver usuarios del sistema                    |"
echo "|     5 -- Ver los usuarios conectados al sistema      |"
echo "|     6 -- Crear grupo                                 |"
echo "|     7 -- Eliminar grupo                              |"
echo "--------------------------------------------------------"
echo ""
echo " Ingrese la opcion "
read op
echo ""
echo "La opcion elegida es: $op"
echo ""




crearUsuario() {

echo "Ingrese el nombre del usuario "
read nombreU
echo ""
echo "$nombreU"

validacion=$(grep -w $nombreU /etc/passwd | cut -d ":" -f 1)

if [ $nombreU == $validacion ]
then

   echo "El usuario ya existe"
   read stop

else

	useradd $nombreU

   validacion=$(grep -w $nombreU /etc/passwd | cut -d ":" -f 1)

   if [ $nombreU == $validacion ]
   then

   echo "El usuario fue creado exitosamente"

   passwd $nombreU
   read stop
   else

	echo "El usuario no fue creado exitosamente"
   read stop 
   fi

fi

}








eliminarUsuario() {
   echo -n "Ingrese usuario a eliminar: "
   read username

   validacion=$( cut -d ":" -f 1 /etc/passwd | grep -x $username | wc -l)

   if [ $validacion -ne 1 ]; then
      echo "El usuario $username no existe en el sistema"
      return 0
   fi

   echo -n "¿Seguro que quiere eliminar el usuario $username? (y/N): "
   read verificacion

   if [ $verificacion != "y" ]; then
      echo "Operacion cancelada..."
      return 0
   fi

   userdel -r $username
   rm -rf /var/mail/$username
   rm -rf /var/spool/$username
   echo "Usuario $username eliminado correctamente"
}








modificarUsuario(){

let op1=-1
let cero1=0

while [ $op1 -ne $cero1 ] 
do

echo " 1 -- Cambiar nombre de usuario"
echo " 2 -- Cambiar directorio home del usuario"
read op1
case "$op1" in

  "1") 
  
   echo -n "Ingrese el usuario a cambiar: "
   read username

   validacion=$(cut -d ":" -f 1 /etc/passwd | grep -x $username | wc -l)

   if [ $validacion -ne 1 ]; then
      echo "El usuario $username no existe en el sistema"
      return 0
   fi

   echo -n "Ingerse nuevo nombre para $username: "
   read newUsername

   echo -n "¿Seguro que quiere cambial el nombre de usuario a $username por $newUsername? (y/N): "
   read verificacion

   if [ $verificacion != "y" ]; then
      echo "Operacion cancelada..."
      return 0
   fi

   usermod -l $newUsername $username -m $newUsername

   userFolder=$(grep -)

   echo "Usuario $username cambiado a $newUsername correctamente"

   ;;

   "2")

   echo -n "Ingrese el usuario a cambiarle el directorio home: "
   read username

   validacion=$(cut -d ":" -f 1 /etc/passwd | grep -x $username | wc -l)

   if [ $validacion -ne 1 ]; then
      echo "El usuario $username no existe en el sistema"
      return 0
   fi

   echo -n "Ingerse nuevo directorio para $username: "
   read newDirectorio

   echo -n "¿Seguro que quiere cambial el directorio de usuario a $username por $newDirectorio? (y/N): "
   read verificacion

   if [ $verificacion != "y" ]; then
      echo "Operacion cancelada..."
      return 0
   fi
   
   usermod -d "/home/$newDirectorio" -m $username  

   echo "El directorio de $username se ha cambiado a $newDirectorio"

    
   ;;


esac
done

}





verUsuarios() {

less /etc/passwd | cut -d: -f1
read stop
}




verUsuariosConectados(){

echo "Usuarios conectados actualmente"

echo $(w)

read stop
}



crearGrupo(){

echo "Ingrese el nombre del grupo"
read nombreGrupo

groupadd $nombreGrupo

}

eliminarGrupo(){

echo "Ingrese el nombre del grupo"
read nombreGrupo

groupdel $nombreGrupo

}


# Llamada a las funciones segun la opcion proporcionada

case "$op" in

    "1")
        crearUsuario
        ;;

    "2")
        eliminarUsuario
        ;;


    "3")
        modificarUsuario
        ;;

     "4")
        verUsuarios
        ;;


     "5")
        verUsuariosConectados
        ;;

     "6")
        crearGrupo
        ;;

      "7")
        eliminarGrupo
        ;;

     "0")
         exit
       ;;

    *)
        echo "Opcion no determinada"
echo "--------------------------------------------------------"
echo "|              MANEJO DE USUARIOS                      |"
echo "|                                                      |" 
echo "|     0 -- Salir                                       |"
echo "|     1 -- Crear usuarios                              |"
echo "|     2 -- Eliminar usuarios                           |"
echo "|     3 -- Modificar usuarios                          |"
echo "|     4 -- Ver usuarios del sistema                    |"
echo "|     5 -- Ver los usuarios conectados al sistema      |"
echo "|     6 -- Crear grupo                                 |"
echo "|     7 -- Eliminar grupo                              |"
echo "--------------------------------------------------------"
        echo -n " Ingrese la opcion: "
        read op

        ;;
esac
done
