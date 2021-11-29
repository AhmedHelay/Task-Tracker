class CreateTask
    class SaveRecord
      include Interactor
  
      delegate :task_params, to: :context
  
      def call
        context.task = task
        context.fail!(error: "Invalid data") unless task.save 
      end
  
      private
  
      def task
        @task = task.new(task_params)
      end
    end
end