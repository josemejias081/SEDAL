class Group < ApplicationRecord
  validates :section, presence: true
  validates :responsible, presence: true

  belongs_to :responsible, class_name: "User"

  has_many :users 
end
