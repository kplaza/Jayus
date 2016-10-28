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
	end

	# GET /posts/new
	def new
		@post = Post.new
		#@post = current_user.posts.build
	end

	# GET /posts/1/edit
	def edit
	end

	# POST /posts
	# POST /posts.json
	def create
		@post = Post.new(post_params)
		@post.save

		# @post = current_user.posts.build(post_params)
		# if @post.save 
		# 	redirect_to @post 
		# else	
		# 	render 'new'
		# end
	end

	private

	def post_params
		params.require(:post).permit(:content, :body)
	end

	# def set_post

	# end

end
