#!/bin/bash
name=$HOSTNAME
folder=securityDemo

cd /root
rm -rf $folder
mkdir $folder
cd $folder
printf "zbdba94\nzbdba94\kafka1\ntest\ntest\ntest\ntest\ntest\nyes\n\n" | keytool -keystore kafka.server.keystore.jks -alias $name  -validity 365 -genkey

printf "te\ntest\ntest\ntest\ntest\kafka1\nasdf@test.com\n" | openssl req -new -x509 -keyout ca-key -out ca-cert -days 365 -passout pass:zbdba94
echo "done"
printf "zbdba94\nzbdba94\nyes\n" | keytool -keystore kafka.server.truststore.jks -alias CARoot -import -file ca-cert
printf "zbdba94\nzbdba94\nyes\n" | keytool -keystore kafka.client.truststore.jks -alias CARoot -import -file ca-cert
printf "zbdba94\n" | keytool -keystore kafka.server.keystore.jks -alias $name -certreq -file cert-file
openssl x509 -req -CA ca-cert -CAkey ca-key -in cert-file -out cert-signed -days 365 -CAcreateserial -passin pass:zbdba94
printf "zbdba94\nyes\n" | keytool -keystore kafka.server.keystore.jks -alias CARoot -import -file ca-cert
printf "zbdba94\nyes\n" | keytool -keystore kafka.server.keystore.jks -alias $name -import -file cert-signed

#producer.propeties
rm -rf producer.properties

printf $PWD


echo "bootstrap.servers=$name:9093" >> producer.properties
echo "security.protocol=SSL" >> producer.properties
echo "ssl.truststore.location=$PWD/kafka.client.truststore.jks">> producer.properties
echo "ssl.truststore.password=zbdba94">> producer.properties
echo "ssl.keystore.location=$PWD/kafka.server.keystore.jks">> producer.properties
echo "ssl.keystore.password=zbdba94">> producer.properties
echo "ssl.key.password=zbdba94">> producer.properties

