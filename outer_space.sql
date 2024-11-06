-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets  --OG table was handling to much info. I have seperated the tables for future proof.
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  planet_size FLOAT NOT NULL  --Added for more Info
  orbits_around TEXT NOT NULL,
  FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id) --Changed to FK as galaxy is a independent table now.
  FOREIGN KEY (moons_id) REFERENCES moon(moons_id) --Changed to FK as moons is a independent table now.
);

CREATE TABLE galaxy --ADDED table to allow more infor to be stored in the future.
(
  galaxy_id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL,
  FOREIGN KEY (planets_id) REFERENCES planets_located_in_sytem(planets_id)
);

CREATE TABLE moons --ADDED table to allow more infor to be stored in the future.
(
  moons_id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  FOREIGN KEY (planets_id) REFERENCES planets_with_this_moon(planets_id)
);


-- How Do I enter these in correctly with FK making sense?
INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

  INSERT INTO galaxy
    (galaxy_name)
    VALUES
    ('Milky Way')

    INSERT INTO moons
    (moon_name)
    VALUES
    ('{"The Moon"}')
    ('{"Phobos", "Deimos"}')
    ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}')
    
  