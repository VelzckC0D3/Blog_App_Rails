require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'John Doe', posts_counter: 0) }

    before { subject.save }
    
    it 'Name must not be blank' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'Post counter must be an interger greater than or equal to 0' do
        subject.posts_counter = 0
        expect(subject).to be_valid
    end

    it 'Should return the last 3 posts' do
        user = User.create(name: 'Jane Doe', posts_counter: 0)
        Post.create(title: 'Post', comments_counter: 0, likes_counter: 0, author_id: user.id)
        post1 = Post.create(title: 'Post 1', comments_counter: 0, likes_counter: 0, author_id: user.id)
        post2 = Post.create(title: 'Post 2', comments_counter: 0, likes_counter: 0, author_id: user.id)
        post3 = Post.create(title: 'Post 3', comments_counter: 0, likes_counter: 0, author_id: user.id)
        post4 = Post.create(title: 'Post 4', comments_counter: 0, likes_counter: 0, author_id: user.id)
        post5 = Post.create(title: 'Post 5', comments_counter: 0, likes_counter: 0, author_id: user.id)

        expect(user.find_recent_posts).to eq([post5, post4, post3])
    end
end