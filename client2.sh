client2.sh
#!/bin/bash
name=$HOSTNAME
cd /root
openssl x509 -req -CA /root/kafka1/ca-cert -CAkey /root/kafka1/ca-key -in /root/securityDemo/cert-file-$name  -out /root/securityDemo/cert-signed-$name  -days 36 -CAcreateserial -passin pass:zbdba94

