class Impression < ApplicationRecord
  validates :star, presence:true
  
  belongs_to :user
  belongs_to :book
end
