class FriendshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :which_user , only: [:create]
	before_action :which_friendship , only: [:destroy , :accept]
	def create
		current_user.request_friendship(@user)
		redirect_to users_path , notice: 'friend request sent'
	end

	def destroy
		@friendship.destroy
		redirect_to users_path , notice: 'friendship canceled'
	end

	def accept
		@friendship.accept_friendship
		@friendship.create_activity key: 'friendship.accepted' , owner: @friendship.user , recipient: @friendship.friend
		redirect_to users_path , notice: 'friendship accepted'
	end

	private

	def which_user
		@user = User.find(params[:user_id])
	end
	def which_friendship
		@friendship = Friendship.find(params[:id])
	end
end