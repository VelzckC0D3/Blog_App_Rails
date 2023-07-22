require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Request spec for users index' do
    it 'returns a successful response' do
      puts 'Checking HTTP status for users index...'
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      puts 'Expecting to receive the correct template for users index...'
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      puts 'Expecting to receive the correct placeholder text for users index...'
      get '/users'
      expect(response.body).to include('Users')
    end
  end

  describe 'Request spec for users show' do
    it 'returns a successful response' do
      puts 'Expecting to receive a successful response for users show...'
      get '/users/:id'
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      puts 'Expecting to receive the correct template for users show...'
      get '/users/:id'
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      puts 'Expecting to receive the correct placeholder text for users show...'
      get '/users/:id'
      expect(response.body).to include('User Details')
    end
  end
end
