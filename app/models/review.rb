class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch

  # validates :overall_rating, :presence => true
  # validates :user, :presence => true
  # validates :batch, :presence => true

  # validates_uniqueness_of :new_number
end
