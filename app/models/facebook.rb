class Facebook
  FACEBOOK_ID = "189757511085174"
  FACEBOOK_ACCESS_TOKEN = "AAACEdEose0cBAF3pDZBJLAdjmQ1TS2cz6NKsa1l9ZCVJgA2oTKlY8ZCaaUIZCwZAvo2ii8ePVjmQgMegwpUJ9nGjaWRW0miOaflNqGsUmbTa7KwX5ZCFLI"

  class << self
    def client
      @client ||= Koala::Facebook::API.new(FACEBOOK_ACCESS_TOKEN)
    end

    def message_feed
      client.get_object("#{FACEBOOK_ID}/posts")
    end

    def messages(number = 10)
      message_feed.to_a[0..number]
    end
  end
end
