require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/publisher.rb")
also_reload("../models/*")

# INDEX
get("/publishers") do
  @publishers = Publisher.all()
  erb(:"publishers/index")
end

# NEW
get("/publishers/new") do
  erb(:"publishers/new")
end

# CREATE
post("/publishers") do
  publisher = Publisher.new(params)
  publisher.save()
  redirect to("/publishers")
end

# SHOW
get("/publishers/:id") do
  @publisher = Publisher.find(params['id'].to_i)
  erb(:"publishers/show")
end

# EDIT
get("/publishers/:id/edit") do
  @publisher = Publisher.find(params[:id].to_i())
  erb(:"publishers/edit")
end

# UPDATE
post("/publishers/:id") do
  publisher = Publisher.new(params)
  publisher.update()
  redirect to("/publishers/#{params[:id]}")
end

# DESTROY
post("/publishers/:id/delete") do
  publisher = Publisher.find(params[:id].to_i())
  publisher.delete()
  redirect to("/publishers")
end
