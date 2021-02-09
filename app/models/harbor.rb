class Harbor < ApplicationRecord
  belongs_to :city
  has_one :city
  
  validates :name, presence: true
  
end
