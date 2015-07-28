class AddIsUsedToUni < ActiveRecord::Migration
  def change
    add_column :unis, :is_used, :boolean
  end
end
