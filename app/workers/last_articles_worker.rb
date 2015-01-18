class LastArticlesWorker
  include Sidekiq::Worker

  def perform(user_id)
    @articles = Article.last(10)
    @user = User.find(user_id)
    UserMailer.last_ten_articles(@articles, @user).deliver_now!
  end
end
