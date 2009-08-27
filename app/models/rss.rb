class Rss
  def parse! item
    item.type = self.class.to_s.downcase
    @doc = Nokogiri::XML.parse item.source
    item.title = get_node 'title'
    item.date = get_node 'pubDate'
    item.permalink = get_node 'link'
  end

  def get_node node
    @doc.css(node).first.text
  end
end