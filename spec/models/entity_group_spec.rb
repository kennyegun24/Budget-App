require 'rails_helper'
RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, name: 'Kenny')
    @entity = Entity.new(id: 1, user: @user, amount: 1, name: 'Random')
    @group = Group.new(id: 1, user: @user, name: 'Business', icon: 'https://google.com')
    @entity_group = EntityGroup.new(id: 1, entity: @entity, group: @group)
  end

  it 'name must not be blank' do
    @entity_group.entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity_group.entity.amount = '2hrs'
    expect(@entity).to_not be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity_group.entity.amount = 2
    expect(@entity).to be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity_group.entity.amount = nil
    expect(@entity).to_not be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity_group.group.icon = '2hrs'
    expect(@group).to be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity_group.group.icon = nil
    expect(@group).to_not be_valid
  end

  it 'name must not be blank' do
    @entity_group.group.name = nil
    expect(@group).to_not be_valid
  end
end
