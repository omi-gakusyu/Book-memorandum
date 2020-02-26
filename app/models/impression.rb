class Impression < ApplicationRecord
  validates :star, presence:true
  validates :content, presence:true
  
  belongs_to :user
  belongs_to :book
  
  has_many :favorites
  has_many :favorite_impressions, through: :favorites, source: :user
end
