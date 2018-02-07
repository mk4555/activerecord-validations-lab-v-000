class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 10}
  validates :category, inclusion: {in: %w(Fiction, Non-Fiction)}
end

class MyValidator < ActiveModel::Validator
