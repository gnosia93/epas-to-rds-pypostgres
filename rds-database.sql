create user shop password 'shop';
grant shop to postgres;
create tablespace tbs_shop location '/rdsdbdata/db';
create database shop_db owner = shop tablespace = tbs_shop;
create schema shop AUTHORIZATION shop;
