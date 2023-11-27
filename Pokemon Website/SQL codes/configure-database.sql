DROP DATABASE IF EXISTS poke_info;
CREATE DATABASE poke_info;

USE poke_info;

DROP USER IF EXISTS 'nathanael'@'%';
CREATE USER 'nathanael'@'%' IDENTIFIED WITH mysql_native_password BY 'pokedb'; 
GRANT ALL ON poke_info.* TO 'nathanael'@'%';
