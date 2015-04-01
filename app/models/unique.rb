class Unique < ActiveRecord::Base
  belongs_to :batch

  has_many :mirrors

  validates :rand_num, :presence => true
  validates :batch, :presence => true
end
