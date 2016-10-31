class PostsController < ApplicationController
	# before_action :set_post, only: [:show, :edit, :update, :destroy :miguel testing]
	before_action :authenticate_user!, except: [:index, :show]
#----------------------------------------
	#GET /posts
	#GET /posts.json

	def index
		@posts = Post.all
	end
	#-----------------------------------
	# GET /posts/1
	# GET /posts/1.json
	def show 
		@post = Post.find(params[:id]) 
		@last_post = Post.last
	end
#-------------------------------
	# GET /posts/new
	def new
	@post = Post.new
	@posts = Post.all

		#@post = current_user.posts.build
	end
#--------------------------
	# GET /posts/1/edit
	def edit
		@post = Post.find(params[:id])
		@user = User.find_by(session[:user_id])
		p @user.to_yaml
		end
#----------------------------
	def update
		@post = Post.find(params[:id])
		@post.update(content: params[:post][:content])

		redirect_to '/posts/new'
	
	end
#---------------------------
	# POST /posts
	# POST /posts.json
	def create
		p "james"
		@post = Post.new(post_params)
		# @post = current_user.posts.build(post_params)
		if @post.save
			redirect_to '/posts/new'
		else
			p "FAILED"
			render 'new'
		end
	end
#----------------------
	private

	def post_params
		params.require(:post).permit(:content, :user_id)
	end
#--------------------------
	def destroy
	@post	= Post.find(params[:id])
	@post.destroy

		redirect_to '/posts/new'
	end
#---------------------
	# def set_post

	# end

end
