class Item < ApplicationRecord
  validates :description, presence: true
  
  belongs_to :evaluation

  belongs_to :scale

  has_many :scores

  def self.search(term)
    self.where("lower(description) LIKE lower(?)", "%#{term}%")
  end
end
