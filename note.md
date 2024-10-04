set-single-user-credentials buuhq Tpb@123456789

docker build -t nifi-openjdk11 .

mkdir nifi1
docker cp 596b64a1d654:/opt/nifi/conf ./nifi1/conf

sudo docker load < ~/cp-kafka.tar
sudo docker load < ~/nifi-openjdk11.tar
sudo docker load < ~/zookeeper.tar

sudo docker load < ~/docker-images/cp-kafka.tar
sudo docker load < ~/docker-images/nifi-openjdk11.tar
sudo docker load < ~/docker-images/zookeeper.tar

sudo unzip /tmp/nifi-1.27.0-bin.zip && sudo mv /tmp/nifi-1.27.0 ~/nifi01

docker exec -it kafka /bin/kafka-console-producer --bootstrap-server kafka:9092 --topic test-topic

docker-compose logs kafka | grep -i started

cn=admin,dc=lab,dc=dev
