class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :headline
      t.text :content
      t.integer :overall_rating
      t.references :user, index: true
      t.references :batch, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :batches
  end
end
