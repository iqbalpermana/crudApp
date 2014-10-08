class Post < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true, length: {maximum:60}
  validates :body, presence: true
end
