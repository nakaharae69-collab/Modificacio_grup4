
CREATE DATABASE retro_tennis;

use retro_tennis;

-- Creació de la taula
CREATE TABLE PARTIDES(
	id_player int auto_increment PRIMARY KEY,
    name VARCHAR(200),
    score int,
    date datetime DEFAULT current_timestamp,
    language VARCHAR (15)
);


-- Creació de procediment per optimitzar la consulta del ranking de 10 millor jugadors
DELIMITER //
CREATE PROCEDURE ranking10millors(
    IN p_name VARCHAR(200),
    IN p_score INT,
    IN p_language VARCHAR(15)
)
BEGIN
    -- 1. Insertem la nova partida (la data s'omple sola per defecte) 
    INSERT INTO PARTIDES (name, score, language) 
    VALUES (p_name, p_score, p_language);

    -- 2. Seleccionem les 10 millors puntuacions 
    -- Ordenem per score DESC perquè la puntuació és el temps en ms 
    SELECT name, score, date, language
    FROM PARTIDES
    ORDER BY score DESC
    LIMIT 10;
    
END //

DELIMITER ;