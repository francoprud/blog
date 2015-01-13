class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def lastNarticles(articles,user)
    @articles = articles
    @user = user
    mail(to: @user.email, subject: 'Last 10 articles!')
  end
end
