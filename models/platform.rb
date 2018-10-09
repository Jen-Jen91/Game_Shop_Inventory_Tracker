require_relative("../db/sql_runner.rb")

# Refactor all .map into one 'map' function - see hw solutions

class Platform

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
  end


  def save()
    sql = "INSERT INTO platforms (name) VALUES ($1) RETURNING id;"
    results = SqlRunner.run(sql, [@name])
    @id = results[0]["id"].to_i()
  end


  def self.delete_all()
    sql = "DELETE FROM platforms;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM platforms WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end


  def self.all()
    sql = "SELECT * FROM platforms ORDER BY name ASC;"
    results = SqlRunner.run(sql)
    return results.map {|platform| Platform.new(platform)}
  end


  def self.find(id)
    sql = "SELECT * FROM platforms WHERE id = $1;"
    result = SqlRunner.run(sql, [id])
    return Platform.new(result[0])
  end


  def update()
    sql = "UPDATE platforms SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def game()
    sql = "SELECT games.* FROM games
      INNER JOIN game_platforms
      ON game_platforms.game_id = games.id
      WHERE game_platforms.platform_id = $1;"
    result = SqlRunner.run(sql, [@id])
    return result.map{|game| Game.new(game)}
  end

end
