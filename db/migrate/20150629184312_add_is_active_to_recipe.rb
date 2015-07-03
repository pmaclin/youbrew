class AddIsActiveToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :is_active, :boolean
  end
end
