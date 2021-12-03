module Mutations
  class DestroyProject < BaseMutation

    argument :id , ID , required: true
    
    type Types::ProjectType

    def resolve(**params)
        ::DestroyProject.call(project_params: params[:id])
    end 
  end
end