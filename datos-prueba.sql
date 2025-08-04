USE frases_miticas;

INSERT INTO personajes (nombre, apellido, ocupacion, descripcion)
VALUES 
('Homer', 'Simpson', 'Inspector de seguridad en la planta nuclear', 'Padre de familia, conocido por su torpeza y amor por los donuts y la cerveza'),
('Montgomery', 'Burns', 'Dueño de la planta nuclear', 'Anciano multimillonario, jefe de Homer, malvado y manipulador'),
('Bart', 'Simpson', 'Estudiante', 'Hijo mayor de los Simpson, famoso por sus bromas telefónicas, malvado'),
('Lisa', 'Simpson', 'Estudiante', 'Es la hija mediana, extremadamente inteligente, toca el saxofón y defiende causas sociales'),
('Marge', 'Simpson', 'Ama de casa', 'Madre de la familia, conocida por su paciencia y su peinado azul característico'),
('Ned', 'Flanders', 'Vecino y cristiano devoto', 'Vecino amable y optimista de los Simpson, muy religioso y servicial'),
('Maggie', 'Simpson', 'Bebé', 'La más pequeña de la familia, siempre con su chupete y no habla');



INSERT INTO capitulos (titulo, numero_episodio, temporada, fecha_emision, sinopsis)
VALUES 
('Sin blanca Navidad', 1, 1, '1989-12-17', 'Capítulo piloto donde se presentan los personajes principales.'),
('Bart el genio', 2, 1, '1990-01-14', 'Bart cambia de escuela tras un malentendido y demuestra ser muy inteligente.'),
('El cuarteto vocal de Homer', 1, 5, '1993-09-30', 'Homer monta un grupo con sus amigos, los Sol-fa-mi-das.'),
('Homer asiste a la Universidad', 3, 5, '1993-08-14', 'Homer va a la universidad y se hace amigo de los "Gilís".'),
('La casa-árbol del terror', 3, 2, '1990-10-25', 'Es la noche de Halloween y Bart y Lisa la ambientan contando tres terroríficas historias');



INSERT INTO frases (texto, marca_tiempo, descripcion, personaje_id, capitulo_id)
VALUES 
("D'oh!", '00:01:45', "La clásica exclamación de frustración de Homer.", 1, 4),
("Excelente.", '00:13:27', "Dicho con tono siniestro por el Sr. Burns.", 2, 3),
("¡Ay Caramba!", '00:07:12', "Una de las frases más icónicas de Bart.", 3, 1),
("¡Estúpido Flanders!", '00:08:36', "Frases de Homer dirigida a su vecino, Ned Flanderst.", 1, 3);