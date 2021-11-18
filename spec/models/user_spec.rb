require 'rails_helper'

RSpec.describe User, type: :model do
/
  to 'Create User' do
    user = User.create!(username: 'Ahmed', email: 'ae@gmail.com' ,password: '123123' ,password_confirmation: '123123' )
    expect(user.id).to eq User.last.id
  end

  to 'User should have username' do
    user = User.create!(email: 'ae@gmail.com' ,password: '123123' ,password_confirmation: '123123' )
    expect(user).to_not be_valid  
  end
/
end
