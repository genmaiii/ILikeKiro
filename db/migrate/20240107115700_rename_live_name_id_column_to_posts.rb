class RenameLiveNameIdColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :live_name_id, :live_name
  end
end
