require 'rails_helper'

RSpec.describe EntitiesController, type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(id: 1, name: 'Kenny', email: 'Kennyegun240@gmail.com', password: '12345678') }


  describe 'GET /index' do
    context 'when page is opened ' do
      before :each do
        sign_in user
        @group = Group.create(id: 1, user:, name: 'Business', icon: 'https://google.com')
      end
      it 'return a correct response' do
        # @user = User.new(id: 1, name: 'kenny')

        get "/groups/#{@group.id}/entities/new"
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
      end
    end
  end
end
