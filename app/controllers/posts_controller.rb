class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
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
      redirect_to '/posts/new'
      flash[:notice] = '投稿に失敗しました'
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render :edit
    else
      redirect_to posts_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:notice] = '投稿が更新されました'
    else
      render :edit
      flash[:notice] = '投稿の更新に失敗しました'
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  

  private
  
  def post_params
    params.require(:post).permit(:live_date, :venue, :category, :live_name, :comment)
  end

end
