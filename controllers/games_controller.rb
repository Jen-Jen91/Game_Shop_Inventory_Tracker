require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/game.rb")
require_relative("../models/publisher.rb")
also_reload("../models/*")

# INDEX
get("/games") do
  @games = Game.all()
  erb(:"games/index")
end

# NEW
get("/games/new") do
  @publishers = Publisher.all()
  erb(:"games/new")
end

# CREATE
post("/games") do
  game = Game.new(params)
  game.save
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
  game.update
  redirect to("/games/#{params['id']}")
end

# DESTROY
