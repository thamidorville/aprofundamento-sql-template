-- Active: 1680612905081@@127.0.0.1@3306
-- Conecte o arquivo pratica-aprofundamento-sql.db com a extensão MySQL e ative a conexão aqui

-- Deletar tabela
DROP TABLE pokemons;

-- Criar tabela
CREATE TABLE pokemons (
    id INTEGER PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL,
    type TEXT NOT NULL,
    hp INTEGER NOT NULL,
    attack INTEGER NOT NULL,
    defense INTEGER NOT NULL,
    special_attack INTEGER NOT NULL,
    special_defense INTEGER NOT NULL,
    speed INTEGER NOT NULL
);

-- Popular tabela
INSERT INTO pokemons (
    id,
    name,
    type,
    hp,
    attack,
    defense,
    special_attack,
    special_defense,
    speed
)
VALUES 
    (1, "bulbasaur", "grass", 45, 49, 49, 65, 65, 45),
    (2, "ivysaur", "grass", 60, 62, 63, 80, 80, 60),
    (3, "venusaur", "grass", 80, 82, 83, 100, 100, 80),
    (4, "charmander", "fire", 39, 52, 43, 60, 50, 65),
    (5, "charmeleon", "fire", 58, 64, 58, 80, 65, 80),
    (6, "charizard", "fire", 78, 84, 78, 109, 85, 100),
    (7, "squirtle", "water", 44, 48, 65, 50, 64, 43),
    (8, "wartortle", "water", 59, 63, 80, 65, 80, 58),
    (9, "blastoise", "water", 79, 83, 100, 85, 105, 78);

-- Buscar todos os pokemons
SELECT * FROM pokemons;

-- Práticas
-- PRATICA 1
--BUSCAR POKEMONS QUE TENHAM SPEED MAIOR QUE 60

SELECT id, name, speed FROM pokemons 
WHERE speed > 60;

-- Buscar pokemons que tenham attack e 
--special_attack maiores ou iguais a 60

SELECT name, attack, special_attack FROM pokemons
WHERE attack >= 60 AND special_attack >= 60;

-- Buscar pokemons que tenham na coluna name 
--o termo “saur” no final do texto

SELECT name FROM pokemons
WHERE name LIKE "%saur";

--PRATICA 2

--busque ba tabela pokemons a media simples da coluna hp
SELECT AVG(hp) as mediaHp
FROM pokemons;


--busque o numero de linhas da tabela pokemons
SELECT COUNT(*) as countRows
FROM pokemons;

--Refatore as queries acima apelidando as colunas 
--com funcoes para nomes mais semanticos em camelCase

--Pratica 3
--Busque todos os pokemons e ordene-os baseado na 
--coluna defense em ordem descrescente
SELECT name, defense FROM pokemons
ORDER BY defense DESC;

-- - Busque novamente o número de pokemons cadastrados, 
-- mas agora agrupe o resultado baseado na coluna type
SELECT COUNT(*) as quantidadeDeTipos, type
FROM pokemons
GROUP BY type;

-- Busque por todos os pokemons, limite o resultado 
-- a 3 linhas iniciando a partir da quinta linha

SELECT * FROM pokemons LIMIT 3 OFFSET 4;

-- FIXACAO
-- Busque por todos os pokemons aplicando:
-- filtrar o resultado, mostrando somente os 
-- itens que possuem a coluna type valendo fire ou grass

SELECT id, name, type FROM pokemons
WHERE type IN ('fire', 'grass');

-- ordem crescente baseado na coluna attack
SELECT name, attack FROM pokemons
ORDER BY attack ASC;


-- resultado das linhas limitado a 3 e iniciando 
-- a partir da terceira linha

SELECT * FROM pokemons
LIMIT 3 OFFSET 2;
