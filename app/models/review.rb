class Review < ApplicationRecord
  belongs_to :restaurant

  NUMBERS = (0..5)
  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: NUMBERS }
end
