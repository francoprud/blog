require "rails_helper"

describe Comment do

  describe '#create' do
    let(:comment) { Comment.new }

    context 'Creating an invalid Comment' do

      it 'validates the body not to be nil' do
        comment.body = nil
        expect(comment.valid?).to be false
        expect(comment.errors[:body].size).to eq(1)
      end
    end

    context 'Creating a valid Comment' do

      it 'creates the Comment' do
        comment.body = 'a' * 20;
        expect(comment.valid?).to be true
      end
    end
  end
end
