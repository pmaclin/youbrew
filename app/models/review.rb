class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch

  validates :overall_rating, :presence => true
end
