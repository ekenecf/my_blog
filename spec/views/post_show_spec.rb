require 'rails_helper'

RSpec.describe 'users', type: :feature do
    describe 'index page' do
      let(:user) do
        User.create!(name: 'Ekene',
                     photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
                     bio: 'Microverse_student', postcounter: 1)
      end

      let(:post) do 
        Post.create!(user: user, title: 'Life', text: 'This is what i chose', commentscounter: 0, likescounter: 0)
      end

      it 'shows the Username' do
        user.save
        post.save
        visit user_post_path(user)
        expect(page).to have_content(user.name)
      end

      
    end
  end


# I can see the post's title.
# I can see who wrote the post.
# I can see how many comments it has.
# I can see how many likes it has.
# I can see the post body.
# I can see the username of each commentor.
# I can see the comment each commentor left.

