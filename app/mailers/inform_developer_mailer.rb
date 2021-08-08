class InformDeveloperMailer < ApplicationMailer
  def problem_email
    mail(to: "kinzhuvatova@gmail.com", from: "videoko2016@gmail.com", subject: "Problem happend!")
  end
end
