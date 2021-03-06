require_relative("../db/sql_runner.rb")

class GamePlatform

  attr_reader :id
  attr_accessor :game_id, :platform_id

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @game_id = options["game_id"]
    @platform_id = options["platform_id"]
  end

# -----------------------------------------------------------------------------
# CREATE
  def save()
    sql = "INSERT INTO game_platforms (game_id, platform_id)
      VALUES ($1, $2)
      RETURNING id;
    "
    values = [@game_id, @platform_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i()
  end

# For every element in "platform_ids" array (will be from input), use this as the platform_id for new object

  def self.create_from_array(game_id, platform_ids)
    for platform_id in platform_ids
      game_platform = GamePlatform.new({
        "game_id" => game_id,
        "platform_id" => platform_id
      })
      game_platform.save()
    end
  end

# -----------------------------------------------------------------------------
# DELETE
  def self.delete_all()
    sql = "DELETE FROM game_platforms;"
    SqlRunner.run(sql)
  end

  def self.delete_all_using_game(game_id)
    sql = "DELETE FROM game_platforms WHERE game_id = $1;"
    result = SqlRunner.run(sql, [game_id])
  end

  def delete()
    sql = "DELETE FROM game_platforms WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

# -----------------------------------------------------------------------------
# READ
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

# -----------------------------------------------------------------------------
# UPDATE
  def update()
    sql = "UPDATE game_platforms
      SET game_id = $1, platform_id = $2
      WHERE id = $3;
    "
    values = [@game_id, @platform_id, @id]
    SqlRunner.run(sql, values)
  end

# -----------------------------------------------------------------------------
  def game()
    sql = "SELECT * FROM games
      WHERE games.id = $1;"
    result = SqlRunner.run(sql, [@game_id])
    return result.map{|game| Game.new(game)}
  end

  def platform()
    sql = "SELECT * FROM platforms
      WHERE platforms.id = $1;"
    result = SqlRunner.run(sql, [@platform_id])
    return result.map{|platform| Platform.new(platform)}
  end


  # def self.exists?(game_id, platform_id)
  #   sql = "SELECT * FROM game_platforms
  #     WHERE game_id = $1 AND platform_id = $2;
  #   "
  #   values = [game_id, platform_id]
  #   array = SqlRunner.run(sql, values)
  #   result = array.map {|g_p| GamePlatform.new(g_p)}
  #   return !(result.length() == 0)
  # end

end
