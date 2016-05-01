class Post < ActiveRecord::Base
  # if post gets deleted comments too get smashed into nothing with dependent
  has_many :comments, dependent: :destroy
  #Classic validations with title min 5chars
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
