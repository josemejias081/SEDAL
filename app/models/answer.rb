class Answer < ApplicationRecord
  validates :value, presence: true

  belongs_to :scale
end
