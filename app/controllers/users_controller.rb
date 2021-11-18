class UsersController < ApplicationController
    before_action :require_login 
    
    def show
        @user = User.find(params[:id])
    end

    private 

    def require_login
        unless current_user
          redirect_to new_user_registration_path
          end
      end
      
end
