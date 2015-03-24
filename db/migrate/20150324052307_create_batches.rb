class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :size
      t.string :brew_date
      t.string :bottle_date
      t.float :aog
      t.float :afg
      t.float :aabv
      t.string :aaroma
      t.integer :aibu
      t.string :image
      t.text :aflavpro
      t.references :user, index: true
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :batches, :users
    add_foreign_key :batches, :recipes
  end
end
