class Unique < ActiveRecord::Base
  belongs_to :batch

  validates :rand_num, :presence => true
  validates :batch, :presence => true
end
