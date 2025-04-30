-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;

--SELECT * FROM regions;
--SELECT * FROM species;
--SELECT * FROM climate;
--SELECT * FROM observations;


-- MISSION 1
-- Your query here

SELECT 
    regions.name,
    regions.country,
    COUNT(DISTINCT species.id) AS total_species
FROM
    observations
        JOIN
    species ON observations.species_id = species.id
        JOIN
    regions ON observations.region_id = regions.id
GROUP BY regions.name , regions.country
ORDER BY total_species DESC;

-- MISSION 2
-- Your query here:
SELECT 
    MONTH(observations.observation_date) AS month, COUNT(*) AS total_observations
FROM
    observations
    group by month
ORDER BY total_observations DESC;

-- MISSION 3
-- Your query here:
SELECT 
    common_name, SUM(count) AS cuenta
FROM
    species
        JOIN
    observations ON observations.species_id = species.id
GROUP BY common_name
HAVING cuenta < 3
ORDER BY cuenta;

-- MISSION 4
-- Your query here:
SELECT 
    regions.name,
    regions.country,
    COUNT(DISTINCT species.id) AS total_species,
    sum(count) as veces_observados
FROM
    observations
        JOIN
    species ON observations.species_id = species.id
        JOIN
    regions ON observations.region_id = regions.id
GROUP BY regions.name , regions.country
ORDER BY total_species DESC
LIMIT 1;

-- MISSION 5
-- Your query here:
SELECT 
    scientific_name,common_name, SUM(count) AS cuenta
FROM
    species
        JOIN
    observations ON observations.species_id = species.id
GROUP BY species_id
ORDER BY cuenta DESC
LIMIT 10;

-- MISSION 6
-- Your query here:
SELECT 
    observer, count
FROM
    observations
ORDER BY count DESC
LIMIT 10;

-- MISSION 7
-- Your query here:
SELECT 
    scientific_name, common_name
FROM
    species
        LEFT JOIN
    observations ON species.id = observations.species_id
WHERE
    observations.species_id IS NULL;

-- MISSION 8
-- Your query here:
SELECT 
    observation_date,
    COUNT(DISTINCT (species_id)) AS total_observations
FROM
    observations
GROUP BY observation_date
ORDER BY total_observations DESC
LIMIT 10;

