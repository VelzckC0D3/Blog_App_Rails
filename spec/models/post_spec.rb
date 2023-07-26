require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Post', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'Title must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must be less than or equal to 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'Comments counter must be an interger greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Likes counter must be an interger greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'increments the post_counter of the associated user' do
    user = User.create(name: 'Johny Sins', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'First Testing Post', text: 'I expect to be success',
                       comments_counter: 0, likes_counter: 0)

    expect { post.add_count }.to change { user.reload.posts_counter }.by(1)
  end

  it 'decrements the post_counter of the associated user' do
    user = User.create(name: 'Johny Sins', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'First Testing Post', text: 'I expect to be success',
                       comments_counter: 0, likes_counter: 0)

    expect { post.remove_count }.to change { user.reload.posts_counter }.by(-1)
  end

  it 'returns the five most recent comments' do
    user = User.create(name: 'Johny Sins', posts_counter: 0)

    post = Post.create(author_id: user.id, title: 'First Testing Post', text: 'I expect to be success',
                       comments_counter: 5, likes_counter: 5)

    Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!')
    comment1 = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!')
    comment2 = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!')
    comment3 = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!')
    comment4 = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!')
    comment5 = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!')

    newer_comments = [comment5, comment4, comment3, comment2, comment1]

    expect(post.recent_comments).to eq(newer_comments)
  end
end
