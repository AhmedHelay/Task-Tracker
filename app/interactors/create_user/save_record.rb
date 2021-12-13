class CreateUser 
  class SaveRecord
    include Interactor::Organizer

    delegate :user_params, :user, to: :context
    def call
      context.user = User.new(user_params)
      context.fail!(errors: "Error occured while creating user") unless user.save!  
    end
  end 
end
