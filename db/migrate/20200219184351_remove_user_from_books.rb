class RemoveUserFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :books, :user, foreign_key: true
  end
end
