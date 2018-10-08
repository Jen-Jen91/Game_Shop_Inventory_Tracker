require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/publisher.rb")
also_reload("../models/*")

# INDEX
get("/publishers") do
  @publishers = Publisher.all()
  erb(:"publishers/index")
end
