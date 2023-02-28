require 'rails_helper'
RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, name: 'Kenny')
    @entity = Entity.new(id: 1, user: @user, amount: 1, name: 'Random')
    # @recipe = Recipe.new(id: 1, user: @user, cooking_time: '1hr:45mins', name: 'Rice and Beans', preparation_time: '2hrs',
    #                      description: 'This is the best meal ever')
  end

  it 'name must not be blank' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity.amount = '2hrs'
    expect(@entity).to_not be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity.amount = 2
    expect(@entity).to be_valid
  end

  it 'Check if postscounter is an integer' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end
end
