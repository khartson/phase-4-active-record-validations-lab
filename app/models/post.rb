class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait? 

  def clickbait?
    unless title && title.match(/(Won't Believe)|(Secret)|(Top %d)|(Guess)/)
      errors.add(:title, 'Not clickbait enough!')
    end 
  end 
end
