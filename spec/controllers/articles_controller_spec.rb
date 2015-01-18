require "rails_helper"

describe ArticlesController do
  let(:article) { Article.create(title: 'a' * 10, body: 'a' * 20) }
  let(:user) { User.create(email: 'asdasd@gmail.com', password: 'password')}

  describe 'POST #create' do

    context 'When creating an article correctly' do
      before(:each) do
        sign_in(user)
        user.reload
      end


      xit 'redirects to the article show' do
        post :create
        expect(Article.last).to eq article
      end
    end
  end
end
