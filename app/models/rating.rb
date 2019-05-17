class Rating < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  # validates :rating,      presence: true
  # validates_inclusion_of :rating, :in => 1..5
end
