class DestroyProject
  class PrepareParams
    include Interactor

    delegate :id , :project_params, :project, to: :context
      
      def call
        context.fail!(error: "Project doesn't exist") if Project.find_by(id: :id).nil?       
        id = project.id
        project = Project.find(project_params[:id])
      end
  end
end