require("minitest/autorun")
require("minitest/rg")
require_relative("../platform.rb")

class TestPlatform < MiniTest::Test

  def setup()
    @platform1 = Platform.new({
      "name" => "PS4",
    })
  end

  def test_platform_has_name()
    assert_equal("PS4", @platform1.name())
  end

end
