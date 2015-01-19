require "rails_helper"

describe UsersController do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  describe 'POST #create' do

    context 'When creating a user correctly' do

      xit 'increments the users count' do
        expect { post :create, user: { email: 'asdasdasd@gmail.com', password: 'password', password_confirmation: 'password' } }.to change{ User.count }.by(1)
      end
    end
  end
end
