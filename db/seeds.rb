require_relative("../models/game_platform.rb")
require_relative("../models/game.rb")
require_relative("../models/platform.rb")
require_relative("../models/publisher.rb")

GamePlatform.delete_all()
Game.delete_all()
Platform.delete_all()
Publisher.delete_all()

#------------------------------------------------------------------------------
# Publishers:

publisher1 = Publisher.new({
  "name" => "Sony Interactive Entertainment",
  "contact_name" => "Crash Bandicoot",
  "contact_email" => "crash.bandicoot@email.com"
})

publisher2 = Publisher.new({
  "name" => "Bethesda Softworks",
  "contact_name" => "Preston Garvey",
  "contact_email" => "preston.garvey@email.com"
})

publisher3 = Publisher.new({
  "name" => "Nintendo",
  "contact_name" => "Ash Ketchum",
  "contact_email" => "ash.ketchum@email.com"
})

publisher4 = Publisher.new({
  "name" => "Empire Interactive",
  "contact_name" => "April Ryan",
  "contact_email" => "april.ryan@email.com"
})

publisher5 = Publisher.new({
  "name" => "Electronic Arts",
  "contact_name" => "Commander Shepard",
  "contact_email" => "commander.shepard@email.com"
})

publisher1.save()
publisher2.save()
publisher3.save()
publisher4.save()
publisher5.save()

#------------------------------------------------------------------------------
# Platforms:

xbox_one = Platform.new({"name" => "Xbox One"})
xbox_one.save()
xbox360 = Platform.new({"name" => "Xbox 360"})
xbox360.save()
ps4 = Platform.new({"name" => "PS4"})
ps4.save()
ps3 = Platform.new({"name" => "PS3"})
ps3.save()
switch = Platform.new({"name" => "Nintendo Switch"})
switch.save()
pc = Platform.new({"name" => "PC"})
pc.save()

#------------------------------------------------------------------------------
# Games:

game1 = Game.new({
  "title" => "Horizon Zero Dawn",
  "description" => "Centuries after the world has fallen to animalistic machines, a young hunter named Aloy must travel the primitive land to learn the truth about her mysterious past and how this world came to be.",
  "genre" => "Action RPG",
  "stock_quantity" => 5,
  "buying_cost" => 25,
  "selling_price" => 45,
  "publisher_id" => publisher1.id
})

game2 = Game.new({
  "title" => "Fallout 4",
  "description" => "200 years after the nuclear bombs fell, you awake from cryo-sleep and must leave Vault 111 to explore a post-apocalyptic Boston and search for your kidnapped son.",
  "genre" => "Action RPG",
  "stock_quantity" => 20,
  "buying_cost" => 25,
  "selling_price" => 40,
  "publisher_id" => publisher2.id
})

game3 = Game.new({
  "title" => "The Legend of Zelda: Breath of the Wild",
  "description" => "After awakening from a century-long sleep, Link must once again find Zelda and defeat Ganon before he destroys the kingdom of Hyrule.",
  "genre" => "Action Adventure",
  "stock_quantity" => 10,
  "buying_cost" => 30,
  "selling_price" => 45,
  "publisher_id" => publisher3.id
})

game4 = Game.new({
  "title" => "The Longest Journey",
  "description" => "Concerned about her strange dreams, a young visual-arts student named April Ryan sets off on a journey to find an explanation, not knowing just how important she is to the fate of both this world, and the world of magic.",
  "genre" => "Point-and-Click Adventure",
  "stock_quantity" => 0,
  "buying_cost" => 10,
  "selling_price" => 12,
  "publisher_id" => publisher4.id
})

game5 = Game.new({
  "title" => "Mass Effect 2",
  "description" => "Two years after thwarting the Reaper invasion, Commander Shepard faces a new enemy and must assemble a team to save the galaxy from destruction.",
  "genre" => "Acton RPG, Third-Person Shooter",
  "stock_quantity" => 7,
  "buying_cost" => 20,
  "selling_price" => 25,
  "publisher_id" => publisher5.id
})

game1.save()
game2.save()
game3.save()
game4.save()
game5.save()

#------------------------------------------------------------------------------
# Game_Platforms (joiner table):

g_p1 = GamePlatform.new({"game_id" => game1.id, "platform_id" => ps4.id})
g_p2 = GamePlatform.new({"game_id" => game2.id, "platform_id" => ps4.id})
g_p3 = GamePlatform.new({"game_id" => game2.id, "platform_id" => xbox_one.id})
g_p4 = GamePlatform.new({"game_id" => game2.id, "platform_id" => pc.id})
g_p5 = GamePlatform.new({"game_id" => game3.id, "platform_id" => switch.id})
g_p6 = GamePlatform.new({"game_id" => game4.id, "platform_id" => pc.id})
g_p7 = GamePlatform.new({"game_id" => game5.id, "platform_id" => xbox360.id})
g_p8 = GamePlatform.new({"game_id" => game5.id, "platform_id" => ps3.id})
g_p9 = GamePlatform.new({"game_id" => game5.id, "platform_id" => pc.id})
g_p1.save()
g_p2.save()
g_p3.save()
g_p4.save()
g_p5.save()
g_p6.save()
g_p7.save()
g_p8.save()
g_p9.save()
