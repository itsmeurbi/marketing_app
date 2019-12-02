class CreateCoworkers < ActiveRecord::Migration[6.0]
  def change
    create_table :coworkers do |t|
      t.integer :role
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :campain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
