# frozen_string_literal: true

class Activity < ApplicationRecord
  ALLOWED_KINDS = [
    'Project Created', 'Project Updated', 'Project Destroyed',
    'Task Created', 'Task Updated', 'Task Destroyed',
    'Comment Created', 'Comment Updated'
  ].freeze

  belongs_to :user
  belongs_to :target, polymorphic: true

  validates :user_id, presence: true
  validates :kind, inclusion: { in: ALLOWED_KINDS }
end
