require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, name: 'Kenny')
  end

  it 'name must not be blank' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
end
