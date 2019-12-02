class CreateCampains < ActiveRecord::Migration[6.0]
  def change
    create_table :campains do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
      t.time_stamp :start_date
      t.timestamp :end_date
      t.string :producto

      t.timestamps
    end
  end
end
