class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :add_count
  after_destroy :remove_count

  def add_count
    user.increment!(:posts_counter)
  end

  def remove_count
    user.decrement!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(3)
  end

  def all_comments
    comments.order(created_at: :desc)
  end

  # def comments just for certain author_id
  def comments_user
    comments.includes(:user).where(author_id: id)
  end
end
