class Like < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  def add_count
    post.increment!(:likes_counter)
  end

  def remove_count
    post.decrement!(:likes_counter)
  end
end
