class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :brew_type
      t.text :description
      t.float :tog
      t.float :tfg
      t.float :tabv
      t.string :taroma
      t.integer :tibu
      t.string :label
      t.text :tflavpro
      t.references :user, index: true
      t.references :style, index: true

      t.timestamps null: false
    end
    add_foreign_key :recipes, :users
    add_foreign_key :recipes, :styles
  end
end
