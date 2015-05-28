class AddUserIdToUnique < ActiveRecord::Migration
  def change
    add_column :uniques, :user_id, :int
  end
end
