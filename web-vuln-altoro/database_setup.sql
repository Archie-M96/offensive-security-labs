-- Database Architecture & Client Records Setup
-- Used to initialize the vulnerable AltoroMutual local database

DROP DATABASE IF EXISTS altoro_db;
CREATE DATABASE altoro_db;
USE altoro_db;

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    account_balance DECIMAL(10, 2)
);

INSERT INTO clients (username, password, first_name, last_name, account_balance)
VALUES 
    ('nmathonsi', 'pass123', 'Nomvula', 'Mathonsi', 1500.00),
    ('jviljoen', 'pass123', 'Johan', 'Viljoen', 2500.50),
    ('tmokoena', 'pass123', 'Thabo', 'Mokoena', 300.00),
    ('lndlovu', 'pass123', 'Lerato', 'Ndlovu', 45000.00),
    ('admin', 'admin123', 'Admin', 'User', 99999.99);
