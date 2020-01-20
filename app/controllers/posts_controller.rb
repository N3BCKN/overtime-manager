class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]


	def index
		@posts = Post.post_by current_user
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

	def edit
		authorize @post
	end

	def update
		authorize @post
		if @post.update(post_params)
			redirect_to @post, notice: "Post has been edited successfully"
		end
	end

	def destroy
		@post.delete
		redirect_to posts_path, notice: "Post has been deleted successfully"
	end

	private
	def post_params
		params.require(:post).permit(:date, :rationale, :status, :overtime_request)
	end

	def set_post
		@post = Post.find(params[:id])
	end 
end
