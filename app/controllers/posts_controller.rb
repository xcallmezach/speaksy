class PostsController < ApplicationController
	before_action :find_post, only: [:show, :destroy]
	def index
		if params[:category].blank?
			@posts = Post.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@posts = Post.where(category_id: @category_id).order("created_at DESC")
		end

		@post = Post.new
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
			
		if @post.save
			redirect_to @post
		else
			render "new"
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :text, :category_id)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
