class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :img_url
      t.integer :folder_id
    end
  end
end
