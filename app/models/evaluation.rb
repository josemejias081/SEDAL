class Evaluation < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
  
  has_many :items, dependent: :destroy

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
  
  def self.search(term)
    self.where("lower(title) LIKE lower(?)", "%#{term}%")
  end
end
