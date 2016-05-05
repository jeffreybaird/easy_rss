require 'test_helper'


class ChannelTest < Minitest::Test


  def test_makes_a_channel
    assert ::EasyRss::Channel.new("Jeffrey Baird's Blog", "http://www.example.com", "An example feed" ).is_a?(EasyRss::Channel)
  end

  def test_has_title_url_description
    channel = ::EasyRss::Channel.new("Jeffrey Baird's Blog", "http://www.example.com", "An example feed" )
    assert channel.title == "Jeffrey Baird's Blog"
    assert channel.link == "http://www.example.com"
    assert channel.description == "An example feed"
  end

  def test_optional_elements
    options = {
      language: "en-us",
      copyright: "Copyright 2015",
      managingEditor: "Jeffrey Baird",
      webMaster: "Jeffrey Baird",
      pubDate: Time.new(1987,12,12),
      lastBuildDate: Time.new(2016,05,05),
      category: "Fake",
      generator: "EasyRss",
      docs: "http://www.example.com/docs",
      ttl: 60
    }
    channel = ::EasyRss::Channel.new("Jeffrey Baird's Blog", "http://www.example.com", "An example feed", options )
    assert channel.all_fields_valid?
  end

  def test_raises_exception_if_option_not_valid
    channel = ::EasyRss::Channel.new("Jeffrey Baird's Blog", "http://www.example.com", "An example feed", { bad_key: "hahaha"} )
    assert_raises(::EasyRss::InvalidChannelOption) do
      channel.all_fields_valid?
    end
  end

  


end
