class Mirror < ActiveRecord::Base
  belongs_to :unique

  has_many :mirrors

  validates :mrand_num, :presence => true
end
