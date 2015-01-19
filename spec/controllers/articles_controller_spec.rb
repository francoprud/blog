require "rails_helper"

describe ArticlesController do
  /let(:article) { create(:article) }/
  let(:user) { create(:user) }

  describe 'POST #create' do

    context 'When creating an article correctly' do
      before(:each) do
        sign_in(user)
        user.reload
      end

      it 'increments the articles count' do
        expect { post :create, article: { title: 'a' * 10, body: 'a' * 20 } }.to change{Article.count}.by(1)
      end

      it 'expect last article to be equal' do
        post :create, article: { title: 'a' * 10, body: 'a' * 20 }
        Article.last.title.should == 'a' * 10
        Article.last.body.should == 'a' * 20
      end
    end
  end
end
