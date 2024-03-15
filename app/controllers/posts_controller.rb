class PostsController < ApplicationController
  def index
    if params[:latest]
      @posts = Post.latest
    elsif params[:old]
      @posts = Post.old
    elsif params[:most_favorited]
      @posts = Post.most_favorited
    else
      @posts = Post.all
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
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
      render :new
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
