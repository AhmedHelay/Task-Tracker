class DestroyTask
  class PrepareParams
    include Interactor

    delegate :id , :task_params, :task, to: :context
      
      def call
        context.fail!(error: "task doesn't exist") if Task.find_by(id: :id).nil?       
        id = task.id
        task = Task.find(task_params[:id])
      end
  end
end
