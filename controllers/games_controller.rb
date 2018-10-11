require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/game.rb")
require_relative("../models/game_platform.rb")
require_relative("../models/publisher.rb")
require_relative("../models/platform.rb")
also_reload("../models/*")

# INDEX
get("/games") do
  @games = Game.all()
  @publishers = Publisher.all()
  @platforms = Platform.all()
  erb(:"games/index")
end

# NEW
get("/games/new") do
  @publishers = Publisher.all()
  @platforms = Platform.all()
  erb(:"games/new")
end


# CREATE - save Game object first (so can access game.id)
# Use method to loop over "platform_ids" array (from input) and saves new GamePlatform object (arguments = game.id and element in array)

# CREATE
post("/games") do
  game = Game.new(params)
  game.save()
  GamePlatform.create_from_array(game.id, params["platform_ids"])
  redirect to("/games")
end


# SHOW
get("/games/:id") do
  @game = Game.find(params[:id].to_i())
  erb(:"games/show")
end

# EDIT
get("/games/:id/edit") do
  @game = Game.find(params[:id].to_i())
  @publishers = Publisher.all()
  @platforms = Platform.all()
  erb(:"games/edit")
end


# UPDATE - update Game object first (so can access game.id)
# Use method to delete all current instances in game_platforms db (avoids duplicates)
# Use method to loop over "platform_ids" array (from input) and saves new GamePlatform object (arguments = game.id and element in array)

# UPDATE
post("/games/:id") do
  game = Game.new(params)
  game.update()
  GamePlatform.delete_all_using_game(game.id)
  GamePlatform.create_from_array(game.id, params["platform_ids"])
  redirect to("/games/#{params[:id]}")
end

# DESTROY
post("/games/:id/delete") do
  game = Game.find(params[:id].to_i())
  game.delete()
  redirect to("/games")
end
