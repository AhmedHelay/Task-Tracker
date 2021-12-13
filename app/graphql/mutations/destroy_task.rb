# frozen_string_literal: true

module Mutations
  class DestroyTask < BaseMutation
    argument :id, ID, required: true

    type Types::TaskType

    def resolve(**params)
      ::DestroyTask.call(id: params[:id])
    end
  end
end
