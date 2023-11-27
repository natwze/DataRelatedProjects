USE poke_info;

DROP TABLE IF EXISTS pokemon;
DROP TABLE IF EXISTS pokemon_move;
DROP TABLE IF EXISTS pokemon_type;
DROP TABLE IF EXISTS moves;

CREATE TABLE pokemon(
  pokemon_id varchar(32) NOT NULL,
  hp int NOT NULL,
  attack int NOT NULL,
  defense int NOT NULL,
  sp_attack int NOT NULL,
  sp_defense int NOT NULL,
  speed int NOT NULL,
  base_total int NOT NULL,
  PRIMARY KEY (pokemon_id)
);

LOAD DATA INFILE '/home/coder/project/mid-term/poke-info-db/data/pokemon.csv' 
INTO TABLE pokemon 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

CREATE TABLE pokemon_type(
  sn int NOT NULL,
  pokemon_id varchar(32) NOT NULL,
  type varchar(16) NOT NULL,
  PRIMARY KEY (sn)
);

LOAD DATA INFILE '/home/coder/project/mid-term/poke-info-db/data/pokemon_type.csv' 
INTO TABLE pokemon_type 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

CREATE TABLE moves(
  move_id varchar(64) NOT NULL,
  move_name varchar(64) NOT NULL,
  move_type varchar(16) NOT NULL,
  move_category varchar(16) NOT NULL,
  move_pp int,
  move_power int,
  move_accuracy int,
  PRIMARY KEY (move_id)
);

LOAD DATA INFILE '/home/coder/project/mid-term/poke-info-db/data/moves.csv' 
INTO TABLE moves 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE pokemon_move(
  pokemon_id varchar(32) NOT NULL,
  move_id varchar(64) NOT NULL
);

LOAD DATA INFILE '/home/coder/project/mid-term/poke-info-db/data/poke_move.csv' 
INTO TABLE pokemon_move 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

ALTER TABLE pokemon_type
ADD FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id);

ALTER TABLE pokemon_move
ADD FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id);

ALTER TABLE pokemon_move
ADD FOREIGN KEY (move_id) REFERENCES moves(move_id);

SELECT pokemon_move.*
FROM pokemon_move
  LEFT JOIN moves ON moves.move_id = pokemon_move.move_id
WHERE moves.move_id IS NULL;