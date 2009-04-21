xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "KS Cios-Adamek Gilowice"
		xml.link posts_path( :rss)
		xml.description "Nowe wiadomości"

    for post in @posts
      xml.item do
				xml.title post.title
				xml.description post.content
				xml.pubDate post.created_at.to_s( :rfc822 )
				xml.link post_url( post)
      end
    end
  end
end
