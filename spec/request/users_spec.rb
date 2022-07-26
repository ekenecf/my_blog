require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get('/users') }

    it 'should have an http success response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct page contents' do
      expect(response.body).to include('Here is a list of users')
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before(:example) { get('/users/20') }
    it 'should have an http success response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct page contents' do
      expect(response.body).to include('Specific user')
    end

    it 'renders index template' do
      expect(response).to render_template('show')
    end
  end
end
