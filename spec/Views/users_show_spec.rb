# to execute this test on the console `rspec spec/views/users_show_spec.rb`

require 'rails_helper'

RSpec.describe 'User integration tests', type: :feature do
  before do
    User.create(id: 1, name: 'Timothy Gerard', photo: 'testPicture1.jpg', bio: 'Teacher from Mexico.', posts_counter: 0)
    User.create(id: 2, name: 'Stephanie Diore', photo: 'testPicture2.png', bio: 'Teacher from Poland.',
                posts_counter: 0)

    Post.create(id: 1, author_id: 1, title: 'First Post', text: 'testing', comments_counter: 0, likes_counter: 0)
    Post.create(id: 2, author_id: 2, title: 'Second Post', text: 'testing', comments_counter: 0, likes_counter: 0)
    Post.create(id: 3, author_id: 1, title: 'Third Post', text: 'testing', comments_counter: 0, likes_counter: 0)
    Post.create(id: 4, author_id: 2, title: 'Fourth Post', text: 'testing', comments_counter: 0, likes_counter: 0)
  end

  def all_users
    User.all
  end

  def all_posts
    Post.all
  end



  describe 'users show' do
    it 'displays the user image' do
      all_users.each do |user|
        visit user_path(user)
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'displays the user name' do
      all_users.each do |user|
        visit user_path(user)
        expect(page).to have_content(user.name)
      end
    end

    it 'displays the number of posts' do
      all_users.each do |user|
        visit user_path(user)
        expect(page).to have_content(user.posts_counter)
      end
    end

    it 'displays the bio' do
      all_users.each do |user|
        visit user_path(user)
        expect(page).to have_content(user.bio)
      end
    end

    it 'displays the 3 recent posts' do
      all_users.each do |user|
        visit user_path(user)
        user.recent_posts.each do |post|
          expect(page).to have_content(post.text)
        end
      end
    end

    it 'displays a button to navigate to all posts (posts_index)' do
      all_users.each do |user|
        user_id = user.id
        visit user_path(user_id)
        expect(page).to have_button('See More')
      end
    end

    it 'each post has a link to its description (posts_show)' do
      # I've decided to just make it with the self user ID to make it cleaner
      all_users.each do |user|
        user_id = user.id
        visit user_path(user_id)
        link_id = user_id.to_s
        find("##{link_id}").click
        expect(current_path).to eq(user_post_path(user_id, user_id))
      end
    end


    it 'see more redirect to all user posts (posts_index)' do
      test_user = User.find(1)
      test_user.id
      visit user_path(test_user.id)
      click_button 'See More'
      expect(current_path).to eq(user_posts_path(test_user.id))
    end
  end
end
