class Product < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 50 }
  validates :author, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
  validates :image_url, presence: true
  validates :price, presence: true
end
