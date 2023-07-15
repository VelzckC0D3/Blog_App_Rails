require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'increments the CommentsCounter of the associated post' do
    user = User.create(name: 'John Doe', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'Firt Testing Post', text: 'I expect to be success',
                       comments_counter: 0, likes_counter: 0)

    comment = Comment.create(author_id: user.id, post_id: post.id, text: 'I expect to be success too!')
    expect { comment.add_count }.to change { post.reload.comments_counter }.by(1)
  end

  it 'decrements the CommentsCounter of the associated post' do
    user = User.create(name: 'John Doe', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'Firt Testing Post', text: 'I expect to be success',
                       comments_counter: 0, likes_counter: 0)

    comment = Comment.create(author_id: user.id, post_id: post.id, text: 'I expect to be success too!')
    expect { comment.remove_count }.to change { post.reload.comments_counter }.by(-1)
  end
end
