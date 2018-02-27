class UsersController < ApplicationController
  before_action :authenticate_user! , only:[:index]
	before_action :set_user , only: [:show]


  def index
	 case params[:people]
     when 'friends'
      @users = current_user.active_friends
     when 'pending'
      @users = current_user.friend_requests_sent.map(&:friend)
     when 'requests'
      @users = current_user.friend_requests_recieved.map(&:user)
     else
      @users = User.all.where.not(id: current_user.id)
    end
  end

  def show
    @post = Post.new
    @posts = @user.posts
    @activities = PublicActivity::Activity.where(owner_id: @user.id)+PublicActivity::Activity.where(recipient_id: @user.id)
  end

  private
  
  def set_user
  	@user = User.find_by(user_name: params[:id])
  end
end
