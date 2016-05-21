class NewsFeedsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index
  before_action :fetch_news_feeds, only: :index

  def index
    @news_feeds = NewsFeed.includes(comments: :replies).order(published_at: :desc).limit(20)
  end

  private
    def fetch_news_feeds
      begin
        # NewsFeedService.call
      rescue Exception => e
        flash[:alert] = "sdcasd"
      end
    end
end
