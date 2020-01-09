class PostsController < ApplicationController
	before_action :set_post, only: [:show]
	# before_action :authenticate_user!

	def index
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user	

		if @post.save
			redirect_to @post, notice: "Post has been created"
		else
			render :new, notice: "Post could not be created"
		end

	end

	private
	def post_params
		params.require(:post).permit(:date, :rationale)
	end

	def set_post
		@post = Post.find(params[:id])
	end 
end