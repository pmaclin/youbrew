class Uni < ActiveRecord::Base
  belongs_to :batch
  belongs_to :user
end
