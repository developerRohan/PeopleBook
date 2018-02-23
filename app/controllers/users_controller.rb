class UsersController < ApplicationController
	before_action :set_user , only: [:show]
  def show

  end

  private

  def set_user
  	@user = User.find_by(user_name: params[:id])
  end
end
