d
require 'test_helper'


class ItemTest < Minitest::Test

  def test_an_item
    assert ::EasyRss::Item.new()
  end

end
