# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  has_many :users, through: :project

  validates  :project_id, presence: true
  validates  :title, presence: true
end
