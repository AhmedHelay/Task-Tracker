# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  current_user = User.first_or_create!(username: 'Ahmed', email: 'ae@gmail.com', password: '123123',
                                       password_confirmation: '123123')
  it 'Should has a name' do
    project = Project.new(
      name: '',
      description: 'A description'
    )
    expect(project).to_not be_valid
    project.name = 'Awesome Project Name'
    expect(project).to be_valid
  end

  it 'Project should be associated with the current_user' do
    project = Project.new(
      name: 'Cool name',
      description: 'A description',
      user_id: current_user.id
    )
    expect(project.user_id).to be == current_user.id
  end
end
