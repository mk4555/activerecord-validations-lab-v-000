class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :click_bait
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 10}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  CLICKBAIT_WORDS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_WORDS.none? {|w| w.match title}
      errors.add(:title, "Must be clickbait")
    end
  end
end
