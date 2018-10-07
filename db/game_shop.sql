DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS publishers;


CREATE TABLE publishers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE games(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  stock_quantity INT8,
  buying_cost NUMERIC,
  selling_price NUMERIC
);
