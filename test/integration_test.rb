require 'test_helper'

class IntegrationTest < Minitest::Test

  Channel = Struct.new(
                    :title,
                    :link,
                    :description,
                    :language,
                    :copyright,
                    :managingEditor,
                    :webMaster,
                    :pubDate,
                    :lastBuildDate,
                    :category,
                    :generator,
                    :docs,
                    :cloud,
                    :ttl,
                    :image,
                    :textInput,
                    :skipHours,
                    :skipDays
                  )
  Channel::Image = Struct.new()
  Channel::Cloud = Struct.new()
  Channel::TTL = Struct.new()
  Channel::TextInput = Struct.new()

  Post = Struct.new(:title,
                    :link,
                    :description,
                    :author,
                    :category,
                    :comments,
                    :enclosure,
                    :guid,
                    :pubDate,
                    :source
                    )

  Post::Source = Struct.new(:url)

  Post::Enclosure = Struct.new(:url, :length, :type)

  Post::Category = Struct.new(:domain)


end
