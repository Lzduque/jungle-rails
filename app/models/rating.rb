class Rating < ActiveRecord::Base

  has_many :products
  belongs_to :users

  validates :products, presence: true
  validates :users, presence: true
  validates :ratings, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
