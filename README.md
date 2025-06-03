# docker4lab

```shell
echo 'export ORACLE_HOME=/u01/app/oracle/product/12.2.0/dbhome_1' >> ~/.bashrc
echo 'export PATH=$ORACLE_HOME/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$ORACLE_HOME/lib' >> ~/.bashrc
source ~/.bashrc
```

CREATE PLUGGABLE DATABASE pdb_digital_platform_sit 
FROM ORCLPDB1 
FILE_NAME_CONVERT = ('/opt/oracle/oradata/ORCLCDB/ORCLPDB1/', '/opt/oracle/oradata/ORCLCDB/pdb_digital_platform_sit/');

docker cp my-nginx:/etc/nginx/nginx.conf ./nginx.conf
docker cp myfile.conf temp-nginx:/etc/nginx/sites-enabled/

docker cp nginx:/usr/share/nginx/html/index.html ./nginx/html
docker cp nginx:/usr/share/nginx/html/50x.html ./nginx/html

itms-services://?action=download-manifest&url=http://192.168.0.120:9080/mdms/dms-pro.plist

itms-services://?action=download-manifest&url=https://luatuni.vn/mdms/dms-pro.plist