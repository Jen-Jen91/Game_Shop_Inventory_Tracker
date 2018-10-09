require("sinatra")
require("sinatra/contrib/all")
require_relative("./controllers/platforms_controller.rb")
require_relative("./controllers/publishers_controller.rb")
require_relative("./controllers/games_controller.rb")

get("/") do
  @games = Game.all()
  erb(:home)
end
