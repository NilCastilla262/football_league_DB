IF DB_ID('biblioteca') IS NULL
BEGIN
    CREATE DATABASE biblioteca;
END
GO

USE biblioteca;
GO

IF OBJECT_ID('Prestecs', 'U') IS NOT NULL DROP TABLE Prestecs;
IF OBJECT_ID('Llibres', 'U') IS NOT NULL DROP TABLE Llibres;
IF OBJECT_ID('Personal', 'U') IS NOT NULL DROP TABLE Personal;
IF OBJECT_ID('Usuaris', 'U') IS NOT NULL DROP TABLE Usuaris;
GO

CREATE TABLE Usuaris (
    user_id INT PRIMARY KEY,
    nom NVARCHAR(100),
    adreça NVARCHAR(255),
    telefon INT
);
GO

CREATE TABLE Personal (
    personal_id INT PRIMARY KEY,
    nom NVARCHAR(100),
    funcio NVARCHAR(100)
);
GO

CREATE TABLE Llibres (
    llibre_id INT PRIMARY KEY,
    titol NVARCHAR(255),
    autor NVARCHAR(255),
    id_genere INT
);
GO

CREATE TABLE Prestecs (
    perstec_id INT PRIMARY KEY,
    user_id INT FOREIGN KEY REFERENCES Usuaris(user_id),
    llibre_id INT FOREIGN KEY REFERENCES Llibres(llibre_id),
    data_inici DATE,
    data_fi DATE
);
GO
