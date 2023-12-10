class LivesController < ApplicationController
  def index
  end

  def new
    @live = Live.new
  end
  
  def create
    @live = Live.new(live_params)
    @live.user_id = current_user.id
    if @live.save
      redirect_to post_path
      flash[:notice] = 'ライブが追加されました'
    else
      render :index
    end
  end

  def edit
  end
  
  private

  def live_params
    params.require(:live).permit(:name)
  end
end