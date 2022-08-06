require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create!(name: 'Ekene',
                   photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
                   bio: 'Microverse_student', postcounter: 1)
    end

    it 'shows the Username' do
      visit users_path
      expect(user.name).to have_content('Ekene')
    end

    it 'shows the Username' do
      visit users_path
      expect(user.photo).to have_content('https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg')
    end

    it 'shows the Number of posts' do
      visit users_path
      expect(user.postcounter).to eq(1)
    end

    it 'shows the Number of posts' do
      visit users_path
    end

    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end

# When I click on a user, I am redirected to that user's show page.
