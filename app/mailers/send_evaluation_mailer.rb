class SendEvaluationMailer < ApplicationMailer
  def notify(evaluator, evaluated, evaluation)
    @evaluator = evaluator
    @evaluated = evaluated
    @evaluation = evaluation
    mail to: @evaluated.email, subject: "Responder evaluación"

  end

end
