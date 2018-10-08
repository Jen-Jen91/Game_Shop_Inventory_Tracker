require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/publisher.rb")
also_reload("../models/*")

# INDEX
get("/publishers") do
  @publishers = Publisher.all()
  erb(:"publishers/index")
end

# SHOW
get("/publishers/:id") do
  @publisher = Publisher.find(params['id'].to_i)
  erb(:"publishers/show")
end
