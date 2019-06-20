select current_date + s.a as dates from generate_series(0,14) as s(a);



safe_MySQLd --skip-grant-tables &

MySQL -u root

MySQL> update MySQL.user set password=PASSWORD('新密码') where User='root';
MySQL> flush privileges;
MySQL> quit


select mid from (select max(id) over(PARTITION BY goodsid) as mid from price) t group by mid


to_char(current_date, \'YYYY-MM\')


http://www.oschina.net/translate/postgresql-vs-ms-sql-server?lang=chs&page=4#
是否有一种好的方法能把文本数组中重复的项删除。我采用以下语句解决这个问题：

SELECT akeys(hstore(my_array, my_array)) FROM my_table;

即把数组放入到HSTORE的键值对里，这样就会强制删除重复的项（因为不允许键重复），然后再从HSTORE中提取键就可以了。
