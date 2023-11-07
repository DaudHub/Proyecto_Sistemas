#!/bin/bash

sudo rpm -Uvh http://opensource.wandisco.com/centos/7/git
rpm --import hhtp://opensource.wandisco.com/RPM-GPG-KEY-WANdisco

sudo yum install git

echo "Ingrese usuario:"

read user

git config --global user.name $user

echo "Ingrese su Mail:"

read mail

git config --global user.email $mail




