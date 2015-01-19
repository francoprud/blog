require "rails_helper"

describe CommentsController do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  describe 'POST #create' do

    context 'When creating a comment correctly' do
      before(:each) do
        sign_in(user)
        user.reload
        post :create, article_id: article.id, comment: { body: 'a' * 20 }
      end

      it 'increments the comments count' do
        expect { post :create, article_id: article.id, comment: { body: 'a' * 20 } }.to change{ Comment.count }.by(1)
      end

      it 'expect last comment to be equal to the article id' do
        Comment.last.article_id.should == article.id
      end

      it 'expect last comment to be equal to the user id' do
        Comment.last.body.should == 'a' * 20
      end

      it 'expect last comment to be equal to the user id' do
        Comment.last.user_id.should == user.id
      end
    end
  end
end
