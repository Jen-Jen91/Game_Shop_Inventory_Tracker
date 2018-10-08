require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/game.rb")
also_reload("../models/*")

# INDEX
get("/games") do
  @games = Game.all()
  erb(:"games/index")
end

# SHOW
get("/games/:id") do
  @game = Game.find(params[:id].to_i())
  erb(:"games/show")
end
