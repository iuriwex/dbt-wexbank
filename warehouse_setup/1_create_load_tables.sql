
DROP DATABASE IF EXISTS wexbank;
CREATE DATABASE wexbank
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


CREATE SCHEMA IF NOT EXISTS warehouse;
CREATE SCHEMA IF NOT EXISTS snapshots;
DROP TABLE IF EXISTS warehouse.customers;
CREATE TABLE warehouse.customers (
    customer_id INT,
    zipcode VARCHAR(5),
    city VARCHAR(100),
    state_code VARCHAR(2),
    datetime_created VARCHAR(100),
    datetime_updated VARCHAR(100)
);
DROP TABLE IF EXISTS warehouse.accounts;
CREATE TABLE warehouse.accounts (
    account_id INT,
    customer_id INT,
    manager_id INT,
    balance FLOAT,
    status VARCHAR(10),
    created_at VARCHAR(100)
);
DROP TABLE IF EXISTS warehouse.transactions;
CREATE TABLE warehouse.transactions (
    transaction_id VARCHAR(32),
    account_id INT,
    status VARCHAR(15),
    approved_at VARCHAR(100),
    created_at VARCHAR(100)
);
DROP TABLE IF EXISTS warehouse.state;
CREATE TABLE warehouse.state (
    state_identifier VARCHAR(10),
    state_code VARCHAR(5000),
    st_name VARCHAR(5000)
);
COPY warehouse.accounts(account_id,customer_id,balance,manager_id,created_at,status)
FROM '/input_data/accounts.csv' DELIMITER ',' CSV HEADER;

COPY warehouse.customers(customer_id, zipcode, city, state_code, datetime_created, datetime_updated)
FROM '/input_data/customer.csv' DELIMITER ',' CSV HEADER;

COPY warehouse.state(state_identifier, state_code, st_name,country_code)
FROM '/input_data/state.csv' DELIMITER ',' CSV HEADER;
COPY warehouse.orders(
    transaction_id,
    customer_id,
    transaction_status,
    approved_at
    created_at

)
FROM '/input_data/transactions.csv' DELIMITER ',' CSV HEADER;
