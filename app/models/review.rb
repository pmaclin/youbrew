class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch

  # validates :overall_rating, :presence => true
  # validates :user, :presence => true
  # validates :batch, :presence => true
  validates :matched, :uniqueness => true

  # validates_uniqueness_of :new_number
  # validates_uniqueness_of :matched
end
