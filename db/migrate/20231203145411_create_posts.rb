class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :comment
      t.string :image_id
      t.date :event_date
      t.string :venue
      t.integer :event_name_id

      t.timestamps
    end
  end
end
