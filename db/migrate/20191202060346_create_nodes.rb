class CreateNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :nodes do |t|
      t.belongs_to :cmapain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
