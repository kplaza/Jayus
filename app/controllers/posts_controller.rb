class PostsController < ApplicationController
	# before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	#GET /posts
	#GET /posts.json

	def index
		@posts = Post.all
	end
	# GET /posts/1
	# GET /posts/1.json
	def show
		@posts = current_user.posts.all
		@last_post = Post.last
	end

	# GET /posts/new
	def new
	@post = Post.new
	@posts = Post.all	

		#@post = current_user.posts.build
	end

	# GET /posts/1/edit
	def edit
	end

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

	private


	def post_params
		params.require(:post).permit(:content, :user_id)
	end

	# def set_post

	# end

end
