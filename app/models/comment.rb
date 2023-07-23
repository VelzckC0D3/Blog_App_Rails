class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

  validates :text, presence: true

  after_create :add_count
  after_destroy :remove_count

  def add_count
    puts 'Increment Comment Count'
    post.increment!(:comments_counter)
  end

  def remove_count
    puts 'Decrement Comment Count'
    post.decrement!(:comments_counter)
  end
end
