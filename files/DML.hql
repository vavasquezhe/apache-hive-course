DROP DATABASE IF EXISTS DMLdb CASCADE;
CREATE DATABASE DMLdb;
USE DMLdb;

CREATE TABLE persons (
    id INT ,
    ssn VARCHAR(11),
    phone VARCHAR(14),
    city VARCHAR(30),
    maritalstatus VARCHAR(10),
    fullname VARCHAR(40),
    birthdate DATE
);
