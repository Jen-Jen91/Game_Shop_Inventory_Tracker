require("sinatra")
require("sinatra/contrib/all")
require('pry')
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


# Params = all input data in form (keys are 'name')
# In CREATE, save Game object first, then save GamePlatform object
# Instead of using the whole params hash, access only the pairs 'game_id' and 'platform_ids' - latter is an array (indicated by name='platform_ids[]' in new.erb) - use 'for loop' to access each element, then use this as the value for 'platform_id' key - 'game_id' has already been saved so can access this each time we loop for each element/id in array
# Checkbox will update with each new object in platforms table


# CREATE
post("/games") do
  game = Game.new(params)
  game.save()
  for platform_id in params["platform_ids"]
    game_platform = GamePlatform.new({"game_id" => game.id, "platform_id" => platform_id}).save()
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
  erb(:"games/edit")
end

# UPDATE
post("/games/:id") do
  game = Game.new(params)
  game.update()
  redirect to("/games/#{params[:id]}")
end

# DESTROY
post("/games/:id/delete") do
  game = Game.find(params[:id].to_i())
  game.delete()
  redirect to("/games")
end
