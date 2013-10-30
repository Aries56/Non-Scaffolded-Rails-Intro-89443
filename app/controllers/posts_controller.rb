class PostsController < ApplicationController
  def index
  	@posts = Post.order('id DESC')
  end #Automatically loads app/views/posts/index.html

  def show
  	@post = Post.find(params[:id])
  end #Automatically loads app/views/posts/show.html
end
