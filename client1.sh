#!/bin/bash
name=$HOSTNAME
cd /root
dirname=securityDemo
rm -rf $dirname
mkdir $dirname
cd $dirname

printf "zbdba94\nzbdba94\n$name\ntest\ntest\ntest\ntest\ntest\nyes\n\n" |  keytool -keystore kafka.client.keystore.jks -alias $name -validity 36 -genkey
printf "zbdba94\nzbdba94\nyes\n" |keytool -keystore kafka.client.keystore.jks -alias $name -certreq -file cert-file

cp cert-file cert-file-$name

