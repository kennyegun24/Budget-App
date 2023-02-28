require 'rails_helper'
RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, name: 'Kenny')
    # @entity = Entity.new(id: 1, user: @user, amount: 1, name: 'Random')
    @group = Group.new(id: 1, user: @user, name: 'Business', icon: 'https://google.com')
  end

  it 'name must not be blank' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'Check if postscounter is an integer' do
    @group.icon = '2hrs'
    expect(@group).to be_valid
  end

  it 'Check if postscounter is an integer' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
