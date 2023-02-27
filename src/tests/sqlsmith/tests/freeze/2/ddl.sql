CREATE TABLE supplier (s_suppkey INT, s_name CHARACTER VARYING, s_address CHARACTER VARYING, s_nationkey INT, s_phone CHARACTER VARYING, s_acctbal NUMERIC, s_comment CHARACTER VARYING, PRIMARY KEY (s_suppkey));
CREATE TABLE part (p_partkey INT, p_name CHARACTER VARYING, p_mfgr CHARACTER VARYING, p_brand CHARACTER VARYING, p_type CHARACTER VARYING, p_size INT, p_container CHARACTER VARYING, p_retailprice NUMERIC, p_comment CHARACTER VARYING, PRIMARY KEY (p_partkey));
CREATE TABLE partsupp (ps_partkey INT, ps_suppkey INT, ps_availqty INT, ps_supplycost NUMERIC, ps_comment CHARACTER VARYING, PRIMARY KEY (ps_partkey, ps_suppkey));
CREATE TABLE customer (c_custkey INT, c_name CHARACTER VARYING, c_address CHARACTER VARYING, c_nationkey INT, c_phone CHARACTER VARYING, c_acctbal NUMERIC, c_mktsegment CHARACTER VARYING, c_comment CHARACTER VARYING, PRIMARY KEY (c_custkey));
CREATE TABLE orders (o_orderkey BIGINT, o_custkey INT, o_orderstatus CHARACTER VARYING, o_totalprice NUMERIC, o_orderdate DATE, o_orderpriority CHARACTER VARYING, o_clerk CHARACTER VARYING, o_shippriority INT, o_comment CHARACTER VARYING, PRIMARY KEY (o_orderkey));
CREATE TABLE lineitem (l_orderkey BIGINT, l_partkey INT, l_suppkey INT, l_linenumber INT, l_quantity NUMERIC, l_extendedprice NUMERIC, l_discount NUMERIC, l_tax NUMERIC, l_returnflag CHARACTER VARYING, l_linestatus CHARACTER VARYING, l_shipdate DATE, l_commitdate DATE, l_receiptdate DATE, l_shipinstruct CHARACTER VARYING, l_shipmode CHARACTER VARYING, l_comment CHARACTER VARYING, PRIMARY KEY (l_orderkey, l_linenumber));
CREATE TABLE nation (n_nationkey INT, n_name CHARACTER VARYING, n_regionkey INT, n_comment CHARACTER VARYING, PRIMARY KEY (n_nationkey));
CREATE TABLE region (r_regionkey INT, r_name CHARACTER VARYING, r_comment CHARACTER VARYING, PRIMARY KEY (r_regionkey));
CREATE TABLE person (id BIGINT, name CHARACTER VARYING, email_address CHARACTER VARYING, credit_card CHARACTER VARYING, city CHARACTER VARYING, state CHARACTER VARYING, date_time TIMESTAMP, extra CHARACTER VARYING, PRIMARY KEY (id));
CREATE TABLE auction (id BIGINT, item_name CHARACTER VARYING, description CHARACTER VARYING, initial_bid BIGINT, reserve BIGINT, date_time TIMESTAMP, expires TIMESTAMP, seller BIGINT, category BIGINT, extra CHARACTER VARYING, PRIMARY KEY (id));
CREATE TABLE bid (auction BIGINT, bidder BIGINT, price BIGINT, channel CHARACTER VARYING, url CHARACTER VARYING, date_time TIMESTAMP, extra CHARACTER VARYING);
CREATE TABLE alltypes1 (c1 BOOLEAN, c2 SMALLINT, c3 INT, c4 BIGINT, c5 REAL, c6 DOUBLE, c7 NUMERIC, c8 DATE, c9 CHARACTER VARYING, c10 TIME, c11 TIMESTAMP, c13 INTERVAL, c14 STRUCT<a INT>, c15 INT[], c16 CHARACTER VARYING[]);
CREATE TABLE alltypes2 (c1 BOOLEAN, c2 SMALLINT, c3 INT, c4 BIGINT, c5 REAL, c6 DOUBLE, c7 NUMERIC, c8 DATE, c9 CHARACTER VARYING, c10 TIME, c11 TIMESTAMP, c13 INTERVAL, c14 STRUCT<a INT>, c15 INT[], c16 CHARACTER VARYING[]);
CREATE MATERIALIZED VIEW m0 AS SELECT 'O9qRhoH81F' AS col_0 FROM lineitem AS t_0 WHERE true GROUP BY t_0.l_shipmode HAVING true;
CREATE MATERIALIZED VIEW m2 AS SELECT sq_4.col_0 AS col_0, sq_4.col_0 AS col_1 FROM (SELECT sq_3.col_0 AS col_0 FROM (SELECT (substr((TRIM(LEADING 'qDJXns2VkJ' FROM sq_2.col_0)), sq_2.col_1)) AS col_0 FROM (SELECT t_1.p_type AS col_0, CAST(false AS INT) AS col_1, t_0.col_0 AS col_2 FROM m0 AS t_0 FULL JOIN part AS t_1 ON t_0.col_0 = t_1.p_comment AND ((REAL '928') >= t_1.p_retailprice) WHERE true GROUP BY t_1.p_mfgr, t_0.col_0, t_1.p_retailprice, t_1.p_type, t_1.p_size HAVING (coalesce(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false))) AS sq_2 GROUP BY sq_2.col_1, sq_2.col_0 HAVING max(true)) AS sq_3 WHERE true GROUP BY sq_3.col_0) AS sq_4 GROUP BY sq_4.col_0 HAVING true;
CREATE MATERIALIZED VIEW m3 AS SELECT sq_4.col_0 AS col_0, TIME '15:26:39' AS col_1, sq_4.col_0 AS col_2 FROM (WITH with_0 AS (WITH with_1 AS (SELECT (TIME '14:26:39' - (((INTERVAL '-1') / (FLOAT '1')) - (INTERVAL '86400'))) AS col_0, (TIMESTAMP '2022-09-19 15:25:39') AS col_1, t_3.date_time AS col_2, TIMESTAMP '2022-09-19 14:26:39' AS col_3 FROM partsupp AS t_2 FULL JOIN bid AS t_3 ON t_2.ps_comment = t_3.channel WHERE false GROUP BY t_3.date_time HAVING false) SELECT (2147483647) AS col_0, (BIGINT '957') AS col_1, false AS col_2, (34) AS col_3 FROM with_1 WHERE true) SELECT TIME '15:25:39' AS col_0 FROM with_0 WHERE false) AS sq_4 GROUP BY sq_4.col_0;
CREATE MATERIALIZED VIEW m4 AS WITH with_0 AS (SELECT ((FLOAT '968992282') / (REAL '2147483647')) AS col_0, ('O5Zz7YucKl') AS col_1, (BIGINT '734') AS col_2, (to_char(((DATE '2022-09-19' - t_1.p_size) + TIME '06:13:34'), t_1.p_type)) AS col_3 FROM part AS t_1 GROUP BY t_1.p_type, t_1.p_size, t_1.p_mfgr) SELECT DATE '2022-09-19' AS col_0, ((INT '655') + DATE '2022-09-19') AS col_1 FROM with_0;
CREATE MATERIALIZED VIEW m5 AS WITH with_0 AS (SELECT CAST(NULL AS STRUCT<a INT>) AS col_0, hop_1.c10 AS col_1 FROM hop(alltypes1, alltypes1.c11, INTERVAL '414920', INTERVAL '23235520') AS hop_1 WHERE hop_1.c1 GROUP BY hop_1.c7, hop_1.c10, hop_1.c13, hop_1.c14, hop_1.c3, hop_1.c5, hop_1.c11, hop_1.c16) SELECT false AS col_0, ((BIGINT '970') < (INT '544')) AS col_1, ((BIGINT '849') / (39)) AS col_2 FROM with_0 WHERE false;
CREATE MATERIALIZED VIEW m6 AS SELECT (INT '466') AS col_0 FROM supplier AS t_2 WHERE (true) GROUP BY t_2.s_nationkey, t_2.s_address, t_2.s_acctbal, t_2.s_suppkey HAVING false;
CREATE MATERIALIZED VIEW m7 AS SELECT (665) AS col_0, DATE '2022-09-19' AS col_1, t_1.credit_card AS col_2, t_0.c8 AS col_3 FROM alltypes2 AS t_0 FULL JOIN person AS t_1 ON t_0.c4 = t_1.id AND t_0.c1 WHERE (t_0.c6 <> (CASE WHEN t_0.c1 THEN ((SMALLINT '978') << CAST(t_0.c1 AS INT)) WHEN (t_0.c2 > (t_0.c2 % (SMALLINT '144'))) THEN (- t_0.c2) WHEN (t_0.c2 > t_0.c7) THEN t_0.c2 ELSE ((t_0.c2 % t_0.c2) # (SMALLINT '696')) END)) GROUP BY t_0.c2, t_0.c10, t_1.date_time, t_0.c8, t_0.c1, t_0.c6, t_1.credit_card, t_0.c5, t_0.c3, t_0.c15, t_0.c4, t_1.name;
CREATE MATERIALIZED VIEW m8 AS SELECT t_0.o_totalprice AS col_0 FROM orders AS t_0 LEFT JOIN m6 AS t_1 ON t_0.o_shippriority = t_1.col_0 WHERE (true) GROUP BY t_0.o_orderstatus, t_0.o_orderpriority, t_0.o_totalprice, t_0.o_clerk;
CREATE MATERIALIZED VIEW m9 AS WITH with_0 AS (SELECT 'aZ1zlkzhQF' AS col_0, 'EgnaljJoro' AS col_1, max('umu5ZahyCS') FILTER(WHERE false) AS col_2 FROM supplier AS t_1 FULL JOIN m6 AS t_2 ON t_1.s_nationkey = t_2.col_0 GROUP BY t_1.s_comment) SELECT DATE '2022-09-19' AS col_0, (BIGINT '982') AS col_1, CAST(NULL AS STRUCT<a INTERVAL, b NUMERIC>) AS col_2, (CASE WHEN true THEN (DATE '2022-09-19' - (INTERVAL '3600')) ELSE TIMESTAMP '2022-09-19 14:26:42' END) AS col_3 FROM with_0;