-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25)
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25)
);

CREATE TABLE primary_body (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25),
  galaxy INT NOT NULL REFERENCES galaxy(id) ON DELETE SET NULL,
  description TEXT
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  orbital_period_in_years FLOAT,
  orbits_around INT NOT NULL REFERENCES primary_body(id) ON DELETE SET NULL,
  galaxy INT NOT NULL REFERENCES galaxy(id) ON DELETE SET NULL
);

CREATE TABLE planets_moons (
  id SERIAL PRIMARY KEY,
  planet_id INT NOT NULL REFERENCES planets(id) ON DELETE CASCADE,
  moon_id INT NOT NULL REFERENCES moons(id) ON DELETE CASCADE
);

INSERT INTO moons 
    (name) 
  VALUES 
    ('The moon'), ('Phobos'), ('Deimos'), ('Naiad'), ('Thalassa'), ('Despina'), ('Galatea'), ('Larissa'), ('S/2004 N 1'), ('Proteus'), ('Triton'), ('Nereid'), ('Halimede'), ('Sao'), ('Laomedeie'), ('Psamathe'), ('Neso');

INSERT INTO galaxy 
    (name) 
  VALUES 
    ('Milky Way');

INSERT INTO primary_body 
    (name, galaxy) 
  VALUES 
    ('The Sun', 1), ('Proxima Centauri', 1), ('Gliese 876', 1);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

INSERT INTO planets_moons 
    (planet_id, moon_id) 
  VALUES 
    (1,1), (2,2), (2,3), (4,4), (4,5), (4,6), (4,7), (4,8), (4,9), (4,10), (4,11), (4,12), (4,13), (4,14), (4,15), (4,16), (4,17);