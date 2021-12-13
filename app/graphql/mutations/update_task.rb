# frozen_string_literal: true

module Mutations
  class UpdateTask < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: false

    type Types::TaskType

    def resolve(**params)
      result = ::UpdateTask.call(
        task_params: params,
        current_user: current_user
      )
      result.task if result.success?
    end
  end
end
