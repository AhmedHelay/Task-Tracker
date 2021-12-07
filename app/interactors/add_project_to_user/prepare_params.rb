class AddProjectToUser
  class PrepareParams
    include Interactor

    delegate :email, :user, :project_id, to: :context

    def call
      add_project_to_user
    end

    private

    def add_project_to_user
      context.user = User.find_by(email: email)
      context.fail!(error: "User not found") if user.nil?
    end
  end
end