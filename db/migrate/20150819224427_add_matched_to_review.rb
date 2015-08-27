class AddMatchedToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :matched, :integer
  end
end
