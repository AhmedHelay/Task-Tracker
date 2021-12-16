# frozen_string_literal: true

module Mutations
  class UpdateTask < BaseMutation
    argument :input, Types::Inputs::TaskInput, required: true

    type Types::TaskType

    def resolve(input:)
      result = ::UpdateTask.call(
        task_params: input.to_h,
        current_user: current_user
      )
      result.task if result.success?
    end
  end
end
