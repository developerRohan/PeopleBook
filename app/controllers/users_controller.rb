class UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :set_user , only: [:show]
  def show

  end

  def index
	 case params[:people]
     when 'friends'
      @users = current_user.active_friends
     when 'pending'
      @users = current_user.friend_requests_sent.map(&:friend)
     when 'requests'
      @users = current_user.friend_requests_recieved.map(&:user)
     else
      @users = User.all
    end
  end

  private

  def set_user
  	@user = User.find_by(user_name: params[:id])
  end
end
