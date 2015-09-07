class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :author, presence: true
  validates :description, length: { maximum: 700 }
  validates :image_url, presence: true, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'harus berupa URL untuk GIF, JPG atau PNG image.'
  }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01}

  private

    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Masih ada line items')
        return false
      end
    end
end
