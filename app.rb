require("sinatra")
require("sinatra/contrib/all")
require_relative("./controllers/games_controller.rb")
require_relative("./controllers/publishers_controller.rb")

get("/") do
  erb(:home)
end
