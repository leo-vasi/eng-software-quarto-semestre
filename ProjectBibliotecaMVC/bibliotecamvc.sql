create database bibliotecamvc;
use bibliotecamvc;

create table livro (
id_livro int primary key auto_increment,
nome_livro varchar(50) not null,
num_paginas int not null,
data_publicacao date not null,
preco decimal (19,2) not null,
nome_autor varchar(50) not null,
nasc_autor date not null,
nome_editora varchar(35),
livro_criacao timestamp default current_timestamp not null,
livro_edicao timestamp default current_timestamp not null,
livro_remocao timestamp default null null 
);

insert into livro (nome_livro, num_paginas, data_publicacao, preco, nome_autor, nasc_autor, nome_editora) values
('O Senhor dos Anéis', 1200, '1954-07-29', 79.90, 'J.R.R. Tolkien', '1892-01-03', 'HarperCollins'),
('Dom Quixote', 800, '1605-01-16', 49.90, 'Miguel de Cervantes', '1547-09-29', 'Penguin Classics'),
('Cem Anos de Solidão', 471, '1967-05-30', 59.90, 'Gabriel García Márquez', '1927-03-06', 'Record'),
('Orgulho e Preconceito', 432, '1813-01-28', 39.90, 'Jane Austen', '1775-12-16', 'Penguin Books'),
('O Grande Gatsby', 218, '1925-04-10', 29.90, 'F. Scott Fitzgerald', '1896-09-24', 'Scribner'), 
('Moby Dick', 635, '1851-10-18', 45.90, 'Herman Melville', '1819-08-01', 'Penguin Classics'),
('A Revolução dos Bichos', 152, '1945-08-17', 34.90, 'George Orwell', '1903-06-25', 'Secker & Warburg'),
('O Apanhador no Campo de Centeio', 277, '1951-07-16', 42.90, 'J.D. Salinger', '1919-01-01', 'Little, Brown and Company'),
('1984', 328, '1949-06-08', 44.90, 'George Orwell', '1903-06-25', 'Secker & Warburg'),
('O Sol é para Todos', 324, '1960-07-11', 39.90, 'Harper Lee', '1926-04-28', 'J.B. Lippincott & Co.'),
('A Montanha Mágica', 727, '1924-11-12', 64.90, 'Thomas Mann', '1875-06-06', 'S. Fischer Verlag'),
('Crime e Castigo', 671, '1866-01-01', 49.90, 'Fyodor Dostoevsky', '1821-11-11', 'Penguin Classics'),
('Guerra e Paz', 1225, '1869-01-01', 79.90, 'Leo Tolstoy', '1828-09-09', 'The Russian Messenger'),
('Ulisses', 730, '1922-02-02', 59.90, 'James Joyce', '1882-02-02', 'Shakespeare and Company'),
('O Morro dos Ventos Uivantes', 416, '1847-12-17', 34.90, 'Emily Brontë', '1818-07-30', 'Penguin Books'),
('O Conde de Monte Cristo', 1243, '1844-08-28', 89.90, 'Alexandre Dumas', '1802-07-24', 'Penguin Classics'),
('A Ilíada', 704, '800-01-01', 49.90, 'Homero', '0810-01-01', 'Penguin Classics'),
('A Odisséia', 541, '800-01-01', 49.90, 'Homero', '0810-01-01', 'Penguin Classics'),
('O Processo', 304, '1925-01-01', 39.90, 'Franz Kafka', '1883-07-03', 'Penguin Classics'),
('O Estrangeiro', 123, '1942-06-01', 29.90, 'Albert Camus', '1913-11-07', 'Gallimard');


select * from livro;