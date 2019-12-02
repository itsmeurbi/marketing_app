class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.belongs_to :node, null: false, foreign_key: true
      t.string :content
      t.timestamp :post_at
      t.boolean :published
      t.string :facebook_id

      t.timestamps
    end
  end
end
