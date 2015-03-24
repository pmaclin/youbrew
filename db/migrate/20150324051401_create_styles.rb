class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.text :std_flavor_profile
      t.string :com_ex_image

      t.timestamps null: false
    end
  end
end
