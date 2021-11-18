require 'rails_helper'

RSpec.describe Task, type: :model do

  current_user = User.first_or_create!(username: 'Ahmed' ,email: 'ae@gmail.com', password: '123123' , password_confirmation: '123123')
  project = Project.first_or_create(name: 'Cool name',description: 'A description',user_id: current_user.id)

  it 'Should has a title' do 
    task = Task.new(
      title: '',
      description: 'A description',
      project_id: project.id
  )
  expect(task).to_not be_valid
  task.title = 'Hot Title'
  expect(task).to be_valid
  end

  it 'Should should be associated with a project' do 

    task = Task.new(
      title: 'Hot title',
      description: 'A description'
  )
  expect(task).to_not be_valid
  task.project_id =  project.id
  expect(task).to be_valid
  
  end

end
