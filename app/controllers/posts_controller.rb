class PostsController < ApplicationController

	before_action :find_post , only: [:edit ,:update,:destroy]

	def create
		@post = current_user.posts.new(post_params)
		@post.save
		redirect_to user_path(@post.user.user_name) ,notice: 'post was created'
	end

	def edit
	end

	def update
		@post.update(post_params)
		redirect_to user_path(@post.user.user_name) ,notice: 'post was updated'
	end

	def destroy
		@post.destroy
		redirect_to user_path(@post.user.user_name) ,notice: 'post was destroyed'
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:content)
	end
end
