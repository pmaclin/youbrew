class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes
  has_many :reviews
  has_many :batches


    # As an alternative to doing the lookup in the view..... Needs work
    # def recipe
    #   return Recipe.where({ :user_id => current_user })
    #   recipes.each do |recipe|
    # end


end
