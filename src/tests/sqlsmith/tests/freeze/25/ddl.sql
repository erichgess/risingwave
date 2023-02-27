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
CREATE MATERIALIZED VIEW m0 AS SELECT (SMALLINT '570') AS col_0, (TIMESTAMP '2022-08-09 12:10:26') AS col_1, (SMALLINT '25') AS col_2 FROM alltypes1 AS t_0 JOIN partsupp AS t_1 ON t_0.c3 = t_1.ps_availqty GROUP BY t_0.c2, t_0.c7, t_0.c16, t_1.ps_availqty, t_0.c11;
CREATE MATERIALIZED VIEW m1 AS WITH with_0 AS (SELECT 'jdYQlISeCL' AS col_0, (length((to_char(DATE '2022-08-08', t_3.c_comment)))) AS col_1, ((INT '161')) AS col_2 FROM customer AS t_3 GROUP BY t_3.c_nationkey, t_3.c_custkey, t_3.c_comment) SELECT ARRAY[(INT '12'), (INT '640'), (INT '765')] AS col_0, DATE '2022-08-07' AS col_1, ARRAY[(SMALLINT '0'), (SMALLINT '893')] AS col_2, TIMESTAMP '2022-08-09 12:11:27' AS col_3 FROM with_0;
CREATE MATERIALIZED VIEW m2 AS WITH with_0 AS (SELECT t_2.date_time AS col_0, t_2.date_time AS col_1 FROM nation AS t_1 RIGHT JOIN bid AS t_2 ON t_1.n_comment = t_2.url GROUP BY t_1.n_comment, t_2.extra, t_2.auction, t_2.url, t_2.bidder, t_2.date_time) SELECT TIME '12:10:27' AS col_0, TIME '12:11:26' AS col_1 FROM with_0 WHERE true;
CREATE MATERIALIZED VIEW m3 AS SELECT ((INT '2147483647') / (SMALLINT '480')) AS col_0 FROM part AS t_0 WHERE ((INT '154') <= (SMALLINT '912')) GROUP BY t_0.p_size, t_0.p_type HAVING true;
CREATE MATERIALIZED VIEW m4 AS SELECT t_2.p_container AS col_0, (FLOAT '214') AS col_1, ((SMALLINT '0') * (INT '941')) AS col_2 FROM part AS t_2 WHERE (DATE '2022-08-02' > DATE '2022-08-09') GROUP BY t_2.p_container, t_2.p_size HAVING false;
CREATE MATERIALIZED VIEW m5 AS SELECT ((SMALLINT '137') | tumble_0.col_0) AS col_0 FROM tumble(m0, m0.col_1, INTERVAL '39') AS tumble_0 GROUP BY tumble_0.col_0, tumble_0.col_1;
CREATE MATERIALIZED VIEW m6 AS SELECT CAST(NULL AS STRUCT<a CHARACTER VARYING>) AS col_0 FROM orders AS t_0 JOIN m3 AS t_1 ON t_0.o_shippriority = t_1.col_0 AND (t_0.o_orderkey < (REAL '722')) WHERE false GROUP BY t_0.o_orderdate, t_0.o_comment, t_1.col_0, t_0.o_custkey, t_0.o_orderpriority;
CREATE MATERIALIZED VIEW m8 AS SELECT t_1.col_1 AS col_0, ((FLOAT '271')) AS col_1, t_1.col_1 AS col_2 FROM m3 AS t_0 LEFT JOIN m4 AS t_1 ON t_0.col_0 = t_1.col_2 AND true GROUP BY t_1.col_1 HAVING false;