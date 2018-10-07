require("minitest/autorun")
require("minitest/rg")
require_relative("../publisher.rb")

class TestPublisher < MiniTest::Test

  def setup()
    @publisher1 = Publisher.new({
      "name" => "Bethesda",
      "contact_name" => "Piper Wright",
      "contact_email" => "piper.wright@email.com"
    })
  end

  def test_publisher_has_name()
    assert_equal("Bethesda", @publisher1.name())
  end

  def test_publisher_has_contact_name()
    assert_equal("Piper Wright", @publisher1.contact_name())
  end

  def test_publisher_has_contact_email()
    assert_equal("piper.wright@email.com", @publisher1.contact_email())
  end

end
