class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
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
      flash[:notice] = '投稿に失敗しました'
    end
  end

  def edit
  end


  private
  
  def post_params
    params.require(:post).permit(:live_date, :venue, :category, :live_name, :comment)
  end

end
