require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create!(name: 'Ekene',
                   photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
                   bio: 'Microverse_student', postcounter: 1)
    end

    let(:post) do
      Post.create!(user:, title: 'Life', text: 'This is what i chose', commentscounter: 0, likescounter: 0)
    end

    it 'shows the Username' do
      user.save
      post.save
      visit user_path(user)
      expect(page).to have_content(user.name)
    end

    it 'shows the profile picture of user' do
      user.save
      post.save
      visit user_path(user)
      find("img[src='https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg']")
    end

    it 'shows the number of posts' do
      user.save
      post.save
      visit user_path(user)
      expect(page).to have_content(user.postcounter)
    end

    it 'shows the user"s bio' do
      user.save
      post.save
      visit user_path(user)
      expect(page).to have_content(user.bio)
    end

    it 'redirects to all posts when link is clicked' do
      user.save
      post.save
      visit user_path(user)
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(user))
    end

    it 'redirects me to that post"s show page when link is clicked' do
      user.save
      post.save
      visit user_path(user)
      click_link post.title
      expect(page).to have_current_path(user_post_path(user, post))
    end
  end
end
