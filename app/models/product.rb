class Product < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :author, presence: true
  validates :description, length: { maximum: 500 }
  validates :image_url, presence: true, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'harus berupa URL untuk GIF, JPG atau PNG image.'
  }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01}
end
