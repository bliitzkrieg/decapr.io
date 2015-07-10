class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@post = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		if @post = Post.create(post_params)
          redirect_to @post
        else
          render :new
        end
	end

	def show	
	end

	private

		def post_params
			params.require(:post).permit(:title, :content)
		end

		def set_post
       		@post = Post.find(params[:id])
    	end
end
