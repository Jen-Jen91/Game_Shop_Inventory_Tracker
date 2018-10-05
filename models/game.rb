require_relative("../db/sql_runner.rb")

class Game



  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @title = options["title"]
    @description = options["description"]
    @stock_quantity = options["stock_quantity"].to_i()
    @buying_cost = options["buying_cost"].to_i()
    @selling_price = options["selling_price"].to_i()
    @publisher_id = options["publisher_id"].to_i()
  end














end
