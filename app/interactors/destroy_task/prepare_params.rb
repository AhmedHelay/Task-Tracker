class DestroyTask
  class PrepareParams
    include Interactor

    delegate :id , :task,  to: :context
      
      def call
        context.task = Task.find(id)
        context.fail!(error: "task doesn't exist") if task.nil?
      end
  end
end