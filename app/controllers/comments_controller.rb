class CommentsController < ApplicationController
	before_action :find_post


	def create
		comment = Comment.create(post_id: params[:post_id], user_id: session[:user_id], content: params[:message])
		@comment = @user.comments.create(params[:comment].permit(:content))
		@comment.user.id = current_user.id
		@comment.save

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end







	private

	def find_post
		@post = Post.find(params[:post_id])
	end


end
