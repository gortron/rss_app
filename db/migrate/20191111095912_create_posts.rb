class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :author_name
      t.datetime :published_time
      t.integer :feed_id
    end
  end
end
