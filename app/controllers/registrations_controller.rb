class RegistrationsController < Devise::RegistrationsController

	private

	def sign_up_params
		params.require(:user).permit(:email , :password , :user_name)
	end

	def account_update_params
		params.require(:user).permit(:email , :password , :user_name , :current_password)
	end


end
