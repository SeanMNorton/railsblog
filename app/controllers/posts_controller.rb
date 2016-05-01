class PostsController < ApplicationController
  # Uses devise to check if user is signed in unless they're on posts show/index pages
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # Orders all posts from newest to oldest created
    @posts = Post.all.order('created_at DESC')
  end

  def new
    # Keeps the new post info; for rendering post if errors check create method
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

  def edit
    @post = Post.find(params[:id])
  end

def update
  @post = Post.find(params[:id])
  if @post.update(params[:post].permit(:title, :body))
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to root_path
end

  private
  # Rails4 strong params, need to define which params to allow
    # Is this a security feature, google it Sean...
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
