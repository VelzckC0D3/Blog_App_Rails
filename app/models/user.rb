class User < ApplicationRecord
  before_save :generate_api_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  attribute :posts_counter, :integer, default: 0

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def generate_api_token
    self.api_token = SecureRandom.hex(16)
    puts "Generate API Token: #{api_token}"
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def all_posts
    posts.order(created_at: :desc)
  end

  def posts_user
    posts.where(author_id: id)
  end
end
