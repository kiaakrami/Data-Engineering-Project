-- FIRST CREATE THE DDL:

-- crops are types of fruit.
CREATE TABLE crops (
  id   INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL
);

-- orchards are what growers/farmers refer to their land.
CREATE TABLE orchards (
  id INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL
);

-- each orchards is segmented into rectangular areas called blocks.
CREATE TABLE blocks (
  id INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL,
  orchard_id INTEGER REFERENCES orchards(id),
  acres INTEGER
);

-- a single block can contain multiple crops.
CREATE TABLE blocks_crops (
  block_id INTEGER REFERENCES blocks(id),
  crop_id INTEGER REFERENCES crops(id),
  UNIQUE(block_id, crop_id)
);

-- now, insert some data:

INSERT INTO crops (id, name) VALUES (1, 'apple'), (2, 'pear'), (3, 'almond');

INSERT INTO orchards (id, name) VALUES (1, 'Orchard 1'), (2, 'Orchard 2'), (3, 'Orchard 3');

INSERT INTO blocks (id, name, acres, orchard_id) VALUES (1, 'Block A', 20,  1);
INSERT INTO blocks (id, name, acres, orchard_id) VALUES (2, 'Block B', 10,  2);
INSERT INTO blocks (id, name, acres, orchard_id) VALUES (3, 'Block C', 40,  3);
INSERT INTO blocks (id, name, acres, orchard_id) VALUES (4, 'Block D', 20,  3);
INSERT INTO blocks (id, name, acres, orchard_id) VALUES (5, 'Block E', 200, 1);

INSERT INTO blocks_crops (block_id, crop_id) VALUES (1, 2), (1, 3);
INSERT INTO blocks_crops (block_id, crop_id) VALUES (2, 1), (2, 2);
INSERT INTO blocks_crops (block_id, crop_id) VALUES (3, 2);
INSERT INTO blocks_crops (block_id, crop_id) VALUES (5, 2);
