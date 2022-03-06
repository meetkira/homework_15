
CREATE TABLE IF NOT EXISTS animal_type
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE

);

CREATE TABLE IF NOT EXISTS animal_color
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL UNIQUE

);

CREATE TABLE IF NOT EXISTS animal_outcome_subtype
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL UNIQUE

);

CREATE TABLE IF NOT EXISTS animal_outcome_type
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL UNIQUE

);

CREATE TABLE IF NOT EXISTS animal_breed
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE

);

CREATE TABLE IF NOT EXISTS new_animals
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    age_upon_outcome TEXT NOT NULL,
    animal_id VARCHAR(7),
    animal_type_id INTEGER,
    name VARCHAR(100),
    breed_id INTEGER,
    color1_id INTEGER,
    color2_id INTEGER,
    date_of_birth DATE NOT NULL,
    outcome_subtype_id INTEGER,
    outcome_type_id INTEGER,
    outcome_month INTEGER NOT NULL,
    outcome_year INTEGER NOT NULL,

    FOREIGN KEY (animal_type_id) REFERENCES animal_type(id),
    FOREIGN KEY (color1_id) REFERENCES animal_color(id),
    FOREIGN KEY (color2_id) REFERENCES animal_color(id),
    FOREIGN KEY (outcome_subtype_id) REFERENCES animal_outcome_subtype(id),
    FOREIGN KEY (outcome_type_id) REFERENCES animal_outcome_type(id),
    FOREIGN KEY (breed_id) REFERENCES animal_breed(id)

);


