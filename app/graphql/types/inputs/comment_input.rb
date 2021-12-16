# frozen_string_literal: true

module Types
  module Inputs
    class CommentInput < Types::BaseInputObject
      argument :id, ID, required: false
      argument :task_id, Integer, required: true
      argument :content, String, required: true
    end
  end
end
