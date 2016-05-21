require 'rss'
require 'open-uri'

class NewsFeedService
  include Service
  URL = 'http://feeds.feedburner.com/NdtvNews-TopStories'

  attr_reader :news_feeds, :guids, :db_guids

  def call
    set_news_feeds
    set_db_guids
    save_to_db
  end

  private
    def set_news_feeds
      open(URL) do |rss|
        @news_feeds = RSS::Parser.parse(rss).items
      end
    end

    def set_db_guids
      @db_guids = ::NewsFeed.order(published_at: :desc).limit(news_feeds.length).pluck(:guid)
    end

    def save_to_db
      news_feeds.each do |news_feed|
        if db_guids.exclude? news_feed.guid.content
          NewsFeed.create({
            guid: news_feed.guid.content,
            title: news_feed.title,
            link: news_feed.link,
            description: news_feed.description,
            published_at: news_feed.pubDate,
          })
        end
      end
    end
end
