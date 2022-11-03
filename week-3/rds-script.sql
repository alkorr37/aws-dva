CREATE DATABASE TestDb;

CREATE TABLE employees (
    id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

INSERT INTO employees (name, email)
VALUES
    ('test1', 'test1@test.com'),
    ('test2', 'test2@test.com');

SELECT * FROM employees;