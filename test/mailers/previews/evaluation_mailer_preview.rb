# Preview all emails at http://localhost:3000/rails/mailers/evaluation_mailer
class EvaluationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/evaluation_mailer/notify
  def notify
    EvaluationMailer.notify User.new(name: "Sample User", email: "sample@mail.com")
  end

end
