require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(id: 1, name: 'Kenny', email: 'Kennyegun240@gmail.com', password: '12345678') }
  describe 'Index page' do
    before(:each) do
      sign_in user
      #   Photo: 'https://img.freepik.com/free-psd/save-world-reusable-grocery-bag-mockup_53876-98827.jpg?'
      @group = Group.create(id: 1, user:, name: 'Business', icon: 'https://img.freepik.com/free-psd/save-world-reusable-grocery-bag-mockup_53876-98827.jpg?')
      @entity = Entity.create(id: 1, user:, amount: 13, name: 'Random')
      @entity_group = EntityGroup.create(id: 1, entity: @entity, group: @group)
      @total = 0
      visit group_path(@group.id)
    end

    it 'Should return each user with an image' do
      expect(page).to have_content(@entity.name)
    end

    it 'Should return the each user userName' do
      expect(page).to have_content(@entity.amount)
    end

    # it 'Should return the each user userName' do
    #   expect(page).to have_content(@entity.amount)
    # end

    it 'Should return the each user userName' do
      expect(page).to have_content('Back')
    end

    # it 'Should have a post titkle' do
    #   expect("#{page.current_url}").to match new_group_path()
    # end

    # it 'Should return the number of posts per user' do
    #   expect(page).to have_content(@user.PostCounter)
    # end

    # it 'Should have a post titkle' do
    #   expect(page).to have_content(@post.title)
    # end
    # it 'Should have a post titkle' do
    #   expect(page).to have_content(@post.text.slice(0, 30))
    # end
    # it 'Should have a post titkle' do
    #   expect(page).to have_content(@post.five_recent_comments.first.text)
    # end
    # it 'Should have a post titkle' do
    #   expect(page).to have_content(@post.CommentCounter)
    # end
    # it 'Should have a post titkle' do
    #   expect(page).to have_content(@post.LikesCounter)
    # end

    # it 'Can see a pagination button if there are more posts than fit' do
    #   expect(page).to have_content('Pagination')
    # end

    # it 'Should have a post titkle' do
    #   expect("#{page.current_url}/#{@post.id}").to match user_post_path(@user.id, @post.id)
    # end
  end
end
