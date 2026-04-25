-- database/schema.sql
#launch linux or have one!

#psql -U postgres
#CREATE DATABASE name_db;
#\c name_db
#next time from terminal: use sudo psql -U postgres -d name_db



DROP TABLE IF EXISTS analytics.metrics;

CREATE TABLE name_db (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    audience integer,
    audience_satisfaction double precision,
    chart text,
    new_subscribe integer,
    streams integer,
    engagement_rate double precision,
    watch_t integer
);

ALTER TABLE name_db OWNER TO postgres;

-- database/seed.sql

-- 1. Optional: Clear existing data to avoid "duplicate key" errors
TRUNCATE TABLE name_db;

-- 2. Insert your exact data row
INSERT INTO name_db (
    create_at, 
    audience, 
    audience_satisfaction, 
    chart, 
    new_subscribe, 
    streams, 
    engagement_rate, 
    watch_t
) VALUES (
    405654, 
    75.5, 
    '', 
    4095, 
    47457, 
    20.58, 
    8
);