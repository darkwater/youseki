class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.string :label

      t.timestamps
    end
  end
end
