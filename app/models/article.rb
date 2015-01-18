class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, :body, presence: true
  validates :body, length: { minimum: 10 }
end
