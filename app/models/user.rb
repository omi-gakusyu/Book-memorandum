class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum:50 }
  validates :email, presence: true, length: { maximum:50 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :impressions
  has_many :books, :through => :impressions
  
  has_many :favorites
  has_many :favorite_impressions, through: :favorites, source: :impression
  
  def favorite(impression)
    self.favorites.find_or_create_by(impression_id: impression.id)
  end
  
  def unfavorite(impression)
    favorite = self.favorites.find_by(impression_id: impression.id)
    favorite.destroy if favorite
  end
  
  def favorited?(impression)
    self.favorite_impressions.include?(impression)
  end
  
end
