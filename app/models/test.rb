class Test < ApplicationRecord
  belongs_to :evaluation
  belongs_to :evaluator, class_name: "User"
  belongs_to :evaluated, class_name: "User"

  has_many :scores
  accepts_nested_attributes_for :scores
end

private
  def send_mail
    EvaluationMailer.new_evaluation(self).deliver_later
  end
