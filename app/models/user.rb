class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def find_first_post
    posts.order(created_at: :asc).limit(1)
  end
end
