class Score < ApplicationRecord
  validates :value, presence: true

  belongs_to :item   
  belongs_to :test
end
 