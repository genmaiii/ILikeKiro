class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to '/posts'
      flash[:notice] = '投稿が送信されました'
    else
      render :index
    end
  end

  def edit
  end
  
  
  private
  def post_params
    params.require(:post).permit(:live_date, :venue, :category, :live_name, :comment)
  end

end
