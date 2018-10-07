require("pry")
require_relative("../models/game.rb")
require_relative("../models/publisher.rb")

Game.delete_all()
Publisher.delete_all()

game1 = Game.new({
  "title" => "Fallout 4",
  "description" => "Apocalyptic action RPG",
  "stock_quantity" => 10,
  "buying_cost" => 30,
  "selling_price" => 45
})

game1.save()

game2 = Game.new({
  "title" => "Journey",
  "description" => "Adventure, Indie",
  "stock_quantity" => 5,
  "buying_cost" => 15,
  "selling_price" => 25
})

game2.save()



publisher1 = Publisher.new({
  "name" => "Bethesda",
  "contact_name" => "Piper Wright",
  "contact_email" => "piper.wright@email.com"
})

publisher1.save()

publisher2 = Publisher.new({
  "name" => "Sony",
  "contact_name" => "Crash Bandicoot",
  "contact_email" => "crash.bandicoot@email.com"
})

publisher2.save()







binding.pry
nil
