# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, :dependent => :destroy

  validates  :project_id, presence: true
  validates  :title, presence: true
end
