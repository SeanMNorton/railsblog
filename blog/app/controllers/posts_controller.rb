class PostsController < ApplicationController

  def index
    # Orders all posts from newest to oldest created
    @posts = Post.all.order('created_at DESC')
  end

  def new
    # Keeps new post info for rendering post if errors
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      # Redirects to 'post/:id' based on saved post_id
      redirect_to @post
    else
      # Renders new post into form if !save
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private
  # Rails4 strong params, need to define which params to allow
    # Is this a security feature, google it Sean...
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
