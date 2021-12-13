# frozen_string_literal: true

module Mutations
  class CreateTask < BaseMutation
    argument :project_id, Integer, required: true
    argument :title, String, required: true
    argument :description, String, required: false

    type Types::TaskType

    def resolve(**params)
      result = ::CreateTask.call(
        task_params: params,
        current_user: current_user
      )
      result.task if result.success?
    end
  end
end
