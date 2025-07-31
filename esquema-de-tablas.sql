CREATE DATABASE IF NOT EXISTS frases_miticas;
USE frases_miticas;

CREATE TABLE personajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    ocupacion VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE capitulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    numero_episodio INT NOT NULL,
    temporada INT NOT NULL,
    fecha_emision DATE,
    sinopsis TEXT
);

CREATE TABLE frases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    texto TEXT NOT NULL,
    marca_tiempo TIME,
    descripcion TEXT,
    personaje_id INT NOT NULL,
    capitulo_id INT NOT NULL,
    FOREIGN KEY (personaje_id) REFERENCES personajes(id) ON DELETE CASCADE,
    FOREIGN KEY (capitulo_id) REFERENCES capitulos(id) ON DELETE CASCADE
);

CREATE TABLE personajes_capitulos (
    personaje_id INT,
    capitulo_id INT,
    PRIMARY KEY (personaje_id, capitulo_id),
    FOREIGN KEY (personaje_id) REFERENCES personajes(id) ON DELETE CASCADE,
    FOREIGN KEY (capitulo_id) REFERENCES capitulos(id) ON DELETE CASCADE
);

