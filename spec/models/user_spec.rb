require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'session tokens' do
    it 'provides session token when no session token is given' do
      cat_user = build(:user)
      expect(cat_user.session_token).not_to be_nil
    end
  end
end
