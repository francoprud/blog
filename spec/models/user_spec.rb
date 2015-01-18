require "rails_helper"

describe User do

  describe '#create' do

    let(:user) { User.new }

    context 'Creating an invalid User' do

      it 'validates the email' do
        user.email = nil
        expect(user.valid?).to be false
        expect(user.errors[:email].size).to eq(1)
      end

      it 'validates the password not to be nil' do
        user.password = nil
        expect(user.valid?).to be false
        expect(user.errors[:password].size).to eq(1)
      end

      it 'validates the password not to be shorter than 8 characters' do
        user.password = "a" * 7
        expect(user.valid?).to be false
        expect(user.errors[:password].size).to eq(1)
      end

      it 'validates the complete user' do
        user.email = nil
        user.password = nil
        expect(user.valid?).to be false
        expect(user.errors.size).to eq(2)
      end

      it 'validates user not to duplicate mails'
    end

    context 'Creating a valid user' do

      it 'creates the user' do
        user.email = "asdasd@gmail.com";
        user.password = "a" * 10;
        expect(user.valid?).to be true
      end
    end
  end
end
