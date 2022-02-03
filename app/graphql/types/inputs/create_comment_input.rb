# frozen_string_literal: true

module Types
  module Inputs
    class CreateCommentInput < Types::BaseInputObject
      argument :task_id, Integer, required: true
      argument :content, String, required: true
    end
  end
end
