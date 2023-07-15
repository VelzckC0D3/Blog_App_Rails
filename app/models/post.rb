class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :comments
  has_many :likes

  def add_count
    user.increment!(:posts_counter)
    puts "Post count: #{user.posts_counter}"
  end

  def remove_count
    user.decrement!(:posts_counter)
    puts "Post count: #{user.posts_counter}"
  end

  def find_recent_posts
    comments.order(created_at: :desc).limit(5)
  end
end
