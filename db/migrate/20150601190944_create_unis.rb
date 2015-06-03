class CreateUnis < ActiveRecord::Migration
  def change
    create_table :unis do |t|
      t.integer :rand_num
      t.references :batch, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :unis, :batches
    add_foreign_key :unis, :users
  end
end
