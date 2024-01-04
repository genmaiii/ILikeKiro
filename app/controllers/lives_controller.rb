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
  end

  private

  def live_params
    params.require(:live).permit(:name)
  end
end