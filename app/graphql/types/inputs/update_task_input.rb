# frozen_string_literal: true

module Types
  module Inputs
    class UpdateTaskInput < Types::BaseInputObject
      argument :id, ID, required: false
      argument :project_id, Integer, required: false
      argument :title, String, required: true
      argument :description, String, required: false
    end
  end
end
