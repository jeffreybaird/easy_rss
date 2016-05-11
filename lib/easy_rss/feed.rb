module EasyRss
  class Feed
    
    attr_accessor :title, :link, :description

    def initialize(title, link, description, options)
      @title = title
      @link = link
      @description = description      
    end

  end
end
