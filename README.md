
[postgres@localhost ~]$ psql -U postgres -d postgres -a -f /var/lib/pgsql/11/database.sql

psql >> select pg_reload_conf()


https://stackoverflow.com/questions/5420789/how-to-install-psycopg2-with-pip-on-python


### prerequisite of source and target database ###
```
create user shop password 'shop';

create tablespace tbs_shop location '/var/lib/edb-as';
create database shop_db owner = shop tablespace = tbs_shop;
create schema shop AUTHORIZATION shop;
```
