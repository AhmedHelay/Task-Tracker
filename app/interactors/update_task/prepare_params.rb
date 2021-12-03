class UpdateTask
	class PrepareParams 
		include Interactor

		delegate :task_params, :task, to: :context
		
		def call
			context.task = prepare_task
		end

		private

		def prepare_task
			Task.find(task_params[:id])
		end
	end
end