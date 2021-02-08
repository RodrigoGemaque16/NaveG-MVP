class City < ApplicationRecord
  has_many :harbors, dependent: :restrict_with_error
  validates :name, presence: true
  
end
