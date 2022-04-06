class EvaluationMailer < ApplicationMailer
  def notify(user, test)
    @user = user
    @test = test
  
    mail to: user.email, subject: "Nueva evaluación"
  end
end

