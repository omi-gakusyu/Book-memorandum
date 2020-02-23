class Impression < ApplicationRecord
  validates :star, presence:true
  validates :content, presence:true
  
  belongs_to :user
  belongs_to :book
end
