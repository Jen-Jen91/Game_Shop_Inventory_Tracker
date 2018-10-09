require("pry")
require_relative("../models/game.rb")
require_relative("../models/publisher.rb")
require_relative("../models/platform.rb")

Game.delete_all()
Publisher.delete_all()
Platform.delete_all()

xbox360 = Platform.new({"name" => "Xbox360"})
xbox360.save()
ps4 = Platform.new({"name" => "PS4"})
ps4.save()
switch = Platform.new({"name" => "Nintendo Switch"})
switch.save()
pc = Platform.new({"name" => "PC"})
pc.save()

publisher1 = Publisher.new({
  "name" => "Sony Interactive Entertainment",
  "contact_name" => "Crash Bandicoot",
  "contact_email" => "crash.bandicoot@email.com"
})

publisher1.save()

publisher2 = Publisher.new({
  "name" => "Bethesda Softworks",
  "contact_name" => "Preston Garvey",
  "contact_email" => "preston.garvey@email.com"
})

publisher2.save()

publisher3 = Publisher.new({
  "name" => "Nintendo",
  "contact_name" => "Preston Garvey",
  "contact_email" => "preston.garvey@email.com"
})

publisher3.save()


game1 = Game.new({
  "title" => "Horizon Zero Dawn",
  "description" => "Centuries after the world has fallen to animalistic machines, a young hunter named Aloy must travel the primitive land to learn the truth about her mysterious past and how this world came to be.",
  "genre" => "Action RPG",
  "stock_quantity" => 20,
  "buying_cost" => 25,
  "selling_price" => 45,
  "publisher_id" => publisher1.id
})

game1.save()

game2 = Game.new({
  "title" => "Fallout 4",
  "description" => "200 years after the nucleur bombs fell, after recently awakening from cryostasis, you must leave Vault 111 to explore a post-apocalyptic Boston and search for your kidnapped son",
  "genre" => "Action RPG",
  "stock_quantity" => 5,
  "buying_cost" => 20,
  "selling_price" => 30,
  "publisher_id" => publisher2.id
})

game2.save()

game3 = Game.new({
  "title" => "The Legend of Zelda: Breath of the Wild",
  "description" => "After awakening from a century-long sleep, Link must once again fight and defeat Ganon before he can destroy the kingdom of Hyrule.",
  "genre" => "Action Adventure",
  "stock_quantity" => 10,
  "buying_cost" => 30,
  "selling_price" => 45,
  "publisher_id" => publisher3.id
})

game3.save()



binding.pry
nil
