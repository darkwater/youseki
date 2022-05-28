class AddGroupIdToBookmark < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :group_id, :integer
  end
end
