class DestroyProject
  class PrepareParams
    include Interactor

    delegate :id , :project, to: :context
      
      def call
        context.project = Project.find(id);
        context.fail!(error: "Project doesn't exist") if project.nil?       
      end
  end
end