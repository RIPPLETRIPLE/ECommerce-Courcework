-- Populate Users table
INSERT INTO internet_store.users (login, password, role, status)
VALUES ('Admin', 'Admin123', 'Admin', 'Unblocked');

-- Populate Category table
INSERT INTO internet_store.category (category)
VALUES ('Clothes'), ('Electronic'), ('Shoes'), ('Food'), ('Households goods'), ('Books');

-- Populate Color table
INSERT INTO internet_store.color (color)
VALUES ('Black'), ('White'), ('Red'), ('Blue'), ('Green'), ('Orange'), ('Purple');

-- Populate size table
INSERT INTO internet_store.size (size)
VALUES ('Not needed'), ('XS'), ('S'), ('M'), ('L'), ('XL');