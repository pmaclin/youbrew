class Batch < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :recipe

  has_many :reviews
  has_many :uniques
  has_many :unis

  validates :brew_date, :presence => true
  validates :bottle_date, :presence => true
  validates :recipe_id, :presence => true

end
