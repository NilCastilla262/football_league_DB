CREATE TABLE Nacionalitat (
    id_nacionalitat INT PRIMARY KEY,
    nom_nacionalitat VARCHAR(55) NOT NULL
);

CREATE TABLE Jugador (
    id_jugador INT PRIMARY KEY,
    nom VARCHAR(55) NOT NULL,
    data_naix DATE,
    id_nacionalitat INT,
    FOREIGN KEY (id_nacionalitat) REFERENCES Nacionalitat(id_nacionalitat)
);

CREATE TABLE Divisio (
    id_divisio INT PRIMARY KEY,
    nom_divisio VARCHAR(50) NOT NULL
);

CREATE TABLE Equip (
    id_equip INT PRIMARY KEY,
    nom_equip VARCHAR(55) NOT NULL,
    estadi VARCHAR(55)
);

CREATE TABLE Temporada (
    id_temporada INT PRIMARY KEY,
    data_inici DATE,
    data_fi DATE
);

CREATE TABLE Partit (
    id_partit INT PRIMARY KEY,
    id_equip_local INT,
    id_equip_visitant INT,
    data_partit DATE,
    gols_visitant INT,
    gols_local INT,
    id_divisio INT,
    id_temporada INT,
    FOREIGN KEY (id_equip_local) REFERENCES Equip(id_equip),
    FOREIGN KEY (id_equip_visitant) REFERENCES Equip(id_equip),
    FOREIGN KEY (id_divisio) REFERENCES Divisio(id_divisio),
    FOREIGN KEY (id_temporada) REFERENCES Temporada(id_temporada)
);

CREATE TABLE ComposicioParticipa (
    id_jugador INT,
    id_equip INT,
    id_temporada INT,
    partits_jugats INT,
    gols_marcats INT,
    PRIMARY KEY (id_jugador, id_equip, id_temporada),
    FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador),
    FOREIGN KEY (id_equip) REFERENCES Equip(id_equip),
    FOREIGN KEY (id_temporada) REFERENCES Temporada(id_temporada)
);
