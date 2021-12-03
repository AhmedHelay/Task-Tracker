module Resolvers
  class Tasks < Resolvers::Base
	
		type [Types::TaskType] , null: false
		
		def resolve(**params)
				::Task.all
			#::Task.where(project_id: params[:project_id])
		end
	end
end