class AddIndexToFavorite < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, [:user_id, :impression_id], :unique => true
  end
end
