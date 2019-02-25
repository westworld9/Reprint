class Post < ApplicationRecord
  validates :title, presence: true,  length: { in: 1..40 } 
  validates :content, presence: true,  length: { in: 50..1000 } 
  validates :description, presence: true,  length: { in: 50..1000 } 
  validates :category, presence: true
  validates :genre, presence: true
  
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "top.jpg"
    end
  end
end