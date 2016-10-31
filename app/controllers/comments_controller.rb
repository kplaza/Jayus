class CommentsController < ApplicationController
	before_action :find_post

def index 
@comment	= Comment.all
end

#-----------------------------------
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)

		if @comment.save
			p "jaaa"
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end
#------------------------------------
def new 
@comment	= Comment.new
@comments =  Comment.all
end
#-------------------------------------
	private
	def comment_params
		params.require(:comment).permit(:user_id, :content, :post_id)
	end

	def find_post
		@post = Post.find(params[:post_id])
	end

#----------------------------------------
end
