require 'test_helper'


class FeedTest < Minitest::Test

  def test_a_feed
    feed = ::EasyRss::Feed.new()
    assert feed
  end

end
