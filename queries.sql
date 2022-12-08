/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon' ;
SELECT name from animals WHERE date_of_birth < '2019-01-01' AND  date_of_birth > '2016-01-01';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3 ;
SELECT date_of_birth from animals WHERE name = 'Pikachu' OR name ='Agumon';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg <= 17.3 AND weight_kg >= 10.4;

/* transactions */
BEGIN;
UPDATE animals
SET species = 'unspecified'

SELECT species from animals; 
ROLLBACK;
SELECT species from animals; 

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE neme LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS null;

SELECT species from animals; 
COMMIT;
SELECT species FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;


BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT delete_2022_animals;

UPDATE animals
SET weight_kg = weight_kg * (-1);

ROLLBACK TO delete_2022_animals;

UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;
COMMIT;


SELECT COUNT(id) from animals;
SELECT COUNT(id) from animals WHERE escape_attempts = 0 ;
SELECT AVG(weight_kg) as avg_weight FROM animals;
SELECT SUM(escape_attempts) AS escape_attempts, neutered FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight from animals GROUP BY species;
SELECT species, AVG(escape_attempts) from animals WHERE date_of_birth between '1990-01-01' AND '2000-01-01'
GROUP BY species;

-- write queries for more tables using join
SELECT a.name, o.full_name 
FROM animals a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.id = 4;

SELECT a.id, a.name, s.name
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT full_name AS owner, name AS pet
FROM owners AS o
LEFT JOIN animals AS a ON o.id = a.owner_id
GROUP BY full_name , name 
ORDER BY full_name;

SELECT COUNT(a.id) AS animals_count, s.name
FROM animals as a
JOIN species as s ON a.species_id = s.id
GROUP BY s.name;

SELECT  name AS pet
FROM owners AS o
LEFT JOIN animals AS a ON o.id = a.owner_id
WHERE o.full_name = 'Jennifer Orwell'
GROUP BY full_name , name;

SELECT  name AS pet
FROM owners AS o
LEFT JOIN animals AS a ON o.id = a.owner_id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0
GROUP BY full_name , name;

SELECT full_name AS owner, COUNT(name) AS number_of_pets
FROM owners AS o
LEFT JOIN animals AS a ON o.id = a.owner_id
GROUP BY full_name 
ORDER BY number_of_pets DESC;