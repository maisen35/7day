class RenamePostIdColumnToLikes < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :post_id, :tweet_id
  end
end
