IF DB_ID('trens') IS NULL
BEGIN
    CREATE DATABASE trens;
END
GO

USE trens;
GO

IF OBJECT_ID('Bitllets', 'U') IS NOT NULL DROP TABLE Bitllets;
IF OBJECT_ID('Horaris', 'U') IS NOT NULL DROP TABLE Horaris;
IF OBJECT_ID('Estacions', 'U') IS NOT NULL DROP TABLE Estacions;
IF OBJECT_ID('Viatgers', 'U') IS NOT NULL DROP TABLE Viatgers;
IF OBJECT_ID('Trens', 'U') IS NOT NULL DROP TABLE Trens;
GO

CREATE TABLE Trens (
    tren_id INT PRIMARY KEY,
    capacitat INT,
    tipus_tren NVARCHAR(50)
);
GO

CREATE TABLE Estacions (
    estacio_id INT PRIMARY KEY,
    nom NVARCHAR(100),
    adreca NVARCHAR(255),
    codi_postal NVARCHAR(10)
);
GO

CREATE TABLE Viatgers (
    viatger_id INT PRIMARY KEY,
    nom NVARCHAR(100),
    telefon NVARCHAR(15),
    email NVARCHAR(100)
);
GO

CREATE TABLE Horaris (
    horari_id INT PRIMARY KEY,
    tren_id INT FOREIGN KEY REFERENCES Trens(tren_id),
    estacio_origen_id INT FOREIGN KEY REFERENCES Estacions(estacio_id),
    estacio_desti_id INT FOREIGN KEY REFERENCES Estacions(estacio_id),
    data_arribada DATETIME,
    data_sortida DATETIME
);
GO

CREATE TABLE Bitllets (
    bitllet_id INT PRIMARY KEY,
    viatger_id INT FOREIGN KEY REFERENCES Viatgers(viatger_id),
    tren_id INT FOREIGN KEY REFERENCES Trens(tren_id),
    data_sortida DATETIME,
    data_arribada DATETIME
);
GO
