class ChannelsController < ApplicationController
  def new
    @channel = Channel.new
  end
  
  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    channel = Channel.find(params[:id])
    channel.destroy
    redirect_to root_path
  end

  private

  def channel_params
    params.require(:channel).permit(:channel_name, user_ids: [])
  end
end
