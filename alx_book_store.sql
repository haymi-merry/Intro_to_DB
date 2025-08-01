CREATE DATABASE IF NOT EXISTS alx_book_store;
use alx_book_store;

CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY AUTOINCREMENT,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL FOREIGN KEY REFERENCES Authors(author_id),
    price DOUBLE NOT NULL,
    pubication_date DATE NOT NULL,
);
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY AUTOINCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTOINCREMENT,
    customer_id INT AUTOINCREMENT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT PRIMARY KEY AUTOINCREMENT,
    order_id INT AUTOINCREMENT,
    book_id INT AUTOINCREMENT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);