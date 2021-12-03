module Mutations
  class DestroyTask < BaseMutation
    argument :id , ID , required: true
  
    type Types::TaskType

    def resolve(**params)
      ::DestroyTask.call(task: Task.find(params[:id]))
    end
  end
end
