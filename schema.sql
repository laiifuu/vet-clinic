/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar,
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg float 
);

ALTER TABLE animals ADD species varchar;


-- add more tables

CREATE TABLE species (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar 
);

CREATE TABLE owners (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name varchar,
    age int
);

ALTER TABLE animals 
    ADD PRIMARY KEY (id),
    DROP COLUMN species,
    ADD COLUMN species_id int REFERENCES species(id),
    ADD COLUMN owner_id int REFERENCES owners(id);

-- add tables
CREATE TABLE vets (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar,
    age int,
    date_of_graduation date
);

CREATE TABLE specializations (
    vet_id int REFERENCES vets(id),
    species_id int REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
    vet_id int REFERENCES vets(id),
    animal_id int REFERENCES animals(id),
    visit_date date,
    PRIMARY KEY (vet_id, animal_id, visit_date)
);



