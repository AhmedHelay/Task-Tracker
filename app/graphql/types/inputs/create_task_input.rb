# frozen_string_literal: true

module Types
  module Inputs
    class CreateTaskInput < Types::BaseInputObject
      argument :project_id, Integer, required: false
      argument :title, String, required: true
      argument :description, String, required: false
    end
  end
end
