BEGIN;
    CREATE FOREIGN TABLE IF NOT EXISTS xwalk (
        tabblk2010 NUMERIC,
        st TEXT,
        stusps TEXT,
        stname TEXT,

        cty NUMERIC,
        ctyname TEXT,

        trct NUMERIC,
        trctname TEXT,

        bgrp NUMERIC,
        bgrpname TEXT,

        cbsa NUMERIC,
        cbsaname TEXT,

        zcta NUMERIC,
        zctaname TEXT,

        stplc NUMERIC,
        stplcname TEXT,

        ctycsub NUMERIC,
        ctycsubname TEXT,

        stcd114 NUMERIC,
        stcd114name TEXT,

        stsldl NUMERIC,
        stsldlname TEXT,

        stsldu NUMERIC,
        stslduname TEXT,

        stschool NUMERIC,
        stschoolname TEXT,

        stsecon NUMERIC,
        stseconname TEXT,

        trib TEXT,
        tribname TEXT,

        tsub NUMERIC,
        tsubname TEXT,

        stanrc NUMERIC,
        stanrcname TEXT,

        necta NUMERIC,
        nectaname TEXT,

        mil NUMERIC,
        milname TEXT,

        stwib NUMERIC,
        stwibname TEXT,

        createdate DATE
    ) SERVER cstore_server;

    COPY xwalk (
        tabblk2010 ,
        st ,
        stusps ,
        stname ,

        cty ,
        ctyname ,

        trct ,
        trctname ,

        bgrp ,
        bgrpname ,

        cbsa ,
        cbsaname ,

        zcta ,
        zctaname ,

        stplc ,
        stplcname ,

        ctycsub ,
        ctycsubname ,

        stcd114 ,
        stcd114name ,

        stsldl ,
        stsldlname ,

        stsldu ,
        stslduname ,

        stschool ,
        stschoolname ,

        stsecon ,
        stseconname ,

        trib ,
        tribname ,

        tsub ,
        tsubname ,

        stanrc ,
        stanrcname ,

        necta ,
        nectaname ,

        mil ,
        milname ,

        stwib,
        stwibname,

        createdate
        )
    FROM
        '/var/lib/postgresql/data/xwalk.csv'
    WITH
        ( DELIMITER ',',
        HEADER true,
        FORMAT csv );
END;