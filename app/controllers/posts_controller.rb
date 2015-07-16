class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
    before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		if params[:tag]
			@post =  Post.published(current_user).tagged_with(params[:tag])
		else
			@post = Post.published(current_user).order('created_at DESC')
		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		@post.published_at = params[:post][:publish_now] === "1" ? DateTime.now : nil

		if @post.save
		  flash[:success] = "Your post has been created!"
          redirect_to @post
        else
          render 'new'
        end
	end

	def edit
	end

	def update

		@post.published_at = params[:post][:publish_now] === "1" ? DateTime.now : nil

		if @post.save
          flash[:success] = "Post updated."
          redirect_to posts_path
        else
          flash[:alert] = "Your post failed to update."
          render :edit
        end
	end

	def show	
	end

	def destroy
      @post.destroy
      flash[:success] = "Post deleted."
      redirect_to posts_path
	end

	private

		def post_params
			params.require(:post).permit(:title, :content, :tag_list, :published_at)
		end

		def set_post
       		@post = Post.find(params[:id])
    	end
end
