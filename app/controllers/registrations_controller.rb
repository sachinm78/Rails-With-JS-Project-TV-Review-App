class RegistrationsController < Devise::RegistrationsController
    before_action :authenticate_user!

private
    
    def sign_up_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :provider, :uid)
    end
    
    
    def account_update_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :provider, :uid)
    end

end