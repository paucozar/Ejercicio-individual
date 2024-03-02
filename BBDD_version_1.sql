DROP DATABASE IF EXISTS Juego;
CREATE DATABASE Juego;
USE Juego;

CREATE TABLE Jugador (
    id INTEGER PRIMARY KEY NOT NULL,
    username VARCHAR(25) NOT NULL,
    password VARCHAR(20) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Partida (
    id INTEGER PRIMARY KEY NOT NULL,
    fecha VARCHAR(10) NOT NULL,
    ganador VARCHAR(25) NOT NULL,
    duracion INTEGER NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Relacion (
    jugador INTEGER NOT NULL,
    FOREIGN KEY(jugador) REFERENCES Jugador(id),
    partida INTEGER NOT NULL,
    FOREIGN KEY(partida) REFERENCES Partida(id),
    puntos INTEGER NOT NULL
)ENGINE = InnoDB;

INSERT INTO Jugador VALUES (1, 'Pau', 'Cozar');
INSERT INTO Jugador VALUES (2, 'Matias', 'Machado');
INSERT INTO Jugador VALUES (3, 'Marco', 'Garrido');
INSERT INTO Jugador VALUES (4, 'Cristina', 'Barrado');

INSERT INTO Partida VALUES (1, '1/03/2024', 'Marco', 800);
INSERT INTO Partida VALUES (2, '2/03/2024', 'Cristina', 750);
INSERT INTO Partida VALUES (3, '2/03/2024', 'Pau', 500);
INSERT INTO Partida VALUES (4, '3/03/2024', 'Matias', 650);
INSERT INTO Partida VALUES (5, '3/03/2024', 'Marco', 400);

INSERT INTO Relacion VALUES (1, 2, 8);
INSERT INTO Relacion VALUES (2, 1, 11);
INSERT INTO Relacion VALUES (4, 2, 7);
INSERT INTO Relacion VALUES (3, 3, 5);
INSERT INTO Relacion VALUES (4, 1, 10);
INSERT INTO Relacion VALUES (2, 5, 7);
INSERT INTO Relacion VALUES (4, 4, 9);
INSERT INTO Relacion VALUES (1, 5, 4);
INSERT INTO Relacion VALUES (2, 2, 6);
INSERT INTO Relacion VALUES (4, 5, 5);