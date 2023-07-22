class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_create :add_count # after create, increment post count
  after_destroy :remove_count # after destroy, decrement post count

  def add_count
    user.increment!(:posts_counter)
    puts "Post count: #{user.posts_counter}"
  end

  def remove_count
    user.decrement!(:posts_counter)
    puts "Post count: #{user.posts_counter}"
  end

  def find_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
