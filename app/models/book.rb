class Book < ApplicationRecord
  validates :title, presence: true, length:{ maximum:255 }
  validates :writer, presence: true, length:{ maximum:50 }
  validates :isbn, presence: true, length:{ is:13 }, uniqueness:true, format:{ with: /\A[0-9]+\z/ }

  has_many :impressions
  
end
