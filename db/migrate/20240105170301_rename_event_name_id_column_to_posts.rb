class RenameEventNameIdColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :event_name_id, :live_name_id
  end
end
