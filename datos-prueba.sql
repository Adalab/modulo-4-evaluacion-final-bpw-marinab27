USE frases_miticas;

INSERT INTO personajes (nombre, apellido, ocupacion, descripcion)
VALUES 
('Homer', 'Simpson', 'Inspector de seguridad en la planta nuclear', 'Padre de familia, conocido por su torpeza y amor por los donuts y la cerveza'),
('Montgomery', 'Burns', 'Dueño de la planta nuclear', 'Anciano multimillonario, jefe de Homer, malvado y manipulador'),
('Bart', 'Simpson', 'Estudiante', 'Hijo travieso de Homer, famoso por sus bromas telefónicas, malvado');


INSERT INTO capitulos (titulo, numero_episodio, temporada, fecha_emision, sinopsis)
VALUES 
('Sin blanca Navidad', 1, 1, '1989-12-17', 'Capítulo piloto donde se presentan los personajes principales.');


INSERT INTO frases (texto, marca_tiempo, descripcion, personaje_id, capitulo_id)
VALUES 
("D'oh!", '00:01:45', "La clásica exclamación de frustración de Homer.", 1, 1),
("Excelente.", '00:13:27', "Dicho con tono siniestro por el Sr. Burns.", 2, 1),
("¡Ay Caramba!", '00:07:12', "Una de las frases más icónicas de Bart.", 3, 1);
