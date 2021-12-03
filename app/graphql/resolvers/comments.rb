module Resolvers
  class Comments < Resolvers::Base

    argument :task_id, Integer, required: true        
    
    type [Types::CommentType], null: false 

    def resolve(**params)
      ::Comment.all
      #::Comment.where("task_id = ?",params[:id])
    end
  end
end