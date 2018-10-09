require("minitest/autorun")
require("minitest/rg")
require_relative("../game.rb")

class TestGame < MiniTest::Test

  def setup()
    @game1 = Game.new({
      "title" => "Horizon Zero Dawn",
      "description" => "Centuries after the world has fallen to animalistic machines, a young hunter named Aloy must travel the primitive land to learn the truth about her mysterious past and how this world came to be.",
      "genre" => "Action RPG",
      "stock_quantity" => 20,
      "buying_cost" => 25,
      "selling_price" => 45
    })
  end

  def test_game_has_title()
    assert_equal("Horizon Zero Dawn", @game1.title())
  end

  def test_game_has_description()
    value = "Centuries after the world has fallen to animalistic machines, a young hunter named Aloy must travel the primitive land to learn the truth about her mysterious past and how this world came to be."
    assert_equal(value, @game1.description())
  end

  def test_game_has_genre()
    assert_equal("Action RPG", @game1.genre())
  end

  def test_game_has_stock_quantity()
    assert_equal(20, @game1.stock_quantity())
  end

  def test_game_has_buying_cost()
    assert_equal(25, @game1.buying_cost())
  end

  def test_game_has_selling_price()
    assert_equal(45, @game1.selling_price())
  end

  def test_game_has_markup()
    assert_equal(80, @game1.markup())
  end

end
