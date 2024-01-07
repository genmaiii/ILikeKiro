class RenameEventDateColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :event_date, :live_date
  end
end
