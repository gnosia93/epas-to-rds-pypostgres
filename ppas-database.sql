create user shop password 'shop';

create tablespace tbs_shop location '/var/lib/edb-as';
create database shop_db owner = shop tablespace = tbs_shop;
create schema shop AUTHORIZATION shop;
