class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upvote, :downvote]

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Post Success!"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def upvote
    @post = Post.find(params[:id])
    if @post.save
      @post.upvote_by current_user
      flash[:success] = "Upvoted"
    end
    redirect_back fallback_location: root_path
  end

  def downvote
    @post = Post.find(params[:id])
    if @post.save
      @post.downvote_by current_user
      flash[:success] = "Downvoted"
    end
    redirect_back fallback_location: root_path
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :image_url)
  end
end
