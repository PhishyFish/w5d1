require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new users page' do
      get :new

      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'redirects to user\'s profile' do
        post :create, params: { user: { username: 'ryan', password: 'password' } }
        expect(response).to redirect_to(user_url(User.last))
      end

    end

    context 'with invalid params' do
      it 'presents error to the user' do
        post :create, params: { user: { username: "dog_stuff" } }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end
  end


end
