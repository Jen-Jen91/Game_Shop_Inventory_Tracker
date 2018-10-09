require_relative("../db/sql_runner.rb")

# Refactor all .map into one 'map' function - see hw solutions

class GamePlatform

  attr_reader :id
  attr_accessor :game_id, :platform_id

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @game_id = options["game_id"]
    @platform_id = options["platform_id"]
  end


  def save()
    sql = "INSERT INTO game_platforms (game_id, platform_id)
    VALUES ($1, $2) RETURNING id;"
    values = [@game_id, @platform_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i()
  end


  def self.delete_all()
    sql = "DELETE FROM game_platforms;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM game_platforms WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end


  def self.all()
    sql = "SELECT * FROM game_platforms;"
    results = SqlRunner.run(sql)
    return results.map {|g_p| GamePlatform.new(g_p)}
  end


  def self.find(id)
    sql = "SELECT * FROM game_platforms WHERE id = $1;"
    result = SqlRunner.run(sql, [id])
    return GamePlatform.new(result[0])
  end


  def update()
    sql = "UPDATE game_platforms
    SET game_id = $1, platform_id = $2 WHERE id = $3;"
    values = [@game_id, @platform_id, @id]
    SqlRunner.run(sql, values)
  end

end
