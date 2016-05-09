module EasyRss

  ALLOWED_FEILDS = [
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
  ]

  class InvalidChannelOption < StandardError; end

  class Channel

    Image = Struct.new(:value,:url, :title, :link, :width, :height)
    Cloud = Struct.new(:value,:domain, :port, :path, :protocol)

    # The RSS 2.0 Spec requires a title a link and a one sentence description.
    # Because we only want valid Feeds, these parameters are required.
    attr_reader :title, :link, :description, :optional_fields

    def initialize(title, link, description, optional_fields={})
      @title, @link, @description, @optional_fields = title, link, description, optional_fields
    end

    # For now we want to restrict keys to the ones allowed by the RSS 2.0 spec
    def all_fields_valid?
      optional_fields.keys.each do |key|
        raise InvalidChannelOption, "#{key} is not an acceptable option. Try one of the following #{ALLOWED_FEILDS.join(", ")}" unless ALLOWED_FEILDS.include?(key)
      end
    end

  end
end
