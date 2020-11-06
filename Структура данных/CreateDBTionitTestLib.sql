DROP DATABASE IF EXISTS TionitLib;
CREATE DATABASE TionitLib;

USE TionitLib;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
id SERIAL PRIMARY KEY,
firstName CHAR(50) NOT NULL,
lastName CHAR(50) NOT NULL,
email CHAR(50) UNIQUE NOT NULL,
typeUser ENUM('Student', 'Librarian') DEFAULT 'Student',
created_at datetime DEFAULT CURRENT_TIMESTAMP,
update_at datetime DEFAULT CURRENT_TIMESTAMP,
KEY email_key (email)
);

DROP TABLE IF EXISTS author;
CREATE TABLE author (
id SERIAL PRIMARY KEY,
name CHAR(150) NOT NULL,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
update_at datetime DEFAULT CURRENT_TIMESTAMP,
KEY name_key (name)
);


DROP TABLE IF EXISTS books;
CREATE TABLE books (
id SERIAL PRIMARY KEY,
name CHAR(150) NOT NULL,
shortName CHAR(50) NOT NULL,
authorID bigint unsigned NOT NULL,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
update_at datetime DEFAULT CURRENT_TIMESTAMP,
KEY name_key (name),
KEY shortName_key (shortName),
FOREIGN KEY (authorID) REFERENCES author(id)
);

DROP TABLE IF EXISTS Warehouse;
CREATE TABLE Warehouse (
id SERIAL PRIMARY KEY,
bookID bigint unsigned NOT NULL,
countBooks bigint unsigned NOT NULL,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
update_at datetime DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (bookID) REFERENCES books(id)
);



DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
id SERIAL PRIMARY KEY,
studentID bigint unsigned NOT NULL,
librarianID bigint unsigned NOT NULL,
bookID bigint unsigned NOT NULL,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
update_at datetime DEFAULT CURRENT_TIMESTAMP,
state ENUM('inStock', 'givenOut') DEFAULT 'inStock',
return_at datetime,
UNIQUE KEY (studentID, bookID),
FOREIGN KEY (studentID) REFERENCES users(id),
FOREIGN KEY (librarianID) REFERENCES users(id),
FOREIGN KEY (bookID) REFERENCES books(id)
)

