# frozen_string_literal: true

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: %w[Fiction Non-Fiction]
  validate :is_clickbait?

  def is_clickbait?
    if title
      unless title.include?("Won't Believe") || title.include?('Secret') || title.include?('guess') || title.include?('Top[numberr]')
        errors.add(:title, 'Not clickbait')
      end
    end
  end
end
