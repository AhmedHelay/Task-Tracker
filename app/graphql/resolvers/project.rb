# frozen_string_literal: true

module Resolvers
  class Project < Resolvers::Base
    argument :id, ID, required: true

    type Types::ProjectType, null: true

    def resolve(**params)
      #authorize! Project, to: :show?
      ::Project.find_by(id: params[:id])
    end
  end
end
