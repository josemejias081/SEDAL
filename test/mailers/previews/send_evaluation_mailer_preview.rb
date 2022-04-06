# Preview all emails at http://localhost:3000/rails/mailers/send_evaluation_mailer
class SendEvaluationMailerPreview < ActionMailer::Preview
  def notify
    evaluated = User.new(name: "Sample User", email: "sample@mail.com")
    evaluator = User.new(name: "Sample User", email: "sample2@mail.com")
    evaluation = Evaluation.new()
    SendEvaluationMailer.notify(evaluator, evaluated, evaluation) 
  end

end
