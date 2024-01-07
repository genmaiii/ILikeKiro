class ChangeDatatypeLiveNameOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :live_name, :string
  end
end
