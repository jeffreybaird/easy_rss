require 'test_helper'

class IntegrationTest < Minitest::Test

  Post = Struct.new(
                    :value,
                    :title,
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

  def test_that_it_generates_a_fully_correct_document
    feed = EasyRss::Feed.make do |channel|
      channel.title          = "Jeff's Blog"
      channel.link           = "http://www.jeffreyleebaird.com/"
      channel.description    = "A weblog about scripting and stuff like that."
      channel.language       = "en-us"
      channel.copyright      = "Copyright 2016 Jeffrey Baird"
      channel.managingEditor = "clarelennonbaird@gmail.com"
      channel.webMaster      = "jeff@jeffreyleebaird.com"
      channel.pubDate        = "#{Time.new(2015,12,12).strftime("%A, %d %b %Y %H:%M:%S %Z")}"
      channel.lastBuildDate  = "#{Time.new(2016,5,8).strftime("%A, %d %b %Y %H:%M:%S %Z")}"
      channel.category       = "Newspapers"
      channel.docs           = "https://validator.w3.org/feed/docs/rss2.html"
      channel.generator      = "EasyRss v#{EasyRss::VERSION}"
      channel.cloud.make do |cloud|
        cloud.domain            = "radio.xmlstoragesystem.com"
        cloud.port              = "80"
        cloud.path              = "/RPC2"
        cloud.registerProcedure = "xmlStorageSystem.rssPleaseNotify"
        cloud.protocol          = "xml-rpc"
      end
      channel.ttl            = 60
      channel.image.make do |image|
        image.url               = "http://www.jeffreyleebaird.com/img/test.png"
        image.title             = "Jeff's Blog"
        image.link              = "http://www.jeffreyleebaird.com/"
        image.width             = 100
        image.height            = 100
      end
      channel.textInput.make do |input|
        input.title             = "submit"
        input.description       = "Tell us what you think!"
        input.name              = "input"
        input.link              = "http://www.jeffreyleebaird.com/js/submit.js"
      end
      channel.skipHours      = [0,11,23]
      channel.skipDays       = ["Sunday"]
      @posts.each_with_index do |post|
        channel.item.make do |item,i|
          item.title         = post.title
          item.link          = post.link
          item.description   = post.description
          item.author        = post.author
          item.comments      = post.comments
          item.enclosure.make do |enclosure|
            enclosure.url    = post.enclosure_url
            enclosure.length = post.enclosure_length
            enclosure.type   = post.enclosure_tye
          end
          item.category.make do |category|
            category.value  = post.category
            category.domain = post.category_domain
          end
          item.source.make do |source|
            source.value = post.source
            source.url   = post.source_url
          end
          item.guid.make do |guid|
            guid.value        = post.guid
            guid.isPermaLink  = post.guid_permalink?
          end
        end
      end
    end
  end


end
