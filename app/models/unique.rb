class Unique < ActiveRecord::Base
  belongs_to :batch
  belongs_to :user
  # belongs_to :mirror

  # has_many :mirrors

  validates :rand_num, :presence => true
  validates :batch, :presence => true
end
