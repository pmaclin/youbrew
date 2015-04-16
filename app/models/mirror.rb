class Mirror < ActiveRecord::Base
  belongs_to :unique

  has_many :uniques

  validates :mrand_num, :presence => true
end
