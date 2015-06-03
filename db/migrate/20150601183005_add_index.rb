class AddIndex < ActiveRecord::Migration
  def change
    add_index :uniques, [:user_id], name: "index_uniques_on_user_id"
  end
end
