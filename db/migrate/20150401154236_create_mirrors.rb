class CreateMirrors < ActiveRecord::Migration
  def change
    create_table :mirrors do |t|
      t.integer :mrand_num
      t.references :unique, index: true

      t.timestamps null: false
    end
    add_foreign_key :mirrors, :uniques
  end
end
