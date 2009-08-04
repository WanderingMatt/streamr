class Feed < ActiveRecord::Base

  require 'nokogiri'
  require 'open-uri'

  has_many :items

  validates_presence_of :name, :url

  before_validation_on_create :set_name

  def set_name
    doc = Nokogiri::XML(open(self.url))
    self.name = doc.css('title').first.text
  end

  private

  def self.refresh collection
    @items = []

    collection.each do |feed|
      parsed_feed = Nokogiri::XML(open(feed.url))
      parsed_feed.css('item').each do |item|
        @items << item
      end
    end

    @items
  end
end
