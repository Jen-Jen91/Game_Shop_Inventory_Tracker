require_relative("../db/sql_runner.rb")

# Refactor all .map into one 'map' function - see hw solutions

class Game

  attr_reader :id
  attr_accessor :title, :description, :stock_quantity, :buying_cost, :selling_price, :publisher_id

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @title = options["title"]
    @description = options["description"]
    @stock_quantity = options["stock_quantity"].to_i()
    @buying_cost = options["buying_cost"].to_i()
    @selling_price = options["selling_price"].to_i()
    @publisher_id = options["publisher_id"].to_i()
  end


  def save()
    sql = "INSERT INTO games (
      title,
      description,
      stock_quantity,
      buying_cost,
      selling_price,
      publisher_id
      ) VALUES ($1, $2, $3, $4, $5, $6)
      RETURNING id;
    "
    values = [@title, @description, @stock_quantity, @buying_cost, @selling_price, @publisher_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i()
  end


  def self.delete_all()
    sql = "DELETE FROM games;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM games WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end


  def self.all()
    sql = "SELECT * FROM games;"
    results = SqlRunner.run(sql)
    return results.map {|game| Game.new(game)}
  end


  def self.find(id)
    sql = "SELECT * FROM games WHERE id = $1;"
    result = SqlRunner.run(sql, [id])
    return Game.new(result[0])
  end


  def update()
    sql = "UPDATE games SET
      title = $1,
      description = $2,
      stock_quantity = $3,
      buying_cost = $4,
      selling_price = $5,
      publisher_id = $6
      WHERE id = $7;
    "
    values = [@title, @description, @stock_quantity, @buying_cost, @selling_price, @publisher_id, @id]
    SqlRunner.run(sql, values)
  end


  def publisher()
    sql = "SELECT * FROM publishers
      WHERE publishers.id = $1;"
    result = SqlRunner.run(sql, [@id])
    return result.map {|publisher| Publisher.new(publisher)}
  end


end
