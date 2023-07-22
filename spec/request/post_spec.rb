require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Request spec for posts index' do
    it 'returns a successful response' do
      puts "Checking HTTP status for posts index..."
      get '/users/:user_id/posts/'
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      puts "Expecting to receive the correct template for posts index..."
      get '/users/:user_id/posts/'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      puts "Expecting to receive the correct placeholder text for posts index..."
      get '/users/:user_id/posts/'
      expect(response.body).to include('User post list')
    end
  end

  describe 'Request spec for posts show' do
    it 'returns a successful response' do
      puts "Expecting to receive a successful response for posts show..."
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      puts "Expecting to receive the correct template for posts show..."
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      puts "Expecting to receive the correct placeholder text for posts show..."
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('User post details')
    end
  end
end