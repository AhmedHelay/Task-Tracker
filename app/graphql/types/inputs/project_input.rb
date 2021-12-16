# frozen_string_literal: true

module Types
  module Inputs
    class ProjectInput < Types::BaseInputObject
      argument :id, ID, required: false
      argument :name, String, required: true
      argument :description, String, required: false
    end
  end
end
