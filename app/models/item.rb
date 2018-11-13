class Item < ApplicationRecord
  belongs_to :category

  validates_presence_of :category_id
  validates :name, presence: true, uniqueness: true
  validates_numericality_of :price, :greater_than_or_equal_to => 0

  extend FriendlyId
  friendly_id :name, use: :slugged
end
