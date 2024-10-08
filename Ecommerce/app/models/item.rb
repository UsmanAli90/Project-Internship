class Item < ApplicationRecord
  include Ransackable

  belongs_to :category
  has_one_attached :image
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :item_sizes
  has_many :sizes, through: :item_sizes

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :with_image, -> { joins(image_attachment: :blob) }

  def size_names
    sizes.pluck(:name) 
  end
end