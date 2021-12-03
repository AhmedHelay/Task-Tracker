class UpdateProject
	class PrepareParams 
		include Interactor

		delegate :current_user, :project_params, :project, to: :context
		
		def call
			context.prepared_project_params = prepare_project_params
			context.project = prepare_project
		end

		private

		def prepare_project
			Project.find(project_params[:id])
		end

		def prepare_project_params
			project_params.merge!(user_id: current_user.id)
		end
	end
end
