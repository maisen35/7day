class CreateTweetHashtagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :tweet_hashtag_relations do |t|
      t.integer :tweet_id
      t.integer :hashtag_id
      t.timestamps
    end
  end
end
