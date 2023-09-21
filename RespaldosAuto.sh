#!/bin/bash

# Respaldo BD
# Respaldo Firewall BD
# Respaldo SSH BD
# Respaldo Crontab BD
# Respaldo Logs BD

rsync -zv root@192.168.5.50:~/respaldoBD/RespaldoBD.gz :~/respaldoBD/RespaldoFirewall.gz :~/respaldoBD/RespaldoSSH.gz :~/respaldoBD/RespaldoCrontab.gz :~/respaldoBD/RespaldoLogs.gz ~/directorioRespaldoBD 

# Respaldo APIs
# Respaldo Firewall APIs
# Respaldo SSH APIs
# Respaldo Crontab APIs
# Respaldo Logs APIs:~/respaldoBD/RespaldoConfiguracionAnsible.gz

rsync -zv root@192.168.5.51:~/respaldoAPIS/RespaldoAPIs.gz :~/respaldoAPIS/RespaldoFirewall.gz :~/respaldoAPIS/RespaldoSSH.gz :~/respaldoAPIS/RespaldoCrontab.gz :~/respaldoAPIS/RespaldoLogs.gz ~/directorioRespaldoAPIs 

