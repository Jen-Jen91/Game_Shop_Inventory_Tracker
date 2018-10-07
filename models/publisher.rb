require_relative("../db/sql_runner.rb")

# Refactor all .map into one 'map' function - see hw solutions

class Publisher

  attr_reader :id
  attr_accessor :name, :contact_name, :contact_email

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @contact_name = options["contact_name"]
    @contact_email = options["contact_email"]
  end


  def save()
    sql = "INSERT INTO publishers (
      name,
      contact_name,
      contact_email
      ) VALUES ($1, $2, $3)
      RETURNING id;
    "
    values = [@name, @contact_name, @contact_email]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i()
  end


  def self.delete_all()
    sql = "DELETE FROM publishers;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM publishers WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end


  def self.all()
    sql = "SELECT * FROM publishers;"
    results = SqlRunner.run(sql)
    return results.map {|publisher| Publisher.new(publisher)}
  end


  def self.find(id)
    sql = "SELECT * FROM publishers WHERE id = $1;"
    result = SqlRunner.run(sql, [id])
    return Publisher.new(result[0])
  end


  def update()
    sql = "UPDATE publishers SET
      name = $1,
      contact_name = $2,
      contact_email = $3
      WHERE id = $4;
    "
    values = [@name, @contact_name, @contact_email, @id]
    SqlRunner.run(sql, values)
  end


end
