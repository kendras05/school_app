class School < ApplicationRecord
  has_many :students, dependent: :destroy

  validates :name, uniqueness: true 
  validates :name, :address, :principal, :capacity,  presence: true

  validates :capacity, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 52000 }
end
