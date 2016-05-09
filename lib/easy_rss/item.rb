module EasyRss
  class Item
    Source    = Struct.new(:value,:url)
    Enclosure = Struct.new(:value, :url, :length, :type)
    Category  = Struct.new(:value, :domain)
    GUID      = Struct.new(:value, :isPermaLink)

  end

end
