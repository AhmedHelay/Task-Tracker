# frozen_string_literal: true

module Mutations
  class DestroyProject < BaseMutation
    argument :id, ID, required: true

    type Types::ProjectType

    def resolve(**params)
      ::DestroyProject.call(id: params[:id])
    end
  end
end
