require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Users')
    end
  end
end
