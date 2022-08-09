require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    let(:user) do
      User.create!(name: 'Ekene',
                   photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
                   bio: 'Microverse_student', postcounter: 0)
    end

    before(:example) { get("/users/#{user.id}/posts") }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct page contents' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let(:user) do
      User.create!(name: 'Ekene',
                   photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
                   bio: 'Microverse_student', postcounter: 0)
    end

    let(:post) do
      Post.create!(title: 'RSpec is a testing tool for Ruby, created for behavior-driven development (BDD).',
                   text: 'This post is to talk about Tests in ruby', likescounter: 0, commentscounter: 0, user:)
    end

    before(:example) { get("/users/#{user.id}/posts/#{post.id}") }

    it 'http response should be sucess' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct page contents' do
      expect(response.body).to include('specific post by a user')
    end

    it 'renders index template' do
      expect(response).to render_template('show')
    end
  end
end
