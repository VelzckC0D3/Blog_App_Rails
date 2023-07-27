# to execute this test on the console `rspec spec/views/posts_index_spec.rb`

require 'rails_helper'

RSpec.describe 'User integration tests', type: :feature do
  before do
    User.create(id: 1, name: 'Timothy Gerard', photo: 'testPicture1.jpg', bio: 'Teacher from Mexico.',
                posts_counter: 0)
    User.create(id: 2, name: 'Stephanie Diore', photo: 'testPicture2.png', bio: 'Teacher from Poland.',
                posts_counter: 0)

    Post.create(id: 1, author_id: 1, title: 'First Post', text: 'testing', comments_counter: 0, likes_counter: 0)
    Post.create(id: 2, author_id: 2, title: 'Second Post', text: 'testing', comments_counter: 0, likes_counter: 0)
    Post.create(id: 3, author_id: 1, title: 'Third Post', text: 'testing', comments_counter: 0, likes_counter: 0)
    Post.create(id: 4, author_id: 2, title: 'Fourth Post', text: 'testing', comments_counter: 0, likes_counter: 0)

    Comment.create(id: 1, author_id: 1, post_id: 3, text: 'This is my first comment')
    Comment.create(id: 2, author_id: 1, post_id: 3, text: 'This is my second comment')
    Comment.create(id: 3, author_id: 1, post_id: 3, text: 'This is my third comment')
    Comment.create(id: 4, author_id: 2, post_id: 1, text: 'This is my fourth comment')
    Comment.create(id: 5, author_id: 2, post_id: 1, text: 'This is my fifth comment')
    Comment.create(id: 6, author_id: 2, post_id: 1, text: 'This is my sixth comment')
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

  describe 'posts index' do
    it 'displays the user image' do
      all_posts.each do |post|
        visit user_posts_path(post.author_id)
        expect(page).to have_css("img[src*='#{User.find(post.author_id).photo}']")
      end
    end

    it 'displays the user name' do
      all_posts.each do |post|
        visit user_posts_path(post.author_id)
        expect(page).to have_content(User.find(post.author_id).name)
      end
    end

    it 'displays the number of posts' do
      all_posts.each do |post|
        visit user_posts_path(post.author_id)
        expect(page).to have_content(User.find(post.author_id).posts_counter)
      end
    end

    it 'displays a post title' do
      all_posts.each do |post|
        visit user_posts_path(post.author_id)
        expect(page).to have_content(post.title)
      end
    end

    it 'displays posts body' do
      all_posts.each do |post|
        visit user_posts_path(post.author_id)
        expect(page).to have_css('.posts-display-card')
      end
    end

    it 'displays how many comments a post has' do
      all_posts.each do |post|
        visit user_posts_path(post.author_id)
        expect(page).to have_content(post.comments_counter)
      end
    end

    it 'displays how many likes a post has' do
      all_posts.each do |post|
        visit user_posts_path(post.author_id)
        expect(page).to have_content(post.likes_counter)
      end
    end

    it 'displays the first comment of post' do
      test_post = Post.find(1)
      Comment.find(4)
      visit user_posts_path(test_post.author_id)
      expect(page).to have_css('.posts-helper-cont')
    end

    it 'redirected to posts page (posts-show)' do
      all_posts.each do |post|
        visit user_posts_path(post.author_id)
        click_link post.title
        expect(page).to have_current_path(user_post_path(post.author_id, post))
        visit user_posts_path(post.author_id)
      end
    end

    it 'redirected back to users page (users-show)' do
      all_posts.each do |post|
        visit user_posts_path(post.author_id)
        expect(page).to have_button('Go Back')
        click_button 'Go Back'
        expect(current_path).to eq(user_path(post.author_id))
      end
    end
  end
end
