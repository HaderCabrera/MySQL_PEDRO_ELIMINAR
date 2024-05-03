## MYSQL

Maquina vitural IP: 172.16.101.137

## Comando montar maquina virtual
```
ssh p4student@172.16.101.137
password : p4student

```
## Cambiar contraseña
```
passwd
```

##  Verificar version de MySQL
```
mysql -V
```

## instalar mysql
```
sudo apt-get install mysql-server
```
## informacion servidor
```
systemctl status mysql
```

## acceder a mysql
```
sudo mysql
```
## Cambiar contraseña a superUsuario
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1102381910';
```
## reiniciar privilegios
```
flush privileges;
```
## acceder a mysql
```
sudo mysql -u root -p
```
## Consultar IP
```
ip addr
```
## COnfiguracion de mysql
```
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```
## Reiniciar MYSQL SERVER
```
systemctl restart mysql
```
## Crear usuario desde sudo
```
create user 'root'@'%' identified by '1102381910';
```
## Dar privilegios
```
grant all privileges on *.* to 'root'@'%' with grant option;
```
