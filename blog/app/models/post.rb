class Post < ActiveRecord::Base
  #Classic validations with title min 5chars
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
