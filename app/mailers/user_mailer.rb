class UserMailer < ActionMailer::Base
  default from: "do-not-reply@kscios.pl"

  def reset_password(email, token)
    @token = token
    mail(to: email, subject: "Reset password instructions")
  end
end
