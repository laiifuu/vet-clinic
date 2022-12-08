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
