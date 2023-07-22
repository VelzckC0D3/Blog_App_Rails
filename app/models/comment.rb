class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  after_create :add_count # after create, increment post count
  after_destroy :remove_count # after destroy, decrement post count

  def add_count
    post.increment!(:comments_counter)
  end

  def remove_count
    post.decrement!(:comments_counter)
  end
end
