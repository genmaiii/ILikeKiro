class RenameUserIdColumnToLives < ActiveRecord::Migration[5.2]
  def change
    rename_column :lives, :User_id, :user_id
  end
end
