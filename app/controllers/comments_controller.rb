class CommentsController < ApplicationController
	before_action :authenticate_user!, except: :create
    before_action :set_post, only: [:create, :destroy]

	def create
		@comment = @post.comments.create(params[:comment].permit(:name, :body))

		if @comment.save
	      redirect_to @post
	    else
	      redirect_to post_path
	    end
	end

	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

	private

		def set_post
	   		@post = Post.find(params[:post_id])
		end
end
