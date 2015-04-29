class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch

  validates :overall_rating, :presence => true
  # validates :user_id, :presence => true
  # validates :batch_id, :presence => true
end
