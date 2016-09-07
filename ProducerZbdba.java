package com.jingbo.test;

import java.util.Properties;

import org.apache.kafka.clients.CommonClientConfigs;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.config.SslConfigs;

public class ProducerZbdba {
    public static void main(String[] args) {
         Properties props = new Properties();
         Properties producerProps = new Properties();
         producerProps.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "192.168.56.102:9093");
         producerProps.put(ProducerConfig.CLIENT_ID_CONFIG, "myApiKey");
         producerProps.put(SslConfigs.SSL_KEYSTORE_LOCATION_CONFIG, "C:/Users/zbdba/Downloads/kafka.client.keystore.jks");
         producerProps.put(SslConfigs.SSL_KEYSTORE_PASSWORD_CONFIG, "zbdba94");
         producerProps.put(SslConfigs.SSL_TRUSTSTORE_LOCATION_CONFIG, "C:/Users/zbdba/Downloads/kafka.client.keystore.jks");
         producerProps.put(SslConfigs.SSL_TRUSTSTORE_PASSWORD_CONFIG, "zbdba94");
         producerProps.put(SslConfigs.SSL_TRUSTSTORE_TYPE_CONFIG, "JKS");
         producerProps.put(CommonClientConfigs.SECURITY_PROTOCOL_CONFIG, "SSL");

         producerProps.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");
         producerProps.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");

         KafkaProducer producer = new KafkaProducer(producerProps);
         for(int i = 0; i < 100; i++)
             producer.send(new ProducerRecord<String, String>("jingbotest5", Integer.toString(i), Integer.toString(i)));
             System.out.println("test");
         producer.close();
    }
}

