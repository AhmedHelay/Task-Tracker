# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :users
  has_many :tasks
  has_many :user_projects
  has_many :activities, as: :target
  validates :name, presence: true
end
