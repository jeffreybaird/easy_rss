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
    :ttl
  ]

  class InvalidChannelOption < StandardError; end

  class Channel


    # The RSS 2.0 Spec requires a title a link and a one sentence description.
    # Because we only want valid Feeds, these parameters are required.
    attr_reader :title, :link, :description, :optional_fields

    def initialize(title, link, description, optional_fields={})
      @title, @link, @description, @optional_fields = title, link, description, optional_fields
    end

    def all_fields_valid?
      optional_fields.keys.each do |key|
        raise InvalidChannelOption, "#{key} is not an acceptable option" unless ALLOWED_FEILDS.include?(key)
      end
    end

  end
end
