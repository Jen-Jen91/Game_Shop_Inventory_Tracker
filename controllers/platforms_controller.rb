require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/platform.rb")
also_reload("../models/*")

# INDEX
get("/platforms") do
  @platforms = Platform.all()
  erb(:"platforms/index")
end

# NEW
get("/platforms/new") do
  erb(:"platforms/new")
end

# CREATE
post("/platforms") do
  platform = Platform.new(params)
  platform.save()
  redirect to("/platforms")
end

# SHOW
get("/platforms/:id") do
  @platform = Platform.find(params['id'].to_i)
  erb(:"platforms/show")
end

# EDIT
get("/platforms/:id/edit") do
  @platform = Platform.find(params[:id].to_i())
  erb(:"platforms/edit")
end

# UPDATE
post("/platforms/:id") do
  platform = Platform.new(params)
  platform.update()
  redirect to("/platforms/#{params[:id]}")
end

# DESTROY
post("/platforms/:id/delete") do
  platform = Platform.find(params[:id].to_i())
  platform.delete()
  redirect to("/platforms")
end
