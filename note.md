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


docker exec -it nexus3.75.1 cat /nexus-data/admin.password

new password nexus3: TpfBuuHQ@2025


docker login localhost:9088 


docker pull localhost:9089/mysql:8.0.40-debian

docker pull localhost:9089/hello-world

```shell
cd /home/oracle/sql_import/
for file in *.sql; do
    echo "Executing $file..."
    sqlplus sqlplus DIGI_LOS_OWNER/Password123@localhost:1521/PDB_DIGITAL_PLATFORM_SIT @$file
done

sqlplus sqlplus DIGI_LOS_OWNER/Password123@localhost:1521/PDB_DIGITAL_PLATFORM_SIT @ACT_GE_BYTEARRAY.sql
```

```bash
for file in *.sql; do
    echo "Running $file..."
    sqlplus DIGI_LOS_OWNER/Password123@localhost:1521/PDB_DIGITAL_PLATFORM_SIT @$file
done

for file in *.sql; do
    echo "Running $file..."
    echo "EXIT" | sqlplus -s DIGI_LOS_OWNER/Password123@PDB_DIGITAL_PLATFORM_SIT @$file
done
```