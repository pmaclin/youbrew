class Unique < ActiveRecord::Base
  belongs_to :batch

  validates :rand_num, :presence => true
  validates :batch_id, :presence => true
end
