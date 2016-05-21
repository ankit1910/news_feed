class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.string :title
      t.string :link
      t.string :description
      t.datetime :published_at
      t.string :guid

      t.timestamps null: false
    end
  end
end
