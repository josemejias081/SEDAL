class Scale < ApplicationRecord
  validates :description, presence: true 

  has_many :answers, dependent: :destroy 
  has_many :items, dependent: :nullify
  
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true 
end
