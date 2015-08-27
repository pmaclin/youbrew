class AddIsReviewedToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :is_reviewed, :boolean
  end
end
