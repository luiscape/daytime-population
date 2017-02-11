BEGIN;
CREATE FOREIGN TABLE IF NOT EXISTS lodes (
    w_geocode TEXT,
    h_geocode TEXT,
    S000 NUMERIC,
    SA01 NUMERIC,
    SA02 NUMERIC,
    SA03 NUMERIC,
    SE01 NUMERIC,
    SE02 NUMERIC,
    SE03 NUMERIC,
    SI01 NUMERIC,
    SI02 NUMERIC,
    SI03 NUMERIC,
    createdate DATE
) SERVER cstore_server;

COPY lodes (
    w_geocode,
    h_geocode,
    S000,
    SA01,
    SA02,
    SA03,
    SE01,
    SE02,
    SE03,
    SI01,
    SI02,
    SI03,
    createdate
    )
FROM
    '/var/lib/postgresql/data/lodes_main.csv'
WITH
    ( DELIMITER ',',
    HEADER true,
    FORMAT csv );

COPY lodes (
    w_geocode,
    h_geocode,
    S000,
    SA01,
    SA02,
    SA03,
    SE01,
    SE02,
    SE03,
    SI01,
    SI02,
    SI03,
    createdate
    )
FROM
    '/var/lib/postgresql/data/lodes_aux.csv'
WITH
    ( DELIMITER ',',
    HEADER true,
    FORMAT csv );
END;