# Creacion de claves ssh

ssh-keygen -t rsa -b 2048

echo " Ingrese el usuario de la maquina a copiar "
read user

echo " Ingrese la ip de la maquina a copiar "
read ip

ssh-copy-id -i /home/$USER/.ssh/id_rsa.pub $user@$ip