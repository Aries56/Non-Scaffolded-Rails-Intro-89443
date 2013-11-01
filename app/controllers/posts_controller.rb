class PostsController < ApplicationController
  def index
  	@posts = Post.order('id DESC')
  end #Automatically loads app/views/posts/index.html

  def show
  	@post = Post.find(params[:id])
  end #Automatically loads app/views/posts/show.html

  def new
  	@post = Post.new
  end # Loads app/views/posts/new.html.erb

  def create
  	# The magic of creation happens here!
  	@post = Post.new(params[:post])
  	if @post.save
  		# Redirect to the index action
  		redirect_to :action => :index
  	else
  		# Load up the view associated with the new action.
  		render :action => :new
  	end

  end # On success redirects to index, else uses new.html.erb

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to :action => :index
  end # No destroy.html.erb needs to exist, we always redirect
end
