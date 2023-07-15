class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  def add_count
    post.increment!(:comments_counter)
  end

  def remove_count
    post.decrement!(:comments_counter)
  end
end
