# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :users
  has_many :activities, as: :target
  
  validates :name, presence: true
end
