require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John Doe', posts_counter: 0) }
  let(:post) { Post.create(author_id: user.id, title: 'Second Post', text: 'More thoughts', comments_counter: 0, likes_counter: 0) }
  let(:like) { Like.create(author_id: user.id, post_id: post.id) }

  it 'increments the LikesCounter of the associated post' do
    expect { like.add_count }.to change { post.reload.likes_counter }.by(1)
  end

  it 'decrements the LikesCounter of the associated post' do
    expect { like.remove_count }.to change { post.reload.likes_counter }.by(-1)
  end
end
