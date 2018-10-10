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


# CREATE - save Game object first (so can access game.id), then save GamePlatform object
# Use each element in "platform_ids" array (from input) as platform_id
# Loops over each element in array, so saved game is given multiple platforms through join table

# CREATE
post("/games") do
  game = Game.new(params)
  game.save()
  for platform_id in params["platform_ids"]
    game_platform = GamePlatform.new({
      "game_id" => game.id,
      "platform_id" => platform_id
    })
    game_platform.save()
  end
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

# UPDATE
post("/games/:id") do
  game = Game.new(params)
  game.update()
  for platform_id in params["platform_ids"]
    game_platform = GamePlatform.new({
      "game_id" => game.id,
      "platform_id" => platform_id
    })
    game_platform.update()
  end
  redirect to("/games/#{params[:id]}")
end

# DESTROY
post("/games/:id/delete") do
  game = Game.find(params[:id].to_i())
  game.delete()
  redirect to("/games")
end
