class LivesController < ApplicationController
  def index
    @lives = Live.all
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    @live.user_id = current_user.id
    if @live.save
      redirect_to '/lives'
      flash[:notice] = 'ライブ名が追加されました'
    else
      render :index
    end
  end

  def edit
    @live = Live.find(params[:id])
    if @live.user == current_user
      render :edit
      flash[:notice] = 'ライブ名が更新されました'
    else
      redirect_to lives_path
    end
  end

  def update
    @live = Live.find(params[:id])
    if @live.update(live_params)
      redirect_to '/lives'
      flash[:notice] = 'ライブ名が更新されました'
    else
      redirect_to '/lives'
      flash[:notice] = 'ライブ名の更新に失敗しました'
    end
  end

  private

  def live_params
    params.require(:live).permit(:name)
  end
end