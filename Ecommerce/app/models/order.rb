class Order < ApplicationRecord
  include Ransackable
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  has_one :payment
end