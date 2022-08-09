require 'rails_helper'

RSpec.describe 'post', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create!(name: 'Ekene',
                   photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
                   bio: 'Microverse_student', postcounter: 1)
    end

    let(:post) do
      Post.create!(user:, title: 'Life', text: 'This is what i chose', commentscounter: 0, likescounter: 0)
    end

    let(:comment) do
      Comment.create!(user:, post:, text: 'I love this post')
    end

    it 'shows the user"s post"s body' do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.text)
    end

    it 'shows who wrote the post' do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.user.name)
    end

    it 'shows how many comments it has' do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.commentscounter)
    end

    it 'shows how many likes it has' do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.likescounter)
    end

    it 'shows post title' do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.title)
    end

    it 'shows comment each commentor left' do
      user.save
      post.save
      comment.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.comments.first.text)
    end
  end
end

# I can see the username of each commentor.
# I can see the comment each commentor left.
