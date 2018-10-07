require("minitest/autorun")
require("minitest/rg")
require_relative("../game.rb")

class TestGame < MiniTest::Test

  def setup()
    @game1 = Game.new({
      "title" => "Fallout 4",
      "description" => "Apocalyptic action RPG",
      "stock_quantity" => 5,
      "buying_cost" => 30,
      "selling_price" => 45
    })
  end

  def test_game_has_title()
    assert_equal("Fallout 4", @game1.title())
  end

  def test_game_has_description()
    assert_equal("Apocalyptic action RPG", @game1.description())
  end

  def test_game_has_stock_quantity()
    assert_equal(5, @game1.stock_quantity())
  end

  def test_game_has_buying_cost()
    assert_equal(30, @game1.buying_cost())
  end

  def test_game_has_selling_price()
    assert_equal(45, @game1.selling_price())
  end

end
