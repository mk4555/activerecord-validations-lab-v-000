class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :click_bait
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 10}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  def click_bait
    title.present? || !title.include?("True Facts")
  end
end
