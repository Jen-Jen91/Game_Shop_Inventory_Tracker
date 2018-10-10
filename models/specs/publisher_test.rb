require("minitest/autorun")
require("minitest/rg")
require_relative("../publisher.rb")

class TestPublisher < MiniTest::Test

  def setup()
    @publisher1 = Publisher.new({
      "name" => "Bethesda Softworks",
      "contact_name" => "Preston Garvey",
      "contact_email" => "preston.garvey@email.com"
    })
  end

  def test_publisher_has_name()
    assert_equal("Bethesda Softworks", @publisher1.name())
  end

  def test_publisher_has_contact_name()
    assert_equal("Preston Garvey", @publisher1.contact_name())
  end

  def test_publisher_has_contact_email()
    assert_equal("preston.garvey@email.com", @publisher1.contact_email())
  end

end
