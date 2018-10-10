require_relative("../db/sql_runner.rb")

class Game

  attr_reader :id
  attr_accessor :title, :description, :genre, :stock_quantity, :buying_cost, :selling_price, :publisher_id

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @title = options["title"]
    @description = options["description"]
    @genre = options["genre"]
    @stock_quantity = options["stock_quantity"].to_i()
    @buying_cost = options["buying_cost"].to_i()
    @selling_price = options["selling_price"].to_i()
    @publisher_id = options["publisher_id"].to_i()
  end

# -----------------------------------------------------------------------------
# CREATE
  def save()
    sql = "INSERT INTO games (
      title,
      description,
      genre,
      stock_quantity,
      buying_cost,
      selling_price,
      publisher_id
      ) VALUES ($1, $2, $3, $4, $5, $6, $7)
      RETURNING id;
    "
    values = [@title, @description, @genre, @stock_quantity, @buying_cost, @selling_price, @publisher_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i()
  end

# -----------------------------------------------------------------------------
#DELETE
  def self.delete_all()
    sql = "DELETE FROM games;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM games WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

# -----------------------------------------------------------------------------
# READ
  def self.all()
    sql = "SELECT * FROM games ORDER BY title ASC;"
    results = SqlRunner.run(sql)
    return results.map {|game| Game.new(game)}
  end


  def self.find(id)
    sql = "SELECT * FROM games WHERE id = $1;"
    result = SqlRunner.run(sql, [id])
    return Game.new(result[0])
  end

# -----------------------------------------------------------------------------
# UPDATE
  def update()
    sql = "UPDATE games SET
      title = $1,
      description = $2,
      genre = $3,
      stock_quantity = $4,
      buying_cost = $5,
      selling_price = $6,
      publisher_id = $7
      WHERE id = $8;
    "
    values = [@title, @description, @genre, @stock_quantity, @buying_cost, @selling_price, @publisher_id, @id]
    SqlRunner.run(sql, values)
  end

# -----------------------------------------------------------------------------
  def publisher()
    return Publisher.find(@publisher_id)
  end

  def markup()
    # Get the profit (price-cost), turn to float, divide by cost
    result = (@selling_price - @buying_cost).to_f() / @buying_cost
    # Return float(e.g. 0.8) x 100, then turn back to integer
    return (result * 100).to_i()
  end

  def platform()
    # Get platform data, link with joiner table, then link to games table
    sql = "SELECT platforms.* FROM platforms
      INNER JOIN game_platforms
      ON game_platforms.platform_id = platforms.id
      WHERE game_platforms.game_id = $1;"
    results = SqlRunner.run(sql, [@id])
    return results.map{|platform| Platform.new(platform)}
  end

end
