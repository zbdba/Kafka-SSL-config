me=$HOSTNAME

cd /root/securityDemo
printf "zbdba94\nyes\n" | keytool -keystore kafka.client.keystore.jks -alias CARoot -import -file /root/kafka1/ca-cert
printf "zbdba94\nyes\n" | keytool -keystore kafka.client.keystore.jks -alias $name -import -file /root/securityDemo/cert-signed-$name



#producer.propeties
rm -rf producer.properties

printf $PWD


echo "bootstrap.servers=localhost:9093" >> producer.properties
echo "security.protocol=SSL" >> producer.properties
echo "ssl.truststore.location=$PWD/kafka.client.keystore.jks">> producer.properties
echo "ssl.truststore.password=zbdba94">> producer.properties
echo "ssl.keystore.location=$PWD/kafka.client.keystore.jks">> producer.properties
echo "ssl.keystore.password=zbdba94">> producer.properties
echo "ssl.key.password=zbdba94">> producer.properties

