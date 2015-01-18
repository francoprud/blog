require "rails_helper"

describe Article do

  describe '#create' do

    let(:article) { Article.new }

    context 'Creating an invalid Article' do

      it 'validates the title' do
        article.title = nil
        expect(article.valid?).to be false
        expect(article.errors[:title].size).to eq(1)
      end

      it 'validates the body not to be nil' do
        article.body = nil
        expect(article.valid?).to be false
        expect(article.errors[:body].size).to eq(2)
      end

      it 'validates the body not to be shorter than 10 characters' do
        article.body = "a" * 9
        expect(article.valid?).to be false
        expect(article.errors[:body].size).to eq(1)
      end

      it 'validates the complete article' do
        article.title = nil
        article.body = nil
        expect(article.valid?).to be false
        expect(article.errors.size).to eq(3)
      end
    end

    context 'Creating a valid Article' do

      it 'creates the Article' do
        article.title = "New Article"
        article.body = "a" * 10;
        expect(article.valid?).to be true
      end
    end
  end
end
