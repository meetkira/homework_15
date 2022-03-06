INSERT INTO animal_color (name)
SELECT DISTINCT TRIM(color1) as color
FROM animals
UNION
SELECT DISTINCT TRIM(color2) as color
FROM animals
WHERE color2 IS NOT NULL;

INSERT INTO animal_outcome_subtype (name)
SELECT DISTINCT outcome_subtype
FROM animals
WHERE outcome_subtype IS NOT NULL;

INSERT INTO animal_breed (name)
SELECT DISTINCT breed
FROM animals
WHERE breed IS NOT NULL;

INSERT INTO animal_outcome_type (name)
SELECT DISTINCT outcome_type
FROM animals
WHERE outcome_type IS NOT NULL;

INSERT INTO animal_type (name)
SELECT DISTINCT animal_type
FROM animals
WHERE animal_type IS NOT NULL;


INSERT INTO new_animals(age_upon_outcome,
                        animal_id,
                        animal_type_id,
                        name,
                        breed_id,
                        color1_id,
                        color2_id,
                        date_of_birth,
                        outcome_subtype_id,
                        outcome_type_id,
                        outcome_month,
                        outcome_year)
SELECT age_upon_outcome,
       animal_id,
       animal_type.id as type_id,
       animals.name,
       animal_breed.id as breed_id,
       animal_color1.id as color1_id,
       animal_color2.id as color2_id,
       date_of_birth,
       animal_outcome_subtype.id as outcome_subtype_id,
       animal_outcome_type.id as outcome_type_id,
       outcome_month,
       outcome_year
FROM animals
         LEFT JOIN animal_type ON animal_type.name = animals.animal_type
         LEFT JOIN animal_breed ON animal_breed.name = animals.breed
         LEFT JOIN animal_color as animal_color1 ON animal_color1.name = animals.color1
         LEFT JOIN animal_color as animal_color2 ON animal_color2.name = animals.color2
         LEFT JOIN animal_outcome_subtype ON animal_outcome_subtype.name = animals.outcome_subtype
         LEFT JOIN animal_outcome_type ON animal_outcome_type.name = animals.outcome_type