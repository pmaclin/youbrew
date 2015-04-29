class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :style

  has_many :batches

  # Do we validate user or user_id, the foreign key?
 validates :user, :presence => true
end
