class AddYrsexpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :yrsexp, :int
  end
end
