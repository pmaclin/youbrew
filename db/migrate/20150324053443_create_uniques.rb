class CreateUniques < ActiveRecord::Migration
  def change
    create_table :uniques do |t|
      t.integer :rand_num
      t.references :batch, index: true

      t.timestamps null: false
    end
    add_foreign_key :uniques, :batches
  end
end
