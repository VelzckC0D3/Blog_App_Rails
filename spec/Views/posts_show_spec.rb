# to execute this test on the console `rspec spec/views/posts_show_spec.rb`

require 'rails_helper'

RSpec.describe 'User integration tests', type: :feature do
  before do
    User.create(id: 1, name: 'Timothy Gerard', photo: 'testPicture1.jpg', bio: 'Teacher from Mexico.',
                posts_counter: 0)
    User.create(id: 2, name: 'Stephanie Diore', photo: 'testPicture2.png', bio: 'Teacher from Poland.',
                posts_counter: 0)

    Post.create(id: 1, author_id: 1, title: 'First Post', text: 'testing', comments_counter: 0, likes_counter: 0)
    Post.create(id: 2, author_id: 1, title: 'Second Post', text: 'testing', comments_counter: 0, likes_counter: 0)
    Post.create(id: 3, author_id: 2, title: 'Third Post', text: 'testing', comments_counter: 0, likes_counter: 0)
    Post.create(id: 4, author_id: 2, title: 'Fourth Post', text: 'testing', comments_counter: 0, likes_counter: 0)

    Comment.create(id: 1, author_id: 1, post_id: 3, text: 'This is my first comment')
    Comment.create(id: 2, author_id: 1, post_id: 3, text: 'This is my second comment')
    Comment.create(id: 3, author_id: 1, post_id: 4, text: 'This is my third comment')
    Comment.create(id: 4, author_id: 1, post_id: 4, text: 'This is my fourth comment')
    Comment.create(id: 5, author_id: 2, post_id: 1, text: 'This is my fifth comment')
    Comment.create(id: 6, author_id: 2, post_id: 1, text: 'This is my sixth comment')
    Comment.create(id: 7, author_id: 2, post_id: 2, text: 'This is my seventh comment')
    Comment.create(id: 8, author_id: 2, post_id: 2, text: 'This is my eighth comment')
  end

  def all_users
    All.users
  end

  def all_posts
    Post.all
  end

  def all_comments
    Comment.all
  end

  describe 'posts show' do
    it 'displays the post title' do
      all_posts.each do |post|
        visit user_post_path(post.author_id, post.id)
        expect(page).to have_content(post.title)
      end
    end

    it 'displays who wrote the post' do
      all_posts.each do |post|
        visit user_post_path(post.author_id, post.id)
        expect(page).to have_content(User.find(post.author_id).name)
      end
    end

    it 'displays how many comments a post has' do
      all_posts.each do |post|
        visit user_post_path(post.author_id, post.id)
        expect(page).to have_content(post.comments_counter)
      end
    end

    it 'displays how many likes a post has' do
      all_posts.each do |post|
        visit user_post_path(post.author_id, post.id)
        expect(page).to have_content(post.likes_counter)
      end
    end

    it 'displays the post body' do
      all_posts.each do |post|
        visit user_post_path(post.author_id, post.id)
        expect(page).to have_css('.posts-card')
        expect(page).to have_css('.post-card-info')
        expect(page).to have_css('.posts-card-title')
      end
    end

    it 'displays the username of the person who wrote the comment' do
      all_comments.each do |comment|
        visit user_post_path(comment.author_id, comment.post_id)
        expect(page).to have_content(User.find(comment.author_id).name)
      end
    end

    it 'displays all the comments' do
      all_comments.each do |comment|
        visit user_post_path(comment.author_id, comment.post_id)
        expect(page).to have_css('.posts-helper-cont')
      end
    end

  end
end
