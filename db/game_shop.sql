DROP TABLE IF EXISTS game_platforms;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS platforms;

CREATE TABLE platforms(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE publishers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  contact_name VARCHAR(255),
  contact_email VARCHAR(255)
);

CREATE TABLE games(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  genre VARCHAR(255),
  stock_quantity INT8,
  buying_cost NUMERIC,
  selling_price NUMERIC,
  publisher_id INT8 REFERENCES publishers(id) ON DELETE CASCADE
);

CREATE TABLE game_platforms(
  id SERIAL8 PRIMARY KEY,
  game_id INT8 REFERENCES games(id) ON DELETE CASCADE,
  platform_id INT8 REFERENCES platforms(id) ON DELETE CASCADE
)
